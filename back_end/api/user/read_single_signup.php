<?php
// require Model
require_once(realpath(dirname(__FILE__) . '/../Bridge.php'));
$model = 'User';
$bridge = new Bridge($model);
$user = new User();
// get value
$user->userPhone = $bridge->validateValueGet('userPhone');
// api
$user->read_single_signup();
if (is_null($user->userID)) {
	$bridge->message('No ' . $model . ' found');
} else {
	$bridge->message($model . ' exists');
}
