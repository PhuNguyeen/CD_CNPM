<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use Symfony\Component\HttpFoundation\Response;
use App\Services\CategoryService;

class CategoryController extends Controller
{
    private $categoryService;
    public function __construct(CategoryService $categoryService)
    {
        $this->categoryService = $categoryService;
    }
    public function index()
    {
        try {
            $category = $this->categoryService->getAll();
            return response()->json([
                'status'    => true,
                'code'      => Response::HTTP_OK,
                'data'     => $category,
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
