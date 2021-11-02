<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    protected $table = 'user';
    protected $primaryKey = 'userID';
    public $timestamps = false;
    protected $fillable = [
        'userID',
        'userPhone',
        'userPass',
        'userName',
        'userEmail',
        'userAvatar',
        'userRole'
    ];
}
