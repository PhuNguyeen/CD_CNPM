<?php
// require Model
require_once(realpath(dirname(__FILE__) . '/../Bridge.php'));
$model = 'Manufacturer';
$bridge = new Bridge($model);

$manufacturer = new Manufacturer();
$result = $manufacturer->read();
$len = $result->rowCount();
if($len > 0){
	$manufacturer_arr = array();
	$manufacturer_arr[$model] = array();
	while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
		extract($row);
		$manufacturer_item = array(
			'manufacturerID' => $manufacturerID,
			'manufacturerName' => $manufacturerName,
			'manufacturerAvatar' => $manufacturerAvatar,
		);
		array_push($manufacturer_arr[$model], $manufacturer_item);
	}
	echo json_encode(array("message" => "Have data", "data" => $manufacturer_arr));
}else{
	$bridge->message('No '.$model.' found.');
}
