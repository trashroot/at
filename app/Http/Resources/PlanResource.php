<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\PlanDay;
use App\UserPlan;
use Auth;

class PlanResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        $user_plan = UserPlan::where('plan_id', $this->id)->where('user_id',Auth::id())->first();

       return [
            'id' => $this->id,
            'name' => $this->name,
            'is_liked' => isset($user_plan),
            'is_complete' => (isset($user_plan->status) && $user_plan->status =="complete") ? true: false,
            'thumb_img' => $this->thumb_img ? env("IMG_URL"). $this->thumb_img:"",
            'video_url' => $this->video_url,
            'description' => $this->description,
            'short_description' => $this->short_description,
            'days'=> new PlanDaysCollection(
                PlanDay::where('plan_id',$this->id)    
               ->orderBy('day', 'asc')
               ->get()
            )
        ];
    }
}
