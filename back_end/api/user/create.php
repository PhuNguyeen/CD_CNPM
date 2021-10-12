<?php
// header
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, X-Requested-With');
// require Model
require_once(realpath(dirname(__FILE__) . '/../Bridge.php'));
$model = 'User';
$bridge = new Bridge($model);
$user = new User();
// get raw posted data
$data = json_decode(file_get_contents("php://input"));
//
$user->userName 	= $data->userName;
$user->userPhone 	= $data->userPhone;
$user->userPass 	= $data->userPass;
$user->userEmail 	= $data->userEmail;
$user->userAvatar 	= $data->userAvatar;
$user->userRole 	= $data->userRole;

if ($user->create()) {
	$bridge->message('Create '.$model.' successful.');
}else{
	$bridge->message('Create '.$model.' fail.');
}
?>