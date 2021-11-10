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

    public function getOptionRamRomByProductId($productID)
    {
        $specifications = Specifications::leftJoin('specifications_has_ramrom', 'specifications.specificationsID', '=', 'specifications_has_ramrom.specificationsID')
            ->leftJoin('ramrom', 'ramrom.ramromID', '=', 'specifications_has_ramrom.ramromID')
            ->where('productID', '=', $productID)
            ->selectRaw('ramrom.ramRomID, ramdetail, romDetail, (IFNULL(priceRamRom, 0) + IFNULL(price, 0)) as price'
            );
        return $specifications->paginate(10);
    }

    public function getOptionColorByProductId($productID)
    {
        $specifications = Specifications::leftJoin('specifications_has_color', 'specifications.specificationsID', '=', 'specifications_has_color.specificationsID')
        ->leftJoin('color', 'color.colorID', '=', 'specifications_has_color.colorID')
        ->where('productID', '=', $productID)
            ->selectRaw(
                'color.colorID, colorName, IFNULL(priceColor, 0)  as price'
            );
        return $specifications->paginate(10);
    }
}
