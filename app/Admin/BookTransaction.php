<?php

namespace App\Admin;

use Illuminate\Database\Eloquent\Model;

class BookTransaction extends Model
{
    protected $table = "book_transactions";

    protected $fillable = ['BT_no', 'book_code', 'issue_date', 'expected_return_date', 'actual_return_date', 'penalty']; 
}
