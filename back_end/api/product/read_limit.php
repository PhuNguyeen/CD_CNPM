<?php
// require Model
require_once(realpath(dirname(__FILE__) . '/../Bridge.php'));
$model = 'Product';
$bridge = new Bridge($model);

$product = new Product();
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
        $product_item = array(
            'productID' => $productID,
            'productName' => $productName,
            'productImage' => $productImage,
            'productPrice' => $productPrice,
            'categoryID' => $categoryID,
            'manufacturerID' => $manufacturerID,
        );
        array_push($product_arr[$model], $product_item);
    }
    echo json_encode(array("message" => "Have data", "data" => $product_arr));
} else {
    $bridge->message('No ' . $model . ' found.');
}
