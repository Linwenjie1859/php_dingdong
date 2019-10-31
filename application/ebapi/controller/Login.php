<?php
/*
 * @Descripttion: 
 * @version: 
 * @Author: Mr. Lin
 * @Date: 2019-09-17 23:47:55
 * @LastEditors: Mr. Lin
 * @LastEditTime: 2019-10-03 21:16:44
 */

 
namespace app\ebapi\controller;

use app\core\util\SmsService;
use think\Cache;
use think\Controller;
use think\Request; 
use service\JsonService;
use service\UtilService;
use app\core\util\MiniProgramService;
use app\core\util\TokenService;
use app\ebapi\model\user\WechatUser;
use app\ebapi\model\user\User;
use app\core\logic\Login as CoreLogin;

use function GuzzleHttp\json_decode;

class Login extends Controller
{

    /*
     * 执行登录
     * */
    public function _empty($name)
    {
        CoreLogin::login_ing($name);
    }

    /**
     * 获取用户信息
     * @param Request $request
     * @return \think\response\Json
     */
    public function index(Request $request)
    {
        //待完善
        $data = UtilService::postMore([
            ['spid', 0],
            ['code', ''],
            ['iv', ''],
            ['encryptedData', ''],
            ['cache_key', ''],
        ], $request); //获取前台传的code
        if (!Cache::has('eb_api_code_' . $data['cache_key'])) return JsonService::status('410', '获取会话密匙失败');
        $data['session_key'] = Cache::get('eb_api_code_' . $data['cache_key']);
        try {
            //解密获取用户信息
            $userInfo = $this->decryptCode($data['session_key'], $data['iv'], $data['encryptedData']);
        } catch (\Exception $e) {
            if ($e->getCode() == '-41003') return JsonService::status('410', '获取会话密匙失败');
        }
        if (!isset($userInfo['openId'])) return JsonService::fail('openid获取失败');
        if (!isset($userInfo['unionId']))  $userInfo['unionId'] = '';
        $userInfo['session_key'] = $data['session_key'];
        $userInfo['spid'] = $data['spid'];
        $userInfo['code'] = $data['code'];
        $dataOauthInfo = WechatUser::routineOauth($userInfo);
        $userInfo['uid'] = $dataOauthInfo['uid'];
        $userInfo['page'] = $dataOauthInfo['page'];
        $userInfo['token'] = TokenService::getToken($userInfo['uid'], $userInfo['openId']);
        if ($userInfo['token'] === false) return JsonService::fail('获取用户访问token失败!');
        $userInfo['status'] = WechatUser::isUserStatus($userInfo['uid']);
        return JsonService::successful($userInfo);
    }

    /**
     * 根据前台传code  获取 openid 和  session_key //会话密匙
     * @param string $code
     * @return array|mixed
     */
    public function setCode(Request $request)
    {
        list($code) = UtilService::postMore([['code', '']], $request, true); //获取前台传的code
        if ($code == '') return JsonService::fail('');
        try {
            $userInfo = MiniProgramService::getUserInfo($code);
        } catch (\Exception $e) {
            return JsonService::fail('获取session_key失败，请检查您的配置！', ['line' => $e->getLine(), 'message' => $e->getMessage()]);
        }
        $cache_key = md5(time() . $code);
        if (isset($userInfo['session_key'])) {
            Cache::set('eb_api_code_' . $cache_key, $userInfo['session_key'], 86400);
            return JsonService::successful(['cache_key' => $cache_key]);
        } else
            return JsonService::fail('获取会话密匙失败');
    }

    /**
     * 解密数据
     * @param string $code
     * @return array|mixed
     */
    public function decryptCode($session = '', $iv = '', $encryptData = '')
    {
        if (!$session) return JsonService::fail('session参数错误');
        if (!$iv) return JsonService::fail('iv参数错误');
        if (!$encryptData) return JsonService::fail('encryptData参数错误');
        return MiniProgramService::encryptor($session, $iv, $encryptData);
    }

    /*********************************************************** */
    /**
     * 获取登录验证码
     * @param Request $request
     */
    public function get_login_code(Request $request)
    {
        $userInfo = UtilService::postMore([
            ['phone', ''],
        ], $request); //获取前台传的code
        if (!$userInfo['phone']) return JsonService::fail('请输入手机号');

        $code = rand(100000, 999999);
        SmsService::sendSms(['code' => $code], $userInfo['phone'], '32');

        cache("login" . $userInfo['phone'], $code, 300);

        return JsonService::successful('发送成功！');
    }

    /**
     * 获取登录验证码
     * @param Request $request
     */
    public function get_register_code(Request $request)
    {
        $userInfo = UtilService::postMore([
            ['phone', ''],
        ], $request); //获取前台传的code
        if (!$userInfo['phone']) return JsonService::fail('请输入手机号');

        $code = rand(100000, 999999);
        SmsService::sendSms(['code' => $code], $userInfo['phone'], '33');

        cache("register" . $userInfo['phone'], $code, 300);
        return JsonService::successful('发送成功！');
    }

    /**
     * @Modify: Mr. Lin
     * @function: 用户手机注册账号
     * @instructions: 对信息进行验证|密码使用md5加密|成功返回token值
     * @param {type} Request $request
     * @return: JSON
     */
    public function register_by_mobile(Request $request)
    {
        $userInfo = UtilService::postMore([
            ['phone', ''],
            ['pwd', ''],
            ['code', ''],
        ], $request);
        if ($userInfo['phone'] == '') return JsonService::fail('手机号码不能为空');
        if ($userInfo['pwd'] == '') return JsonService::fail('密码不能为空');
        // if ($userInfo['code'] == '') return JsonService::fail('验证码不能为空');
        $TEL_REGEXP = "/^1([38]\d|5[0-35-9]|7[3678])\d{8}$/";
        if (!preg_match($TEL_REGEXP, $userInfo['phone']))  return JsonService::fail('手机号码格式不正确');
        if (Cache::get("register" . $userInfo['phone']) != $userInfo['code']) return JsonService::fail('验证码错误,请重新提交');
        $user = User::where('phone', $userInfo['phone'])->find();
        if ($user) return JsonService::fail('手机号码已经注册过了');
        $userInfo['pwd'] = md5($userInfo['pwd']);
        $userInfo['account'] = 'xxx'.$userInfo['phone'].time();
        $dataInfo = User::set($userInfo);
        $userInfo['uid'] = $dataInfo['uid'];
        $userInfo['token'] = TokenService::getToken($userInfo['uid'],$userInfo['phone']);
        if($userInfo['token']===false) return JsonService::fail('获取用户访问token失败!');
        $userInfo['status'] = WechatUser::isUserStatus($userInfo['uid']);
        return JsonService::successful($userInfo);
    }
    /**
     * @Modify: Mr. Lin
     * @function: 查询手机是否被注册
     * @instructions: 
     * @param {type} 
     * @return: JSON
     */
    public function is_unique_mobile(Request $request){
        $userInfo = UtilService::postMore([
            ['phone', ''],
        ], $request);
        $user = User::where('phone', $userInfo['phone'])->find();
        if ($user) return JsonService::fail(false);
        else return JsonService::fail(true);
    }

    /**
     * @Modify: Mr. Lin
     * @function: 根据手机号码和密码登录
     * @instructions: 
     * @param {type} 
     * @return: JSON
     */
    public function login_by_mobile_pwd(Request $request){
        $userInfo = UtilService::postMore([
            ['phone',''],
            ['pwd',''],
        ],$request);//获取前台传的code
        if(!$userInfo['phone']) return JsonService::fail('请输入手机号');
        if(!$userInfo['pwd']) return JsonService::fail('请输入验证码');

        $user = User::where(["phone"=>$userInfo['phone']])->find();
        if(!$user){
            return JsonService::fail('手机号不存在！');
        }
        if(md5($userInfo['pwd']) != $user['pwd']){
            return JsonService::fail('密码错误！');
        }

        $userInfo['uid'] = $user['uid'];
        $userInfo['token'] = TokenService::getToken($user['uid'],$userInfo['phone']);
        if($userInfo['token']===false) return JsonService::fail('获取用户访问token失败!');
        $userInfo['status'] = WechatUser::isUserStatus($userInfo['uid']);
        return JsonService::successful($userInfo);
    }
}
