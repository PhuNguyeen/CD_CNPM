<?php

namespace App\Http\Controllers\API;

use App\Services\SpecificationsService;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class SpecificationsController extends Controller
{
    private $specificationsService;
    public function __construct(SpecificationsService $specificationsService)
    {
        $this->specificationsService = $specificationsService;
    }
    public function show($productID)
    {
        try {

            $specifications = $this->specificationsService->getByProductId($productID);

            return response()->json([
                'status'    => true,
                'code'      => Response::HTTP_OK,
                'data'     => $specifications,

            ]);
        } catch (\Exception $e) {
            return response()->json([
                'status'    => false,
                'code'      => Response::HTTP_INTERNAL_SERVER_ERROR,
                'message'   => $e->getMessage()
            ]);
        }
    }
    
    public function showOption($productID)
    {
        try {

            $optionRamRom = $this->specificationsService->getOptionRamRomByProductId($productID);
            $optionColor = $this->specificationsService->getOptionColorByProductId($productID);

            return response()->json([
                'status'    => true,
                'code'      => Response::HTTP_OK,
                'data'     => array('RamRom'=>$optionRamRom->items(), 'Color'=>$optionColor->items(),)

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
