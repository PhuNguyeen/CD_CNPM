import 'package:flutter/material.dart';

const kPrimaryColor = Colors.amberAccent;
//php artisan serve --host 192.168.31.236 --port 8000

// const LOCALHOST = "http://192.168.31.236:8080";
// const LINK_API = "$LOCALHOST/CD_CNPM/back_end/api";
// const LINK_IMAGE_TEST = "$LOCALHOST/CD_CNPM/back_end/public/avatar/avatar.png";
// const LINK_IMAGE_PRODUCT_TEST = "https://cdn.cellphones.com.vn/media/catalog/product/cache/1/thumbnail/220x175/9df78eab33525d08d6e5fb8d27136e95/i/p/ip13-pro_2.jpg";
// const LINK_IMAGE_PRODUCT = "$LOCALHOST/CD_CNPM/back_end/public/image-product";
// const LINK_IMAGE_CATEGORY = "$LOCALHOST/CD_CNPM/back_end/public/image-general";

const LOCALHOST = "http://192.168.31.236:8000";
const LOCALHOST_IMAGE = "http://192.168.31.236:8000/images";
const LINK_API = "$LOCALHOST/api/v1";
const LINK_IMAGE_TEST = "$LOCALHOST_IMAGE/avatar/avatar.png";
const LINK_IMAGE_PRODUCT_TEST =
    "https://cdn.cellphones.com.vn/media/catalog/product/cache/1/thumbnail/220x175/9df78eab33525d08d6e5fb8d27136e95/i/p/ip13-pro_2.jpg";
const LINK_IMAGE_PRODUCT = "$LOCALHOST_IMAGE/product";
const LINK_IMAGE_CATEGORY = "$LOCALHOST_IMAGE/general";

const IS_LOGIN = "IS_LOGIN";
const USER_ID = "USER_ID";
const USER_NAME = "USER_NAME";
const USER_PHONE = "USER_PHONE";
const USER_EMAIL = "USER_EMAIL";
const USER_AVATAR = "USER_AVATAR";
