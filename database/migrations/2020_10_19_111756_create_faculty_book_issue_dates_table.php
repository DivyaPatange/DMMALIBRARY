<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFacultyBookIssueDatesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('faculty_book_issue_dates', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedInteger('faculty_book_issue_id');
            $table->foreign('faculty_book_issue_id')->references('id')->on('faculty_book_issues');
            $table->date('issue_date');
            $table->date('expected_return_date');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('faculty_book_issue_dates');
    }
}
