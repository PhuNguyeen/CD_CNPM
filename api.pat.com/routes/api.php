<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::namespace('App\Http\Controllers\API')->prefix('v1')->group(function () {
    Route::resource('product', 'ProductController')->except('create', 'edit');
    Route::resource('user', 'UserController')->except('create', 'edit');
    Route::get('user/login/{user}', 'UserController@login');
    Route::get('user/signIn/{user}', 'UserController@findByUserPhone');
    Route::post('user/avatar/{user}', 'UserController@uploadAvatar');
});
