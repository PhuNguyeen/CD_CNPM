<?php 
// headers
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
// initializing our api
include_once('../core/initialize.php');

$post = new Post($conn);
$post->userPhone = isset($_GET['userPhone'])? $_GET['userPhone']:die();
$post->userPass = isset($_GET['userPass'])? $_GET['userPass']:die();

$post->read_signle();
if (is_null($post->userID)) {
	echo json_encode(array('message'=>'No posts found.'));
}else{
	$post_arr = array(
		'userID' => $post->userID,
		'userName' => $post->userName,
		'userPhone' => $post->userPhone,
		'userPass' => $post->userPass,
		'userEmail' => $post->userEmail,
		'userAvatar' => $post->userAvatar,
		'userRole' => $post->userRole
	);
	// echo json_encode($post_arr);
	print_r(json_encode($post_arr));
}


?>