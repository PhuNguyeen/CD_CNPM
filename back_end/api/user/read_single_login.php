<?php
// require Model
require_once(realpath(dirname(__FILE__) . '/../Bridge.php'));
$model = 'User';
$bridge = new Bridge($model);
$user = new User();
// get value
$user->userPhone = $bridge->validateValueGet('userPhone');
$user->userPass = $bridge->validateValueGet('userPass');
// api
$user->read_single_login();
if (is_null($user->userID)) {
	$bridge->message('Login fail.');
} else {
	$user_item = array(
		'userID' => $userID,
		'userName' => $userName,
		'userPhone' => $userPhone,
		'userEmail' => $userEmail,
		'userAvatar' => $userAvatar,
		'userRole' => $userRole
	);
	echo json_encode(array("message" => "Have data", "data" => $user_arr));
}
