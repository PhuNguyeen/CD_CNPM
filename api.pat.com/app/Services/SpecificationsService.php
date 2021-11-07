<?php

namespace App\Services;

use App\Models\Specifications;
use Illuminate\Support\Facades\DB;

class SpecificationsService
{
    public function getByProductId($productID)
    {
        $specifications = Specifications::where('productID', '=', $productID)
            ->select('*')
            ->get();
        return $specifications;
    }

    public function getOptionByProductId($productID)
    {
        $specifications = Specifications::leftJoin('specifications_has_color', 'specifications.specificationsID', '=', 'specifications_has_color.specificationsID')
            ->leftJoin('specifications_has_ramrom', 'specifications.specificationsID', '=', 'specifications_has_ramrom.specificationsID')
            ->where('productID', '=', $productID)
            ->selectRaw(
                'specifications.specificationsID, ramRomID, colorID, (IFNULL(priceColor, 0) + IFNULL(priceRamRom, 0) + IFNULL(price, 0)) as price'
            );
        return $specifications->paginate(10);
    }
}
