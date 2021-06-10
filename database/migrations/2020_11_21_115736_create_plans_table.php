<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePlansTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('plans', function (Blueprint $table) {
            $table->id();
            $table->Integer('category_id')->nullable();
            $table->Integer('user_id')->nullable();

            $table->string('name');
            $table->string('thumb_img')->nullable();
            $table->string('video_url')->nullable();
            $table->string('description')->nullable();
            $table->string('short_description')->nullable();
            $table->Integer('day_count')->nullable();
            $table->tinyInteger('status')->nullable();
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
        Schema::dropIfExists('plans');
    }
}
