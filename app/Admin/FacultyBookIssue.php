<?php

namespace App\Admin;

use Illuminate\Database\Eloquent\Model;

class FacultyBookIssue extends Model
{
    protected $table = "faculty_book_issues";

    protected $fillable = ['BT_no', 'book_no', 'issue_date', 'expected_return_date', 'actual_return_date', 'book_condition', 'penalty'];
}
