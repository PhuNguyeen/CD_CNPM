<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Services\ProductService;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    private $productService;
    public function __construct(ProductService $productService)
    {
        $this->productService = $productService;
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

            $product = $this->productService->getAll($orders, $limit);
            
            foreach ($product->items() as $p) {
                $p['productPrice'] = $this->productService->getMinPrice($p['productID']);
                $p['countProductBill'] = $this->productService->getCountDetailBill($p['productID']);
            }
            return response()->json([
                'status'    => true,
                'code'      => Response::HTTP_OK,
                'data'     => $product->items(),

            ]);
        } catch (\Exception $e) {
            return response()->json([
                'status'    => false,
                'code'      => Response::HTTP_INTERNAL_SERVER_ERROR,
                'message'   => $e->getMessage()
            ]);
        }
    }

    public function getByCategory(Request $request, $categoryID)
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

            $product = $this->productService->ByCategory($orders, $limit, $categoryID);
            
            foreach ($product->items() as $p) {
                $p['productPrice'] = $this->productService->getMinPrice($p['productID']);
                $p['countProductBill'] = $this->productService->getCountDetailBill($p['productID']);
            }
            return response()->json([
                'status'    => true,
                'code'      => Response::HTTP_OK,
                'data'     => $product->items(),

            ]);
        } catch (\Exception $e) {
            return response()->json([
                'status'    => false,
                'code'      => Response::HTTP_INTERNAL_SERVER_ERROR,
                'message'   => $e->getMessage()
            ]);
        }
    }

    public function show($productID)
    {
        try {
            $product = $this->productService->findById($productID);
            return response()->json([
                'status'    => true,
                'code'      => Response::HTTP_OK,
                'user'      => $product,
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
