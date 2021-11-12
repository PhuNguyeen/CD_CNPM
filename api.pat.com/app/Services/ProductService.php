<?php

namespace App\Services;

use App\Models\Product;
use Illuminate\Support\Facades\DB;

class ProductService
{
    public function getAll($orderBys = [], $limit = 10)
    {
        $product = Product::leftjoin('manufacturer', 'manufacturer.manufacturerID', '=', 'product.manufacturerID')
            ->leftjoin('reviews', 'reviews.productID', '=', 'product.productID')
            ->selectRaw('product.productID, productName, productImage, manufacturerName,ROUND(IFNULL(AVG(rate), 0),1) as sumRate, COUNT(userID) as countUser, product.manufacturerID')
            ->groupBy('product.productID', 'product.productName', 'manufacturer.manufacturerName', 'productImage', 'product.manufacturerID');
        if ($orderBys) {
            $product->orderBy($orderBys['column'], $orderBys['sort']);
        }
        return $product->paginate($limit);
    }

    public function ByCategory($orderBys = [], $limit = 10, $categoryID)
    {
        $product = Product::leftjoin('manufacturer', 'manufacturer.manufacturerID', '=', 'product.manufacturerID')
            ->leftjoin('reviews', 'reviews.productID', '=', 'product.productID')
            ->where('product.categoryID', '=', $categoryID)
            ->selectRaw('product.productID, productName, productImage, manufacturerName,ROUND(IFNULL(AVG(rate), 0),1) as sumRate, COUNT(userID) as countUser, product.manufacturerID')
            ->groupBy('product.productID', 'product.productName', 'manufacturer.manufacturerName', 'productImage', 'product.manufacturerID');
        if ($orderBys) {
            $product->orderBy($orderBys['column'], $orderBys['sort']);
        }
        return $product->paginate($limit);
    }

    public function ByManufacturer($orderBys = [], $limit = 10, $manufacturerID)
    {
        $product = Product::leftjoin('manufacturer', 'manufacturer.manufacturerID', '=', 'product.manufacturerID')
            ->leftjoin('reviews', 'reviews.productID', '=', 'product.productID')
            ->where('product.manufacturerID', '=', $manufacturerID)
            ->selectRaw('product.productID, productName, productImage, manufacturerName,ROUND(IFNULL(AVG(rate), 0),1) as sumRate, COUNT(userID) as countUser, product.manufacturerID')
            ->groupBy('product.productID', 'product.productName', 'manufacturer.manufacturerName', 'productImage', 'product.manufacturerID');
        if ($orderBys) {
            $product->orderBy($orderBys['column'], $orderBys['sort']);
        }
        return $product->paginate($limit);
    }

    public function getMinPrice($productID)
    {
        $product = DB::table('specifications')
            ->leftJoin('specifications_has_color', 'specifications.specificationsID', '=', 'specifications_has_color.specificationsID')
            ->leftJoin('specifications_has_ramrom', 'specifications.specificationsID', '=', 'specifications_has_ramrom.specificationsID')
            ->selectRaw('MIN(IFNULL(specifications.price, 0) + IFNULL(specifications_has_color.priceColor, 0) + IFNULL(specifications_has_ramrom.priceRamRom, 0)) as priceMin')
            ->where('specifications.productID', '=', $productID)
            ->get();

        return $product[0]->priceMin;
    }

    public function getCountDetailBill($productID)
    {
        $product = DB::table('specifications')
            ->join('billdetail', 'specifications.specificationsID', '=', 'billdetail.specificationsID')
            ->selectRaw('IFNULL(SUM(billdetail.quantily), 0) as countProductBill')
            ->where('specifications.productID', '=', $productID)
            ->get();

        return $product[0]->countProductBill;
    }

    public function save(array $data, int $id = null)
    {
        Product::updateOrCreate(
            ['userID' => $id],
            $data
        );
    }

    public function findById($id)
    {

        return Product::find($id);
    }

    public function findByUrePhone($userPhone)
    {
        return Product::where('userPhone', '=', $userPhone)->limit(1)->get();
    }
}
