<?php

use Illuminate\Database\Seeder;

class PlanDaysTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        DB::table('plan_days')->insert([
            'label' => 'Day 1',
            'plan_id' => 1,
            'title' => "Behavioral health",
            'description' => 'techniques for practicing mindfulness lorem ipum',
            'day' => '1'
        ]);
        DB::table('plan_days')->insert([
            'label' => 'Day 2',
            'plan_id' => 1,
            'title' => "Behavioral health issue 2",
            'description' => 'techniques for practicing mindfulness lorem ipum in more detail',
            'day' => '1'
        ]);
      
    }
}
