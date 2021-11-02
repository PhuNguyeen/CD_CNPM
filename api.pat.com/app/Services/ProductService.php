<?php

namespace App\Services;

use App\Models\Product;
use Illuminate\Support\Facades\DB;

class ProductService
{
    public function getAll($orderBys = [], $limit = 10)
    {
        $product = Product::query();
        if ($orderBys) {
            $product->orderBy($orderBys['column'], $orderBys['sort']);
        }
        // echo $product->manufacturer->manufacturerName;
        // print_r($product);
        // $product = DB::table('product')
        //     ->join('manufacturer', 'product.manufacturerID', '=', 'manufacturer.manufacturerID')
        //     ->select('product.productID', 'product.productName', 'product.productImage', 'manufacturer.manufacturerName')
        //     ->get();

        return $product->paginate($limit);
    }

    public function getPrice($orderBys = [], $limit = 10)
    {
        $product = Product::query();
        if ($orderBys) {
            $product->orderBy($orderBys['column'], $orderBys['sort']);
        }
        // echo $product->manufacturer->manufacturerName;
        // print_r($product);
        // $product = DB::table('product')
        //     ->join('manufacturer', 'product.manufacturerID', '=', 'manufacturer.manufacturerID')
        //     ->select('product.productID', 'product.productName', 'product.productImage', 'manufacturer.manufacturerName')
        //     ->get();

        return $product->paginate($limit);
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
