<?php
// require Model
require_once(realpath(dirname(__FILE__) . '/../Bridge.php'));
$model = 'User';
$bridge = new Bridge($model);
$user = new User();
// get value
$user->userPhone = $bridge->validateValueGet('userPhone');
// api
$user->read_single();
if (is_null($user->userID)) {
	$bridge->message('No '.$model.' found.');
}else{
	$user_arr = array(
		'userID' => $user->userID,
		'userName' => $user->userName,
		'userPhone' => $user->userPhone,
		'userPass' => $user->userPass,
		'userEmail' => $user->userEmail,
		'userAvatar' => $user->userAvatar,
		'userRole' => $user->userRole
	);
	echo json_encode($user_arr);
}
?>