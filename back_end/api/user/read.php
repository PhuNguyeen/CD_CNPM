<?php
// require Model
require_once(realpath(dirname(__FILE__) . '/../Bridge.php'));
$model = 'User';
$bridge = new Bridge($model);

$user = new User();
$result = $user->read();
$len = $result->rowCount();
if($len > 0){
	$user_arr = array();
	$user_arr[$model] = array();
	while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
		extract($row);
		$user_item = array(
			'userID' => $userID,
			'userName' => $userName,
			'userPhone' => $userPhone,
			'userPass' => $userPass,
			'userEmail' => $userEmail,
			'userAvatar' => $userAvatar,
			'userRole' => $userRole
		);
		array_push($user_arr[$model], $user_item);
	}
	echo json_encode($user_arr);
}else{
	$bridge->message('No '.$model.' found.');
}

?>