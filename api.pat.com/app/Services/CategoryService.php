<?php

namespace App\Services;

use App\Models\Category;

class CategoryService
{
    public function getAll()
    {
        $query = Category::query()->get();
        return $query;
    }

}
