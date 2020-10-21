<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBookBanksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('book_banks', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('book_no');
            $table->string('BT_no');
            $table->date('issue_date');
            $table->date('expected_return_date');
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
        Schema::dropIfExists('book_banks');
    }
}
