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
            return response()->json([
                'status'    => true,
                'code'      => Response::HTTP_OK,
                'data'     => $product,
                
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'status'    => false,
                'code'      => Response::HTTP_INTERNAL_SERVER_ERROR,
                'message'   => $e->getMessage()
            ]);
        }
    }

    // public function store(Request $request)
    // {
    //     try {
    //         $data = [
    //             'userName'      => $request->userName,
    //             'userPhone'     => $request->userPhone,
    //             'userPass'      => $request->userPass,
    //             'userEmail'     => $request->userEmail,
    //             'userAvatar'    => 'avatar.png',
    //             'userRole'      => 0,
    //         ];
    //         // print_r($request->all());
    //         // print_r($data);
    //         $user = $this->userService->save($data);
    //         return response()->json([
    //             'status'    => true,
    //             'code'      => Response::HTTP_OK,
    //         ]);
    //     } catch (\Exception $e) {
    //         return response()->json([
    //             'status'    => false,
    //             'code'      => Response::HTTP_INTERNAL_SERVER_ERROR,
    //             'message'   => $e->getMessage()
    //         ]);
    //     }
    // }

    // public function update(Request $request, $id)
    // {
    //     try {
    //         $user = $this->userService->save($request->all(), $id);
    //         return response()->json([
    //             'status'    => true,
    //             'code'      => Response::HTTP_OK,
    //         ]);
    //     } catch (\Exception $e) {
    //         return response()->json([
    //             'status'    => false,
    //             'code'      => Response::HTTP_INTERNAL_SERVER_ERROR,
    //             'message'   => $e->getMessage()
    //         ]);
    //     }
    // }
    // public function show($id)
    // {
    //     try {
    //         $user = $this->userService->findById($id);
    //         unset($user[0]['userPass']);
    //         return response()->json([
    //             'status'    => true,
    //             'code'      => Response::HTTP_OK,
    //             'user'      => $user,
    //         ]);
    //     } catch (\Exception $e) {
    //         return response()->json([
    //             'status'    => false,
    //             'code'      => Response::HTTP_INTERNAL_SERVER_ERROR,
    //             'message'   => $e->getMessage()
    //         ]);
    //     }
    // }
}
