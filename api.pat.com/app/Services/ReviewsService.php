<?php

namespace App\Services;

use App\Models\Reviews;
use Illuminate\Support\Facades\DB;

class ReviewsService
{
    public function getAll($orderBys = [], $limit = 5, $productID)
    {
        // $reviews = Reviews::query();
        // if ($orderBys) {
        //     $reviews->orderBy($orderBys['column'], $orderBys['sort']);
        // }
        $reviews = Reviews::join('user', 'user.userID', '=', 'reviews.userID')
            ->where('productID', '=', $productID)
            ->select('date', 'userName', 'rate', 'reviewContent')
            ->paginate($limit);

        return $reviews;
    }
}
