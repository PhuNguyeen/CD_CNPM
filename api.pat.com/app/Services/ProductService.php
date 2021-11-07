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

    public function getPrice($specificationsID)
    {
        $product = DB::table('specifications')
            ->leftJoin('specifications_has_color', 'specifications.specificationsID', '=', 'specifications_has_color.specificationsID')
            ->leftJoin('specifications_has_ramrom', 'specifications.specificationsID', '=', 'specifications_has_ramrom.specificationsID')
            ->selectRaw('IFNULL(specifications.price, 0) + IFNULL(specifications_has_color.priceColor, 0) + IFNULL(specifications_has_ramrom.priceRamRom, 0) as price')
            ->where('specifications.specificationsID', '=', $specificationsID)
            ->get();

        return $product[0]->price;
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

    public function getRate($productID)
    {
        $rate = DB::table('reviews')
            ->selectRaw('IFNULL(SUM(rate), 0) as rate, IFNULL(COUNT(rate), 0) as countRate')
            ->where('productID', '=', $productID)
            ->get();
        return [$rate[0]->rate, $rate[0]->countRate];
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
