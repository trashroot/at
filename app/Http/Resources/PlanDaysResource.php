<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class PlanDaysResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        //return parent::toArray($request);
        //if(is_object($this)){
            return [
                    'label' => $this->label,
                    'title' => $this->title,
                    'description' => $this->description,
                    'day' => $this->day
                ];
        //}
        //else {
        //    return ;
        //}
       
    }
}
