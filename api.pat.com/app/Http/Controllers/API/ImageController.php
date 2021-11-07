<?php

namespace App\Http\Controllers\API;

require 'vendor/autoload.php';

use App\Http\Controllers\Controller;
use Intervention\Image\ImageManagerStatic as Image;


class ImageController extends Controller
{
    public function getImageAvatar($img)
    {
        Image::configure(array('driver' => 'imagick'));
        return Image::make(asset('./../../../../public/images/avatar' . $img))->response();
    }
}
