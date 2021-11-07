<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;

use Symfony\Component\HttpFoundation\Response;
use Illuminate\Http\Request;
use App\Services\ReviewsService;


class ReviewsController extends Controller
{
    private $reviewsService;
    public function __construct(ReviewsService $reviewsService)
    {
        $this->reviewsService = $reviewsService;
    }
    public function index(Request $request)
    {
        try {
            $limit = $request->get('limit') ?? 10;
            $orders = [];
            if ($request->get('column') && $request->get('sort')) {
                $orders = [
                    'column' => $request->get('column'),
                    'sort' => $request->get('sort'),
                ];
            }
            $reviews = $this->reviewsService->getAll($orders, $limit, $request->get('productID'));

            return response()->json([
                'status'    => true,
                'code'      => Response::HTTP_OK,
                'data'     => $reviews->items(),
            ]);
            
        } catch (\Exception $e) {
            return response()->json([
                'status'    => false,
                'code'      => Response::HTTP_INTERNAL_SERVER_ERROR,
                'message'   => $e->getMessage()
            ]);
        }
    }
}
