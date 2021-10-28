<?php
// require Model
require_once(realpath(dirname(__FILE__) . '/../Bridge.php'));
$model = 'Product';
$bridge = new Bridge($model);
$bridge2 = new Bridge('Manufacturer');

$product = new Product();
$manufacturer = new Manufacturer();
//
$start = $bridge->validateValueGet('start');
$limit = $bridge->validateValueGet('limit');
//
$result = $product->read($start, $limit);
$len = $result->rowCount();
if ($len > 0) {
    $product_arr = array();
    $product_arr[$model] = array();
    while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
        extract($row);
        $productPrice = $product->price($productID);
        $countProductBill = $product->countProductBill($productID);
        $rate = $product->countUserRate($productID);
        $manufacturer->loadByID($manufacturerID);
        if (floatval($rate['countUser']) > 0) {
            $rateTB = floatval($rate['sumRate']) / floatval($rate['countUser']);
        } else {
            $rateTB = 0;
        }
        $product_item = array(
            'productID' => $productID,
            'productName' => $productName,
            'productImage' => $productID . "1.png",
            'productPrice' => $productPrice,
            'manufacturerName' => $manufacturer->manufacturerName,
            'countUser' => $rate['countUser'],
            'sumRate' => strval(round($rateTB, 1)),
            'countProductBill' => $countProductBill
        );
        array_push($product_arr[$model], $product_item);
    }
    echo json_encode(array("message" => "Have data", "data" => $product_arr));
} else {
    $bridge->message('No ' . $model . ' found.');
}
