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
$user->userID = $data->userID;

if ($user->delete()) {
	$bridge->message('Delete '.$model.' successful.');
}else{
	$bridge->message('Delete '.$model.' fail.');
}
?>