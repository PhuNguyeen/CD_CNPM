<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $table = 'category';
    protected $primaryKey = 'categoryID';
    public $timestamps = false;
    protected $fillable = [
        'categoryID',
        'categoryName',
        'categoryImage'
    ];

    public function product()
    {
        return $this->hasMany(Product::class);
    }
}
