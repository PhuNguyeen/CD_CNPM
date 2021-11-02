<?php

namespace App\Services;

use App\Models\User;

class UserService
{
    public function getAll($orderBys = [], $limit = 10)
    {
        $query = User::query();
        if ($orderBys) {
            $query->orderBy($orderBys['column'], $orderBys['sort']);
        }
        return $query->paginate($limit);
    }

    public function save(array $data, int $id = null)
    {
        User::updateOrCreate(
            ['userID' => $id],
            $data
        );
    }

    public function findById($id)
    {
        return User::find($id);
    }

    public function findByUrePhone($userPhone)
    {
        return User::where('userPhone', '=', $userPhone)->limit(1)->get();
    }

    // upload Avatar
    public function uploadAvatar($userPhone)
    {
        $allowedExts = array("gif", "jpeg", "jpg", "png");
        if (isset($_FILES["file"])) {
            // select userID
            $user = $this->findByUrePhone($userPhone);
            // upload image
            $temp = explode(".", $_FILES["file"]["name"]);
            $setfilename =  'avatar' . $user[0]['userID'] . '.' . end($temp);
            if ((($_FILES["file"]["type"] == "image/gif")
                    || ($_FILES["file"]["type"] == "image/jpeg")
                    || ($_FILES["file"]["type"] == "image/jpg")
                    || ($_FILES["file"]["type"] == "image/x-png")
                    || ($_FILES["file"]["type"] == "image/png"))
                && in_array(end($temp), $allowedExts)
            ) {
                if ($_FILES["file"]["error"] > 0) {
                    return 'Error: ' . $_FILES["file"]["error"];
                } else {
                    // Move the file to the uploads folder
                    move_uploaded_file($_FILES["file"]["tmp_name"], "./../public/images/avatar/" . $setfilename);
                    $vars = $this->save(['userAvatar'    => $setfilename], $user[0]['userID']);
                    return "Successful.";
                }
            } else {
                // File type was invalid
                return "Invalid File Type";
            }
        } else {
            // File type was invalid
            return "No file found.";
        }
    }
}
