<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFacultyBookIssuesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('faculty_book_issues', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('BT_no');
            $table->string('book_no');
            $table->date('actual_return_date')->nullable();
            $table->string('book_condition')->nullable();
            $table->string('penalty')->nullable();
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
        Schema::dropIfExists('faculty_book_issues');
    }
}
