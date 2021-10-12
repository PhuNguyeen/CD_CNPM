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
$user->userID 		= $data->userID;
$user->userName 	= $data->userName;
$user->userPhone 	= $data->userPhone;
$user->userPass 	= $data->userPass;
$user->userEmail 	= $data->userEmail;
$user->userAvatar 	= $data->userAvatar;
$user->userRole 	= $data->userRole;

if ($user->update()) {
	$bridge->message('Update '.$model.' successful.');
}else{
	$bridge->message('Update '.$model.' fail.');
}
?>