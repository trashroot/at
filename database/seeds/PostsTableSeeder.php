<?php

use Illuminate\Database\Seeder;

class PostsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
          DB::table('posts')->insert([
            'name' => '',
            'description' => 'Check out this video.It really encourages me to overcome the barriers of injury.',
            'thumb_img' => "video-pic.jpg",
            'video_url' => "https://www.youtube.com/watch?v=Xj5oJvvXyrU",
            'like_count' => 10,
            'comment_count' => 15,
            'user_id' => 3,
            'status' => 1,
        ]);

          DB::table('posts')->insert([
            'name' => '',
            'description' => 'I found this video.Its really good.',
            'thumb_img' => "video-pic.jpg",
            'video_url' => "https://www.youtube.com/watch?v=Xj5oJvvXyrU",
            'like_count' => 6,
            'comment_count' => 6,
            'user_id' => 3,
            'status' => 1,
        ]);

         DB::table('posts')->insert([
            'name' => '',
            'description' => 'Hey Everyone!I found this.Its really good.',
            'thumb_img' => "card-2.jpg",
            'video_url' => "",
            'like_count' => 6,
            'comment_count' => 6,
            'user_id' => 8,
            'status' => 1,
        ]);

         DB::table('posts')->insert([
            'name' => '',
            'description' => 'Its really good.Something real big. only to show what can be there in text format.',
            'thumb_img' => "card-1.jpg",
            'video_url' => "",
            'like_count' => 1,
            'comment_count' => 2,
            'user_id' => 5,
            'status' => 1,
        ]);

         


    }
}
