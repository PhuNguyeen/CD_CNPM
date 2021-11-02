<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Manufacturer extends Model
{
    protected $table = 'manufacturer';
    protected $primaryKey = 'manufacturerID';
    public $timestamps = false;
    protected $fillable = [
        'manufacturerID',
        'manufacturerName',
        'manufacturerImage'
    ];

    public function product()
    {
        return $this->hasMany(Product::class, 'manufacturerID');
    }
}
