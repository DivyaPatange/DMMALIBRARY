<?php

namespace App\Admin;

use Illuminate\Database\Eloquent\Model;

class BookBank extends Model
{
    protected $table = "book_banks";

    protected $fillable = ['book_no', 'expected_return_date', 'actual_return_date', 'book_condition', 'penalty'];
}
