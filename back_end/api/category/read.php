<?php
// require Model
require_once(realpath(dirname(__FILE__) . '/../Bridge.php'));
$model = 'Category';
$bridge = new Bridge($model);

$category = new Category();
$result = $category->read();
$len = $result->rowCount();
if($len > 0){
	$category_arr = array();
	$category_arr[$model] = array();
	while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
		extract($row);
		$category_item = array(
			'categoryID' => $categoryID,
			'categoryName' => $categoryName,
			'categoryAvatar' => $categoryAvatar,
		);
		array_push($category_arr[$model], $category_item);
	}
	echo json_encode(array("message" => "Have data", "data" => $category_arr));
}else{
	$bridge->message('No '.$model.' found.');
}
