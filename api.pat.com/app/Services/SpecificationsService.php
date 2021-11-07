<?php

namespace App\Services;

use App\Models\Specifications;
use Illuminate\Support\Facades\DB;

class SpecificationsService
{
    public function getByProductId($productID)
    {
        $product = Specifications::query();
        return $product;
    }

}
