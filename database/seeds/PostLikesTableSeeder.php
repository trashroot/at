<?php

use Illuminate\Database\Seeder;

class PostLikesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        DB::table('post_likes')->insert([
            'post_id' => 1,
            'user_id' => 4
        ]);

        DB::table('post_likes')->insert([
            'post_id' => 1,
            'user_id' => 5
        ]);

        DB::table('post_likes')->insert([
            'post_id' => 2,
            'user_id' => 4
        ]);

    }
}
