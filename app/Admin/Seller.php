<?php

namespace App\Admin;

use Illuminate\Database\Eloquent\Model;

class Seller extends Model
{
    protected $table = "sellers";

    protected $fillable = ['seller_name'];
}
