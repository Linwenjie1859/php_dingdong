<?php
/**
 *
 * @author: xaboy<365615158@qq.com>
 * @day: 2017/11/11
 */
namespace app\admin\controller\book;

use app\admin\controller\AuthController;


/**
 * 用户管理控制器
 * Class User
 * @package app\admin\controller\user
 */
class Book extends AuthController{
    public function index(){
        return $this->fetch();
    }
}