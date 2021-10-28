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
if (isset($_POST['data'])) {
	$data = json_decode($_POST['data']);
	// get data
	$user->userName 	= $data->userName;
	$user->userPhone 	= $data->userPhone;
	$user->userPass 	= $data->userPass;
	$user->userEmail 	= $data->userEmail;
	$user->userAvatar 	= "avatarTeam.png";
	$user->userRole 	= 0;
	// create user
	$message_create = $user->create();
	if ($message_create == 'Successful.') {
		$message_image = $user->uploadAvatar();
		$bridge->message(array('create' => $message_create, 'image' => $message_image));
	} else {
		$bridge->message(array('create' => $message_create, 'image' => ''));
	}
} else {
	$bridge->message(array('create' => 'No data found.', 'image' => ''));
}
