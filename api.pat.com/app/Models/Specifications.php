<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Specifications extends Model
{
    protected $table = 'specifications';
    protected $primaryKey = 'specificationsID';
    public $timestamps = false;
    protected $fillable = [
        'specificationsID',
        'price',
        'screen',
        'fontCamera',
        'rearCamera',
        'cpu',
        'simSlot',
        'battery',
        'design',
        'especially',
        'productID'
    ];

}
