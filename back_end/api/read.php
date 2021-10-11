<?php 
// headers
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
// initializing our api
include_once('../core/initialize.php');

$post = new Post($conn);

$result = $post->read();

$len = $result->rowCount();

if($len > 0){
	$post_arr = array();
	$post_arr['data'] = array();
	while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
		extract($row);
		$post_item = array(
			'userID' => $userID,
			'userName' => $userName,
			'userPhone' => $userPhone,
			'userPass' => $userPass,
			'userEmail' => $userEmail,
			'userAvatar' => $userAvatar,
			'userRole' => $userRole
		);
		array_push($post_arr['data'], $post_item);
	}
	echo json_encode($post_arr);
}else{
	echo json_encode(array('message'=>'No posts found.'));
}

?>