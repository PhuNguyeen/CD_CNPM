<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Services\UserService;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Http\Request;

use function PHPUnit\Framework\isNull;

class UserController extends Controller
{
    private $userService;
    public function __construct(UserService $userService)
    {
        $this->userService = $userService;
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
            $user = $this->userService->getAll($orders, $limit);
            return response()->json([
                'status'    => true,
                'code'      => Response::HTTP_OK,
                'data'     => $user->items(),
                'meta'      => [
                    'total'         => $user->total(),
                    'perPage'       => $user->perPage(),
                    'currentPage'   => $user->currentPage(),
                ],
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'status'    => false,
                'code'      => Response::HTTP_INTERNAL_SERVER_ERROR,
                'message'   => $e->getMessage()
            ]);
        }
    }

    public function store(Request $request)
    {
        try {
            $data = [
                'userName'      => $request->userName,
                'userPhone'     => $request->userPhone,
                'userPass'      => $request->userPass,
                'userEmail'     => $request->userEmail,
                'userAvatar'    => 'avatar.png',
                'userRole'      => 0,
            ];
            // print_r($request->all());
            // print_r($data);
            $user = $this->userService->save($data);
            return response()->json([
                'status'    => true,
                'code'      => Response::HTTP_OK,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'status'    => false,
                'code'      => Response::HTTP_INTERNAL_SERVER_ERROR,
                'message'   => $e->getMessage()
            ]);
        }
    }

    public function update(Request $request, $id)
    {
        try {
            $user = $this->userService->save($request->all(), $id);
            return response()->json([
                'status'    => true,
                'code'      => Response::HTTP_OK,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'status'    => false,
                'code'      => Response::HTTP_INTERNAL_SERVER_ERROR,
                'message'   => $e->getMessage()
            ]);
        }
    }
    public function show( $id)
    {
        try {
            $user = $this->userService->findById($id);
            unset($user[0]['userPass']);
            return response()->json([
                'status'    => true,
                'code'      => Response::HTTP_OK,
                'user'      => $user,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'status'    => false,
                'code'      => Response::HTTP_INTERNAL_SERVER_ERROR,
                'message'   => $e->getMessage()
            ]);
        }
    }

    public function login(Request $request, $userPhone)
    {
        try {
            $user = $this->userService->findByUrePhone($userPhone);
            if (!sizeof($user) || $user[0]['userPass'] != $request->get('userPass')) {
                $user  = 'Login fail';
            }else {
                unset($user[0]['userPass']);
            }
            return response()->json([
                'status'    => true,
                'code'      => Response::HTTP_OK,
                'data'      => $user,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'status'    => false,
                'code'      => Response::HTTP_INTERNAL_SERVER_ERROR,
                'message'   => $e->getMessage()
            ]);
        }
    }

    public function findByUserPhone($userPhone)
    {
        try {
            $user = $this->userService->findByUrePhone($userPhone);
            if (!sizeof($user)) {
                $message  = 'No User found';
            }else{
                $message  = 'User exists';
            }
            return response()->json([
                'status'    => true,
                'code'      => Response::HTTP_OK,
                'message'      => $message,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'status'    => false,
                'code'      => Response::HTTP_INTERNAL_SERVER_ERROR,
                'message'   => $e->getMessage()
            ]);
        }
    }

    public function uploadAvatar($userPhone)
    {
        try {
            $message = $this->userService->uploadAvatar($userPhone);
            return response()->json([
                'status'    => true,
                'code'      => Response::HTTP_OK,
                'message'   => $message,
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
