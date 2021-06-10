<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;
use App\UserPlanDay; 
use Auth;
class PlanDaysCollection extends ResourceCollection
{
    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        $ret = [];
        if(count($this->collection) > 0){
           foreach($this->collection as $item){

                $user_plan_day = UserPlanDay::where('plan_day_id', $item->id)->where('user_id',Auth::id())->first();

                $ret[] = [
                    'id' => $item->id,
                    'plan_id' => $item->plan_id,
                    'label' => $item->label,
                    'title' => $item->title,
                    'description' => $item->description,
                    'day' => $item->day,
                    'thumb_img' => $item->thumb_img ? env("IMG_URL"). $item->thumb_img:"",
                    'is_complete' => (isset($user_plan_day->status) && $user_plan_day->status =="complete") ? true: false,
                ];
           }
            return $ret;
        }
        else {
             return parent::toArray($request);
        }

    }
}
