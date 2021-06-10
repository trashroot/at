<?php

use Illuminate\Database\Seeder;

class plansTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
         DB::table('plans')->insert([
            'name' => 'Take a moment',
            'category_id' => 1,
            'user_id' => 3,
            'short_description' => 'techniques for practicing mindfulness',
            'thumb_img' => 'login.jpg',
            'day_count' => '2',
            'status' => 1
        ]);

         DB::table('plans')->insert([
            'name' => 'Take a moment 2',
            'category_id' => 1,
            'user_id' => 3,
            'short_description' => 'techniques for practicing mindfulness',
            'thumb_img' => 'card-2.jpg',
            'status' => 1
        ]);

         DB::table('plans')->insert([
            'name' => 'Take a moment 3',
            'category_id' => 1,
            'user_id' => 3,
            'short_description' => 'techniques for practicing mindfulness',
            'thumb_img' => 'card-3.jpg',
            'status' => 1
        ]);

         DB::table('plans')->insert([
            'name' => 'Take a moment 2',
            'category_id' => 2,
            'user_id' => 3,
            'short_description' => 'techniques for practicing mindfulness',
            'thumb_img' => 'card-2.jpg',
            'status' => 1
        ]);

         DB::table('plans')->insert([
            'name' => 'Mental health for sportsmen',
            'category_id' => 2,
            'user_id' => 3,
            'short_description' => 'techniques for practicing mindfulness',
            'thumb_img' => 'card-5.jpg',
            'status' => 1
        ]);

         DB::table('plans')->insert([
            'name' => 'Motivation video',
            'category_id' => 3,
            'user_id' => 3,
            'short_description' => 'techniques for practicing mindfulness',
            'thumb_img' => 'card-5.jpg',
            'status' => 1
        ]);



    }
}
