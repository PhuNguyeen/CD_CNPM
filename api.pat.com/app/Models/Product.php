<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $table = 'product';
    protected $primaryKey = 'productID';
    public $timestamps = false;
    protected $fillable = [
        'productID',
        'productName',
        'productImage',
        'productDescription',
        'categoryID ',
        'manufacturerID '
    ];

    public function manufacturer()
    {
        return $this->belongsTo(Manufacturer::class, 'manufacturerID');
    }
}
