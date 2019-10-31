<?php
namespace app\index\controller;

use think\Config;

class Index
{
    public function index(){
        // $userInfo = UtilService::postMore([
        //     ['phone',''],
        //     ['pwd',''],
        //     ['code',''],
        // ],$request);//获取前台传的code
        // if(!$userInfo['phone']) return JsonService::fail('请输入手机号');
        // if(!$userInfo['pwd']) return JsonService::fail('请输入密码');
        // if(!$userInfo['code']) return JsonService::fail('请输入手机验证码');
            $userInfo=[
                'name'=>'Linwenjie',
                'age'=>'',
                'job'=>'PHP',
                'money'=>'many'
            ];
            dump(array_key_exists('name',$userInfo));
    }
}


