<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource
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
        return [
            //'id' => $this->id,
            'name' => $this->name,
            'profile_img' => $this->profile_img ? env("IMG_URL") . $this->profile_img : env("IMG_URL") . "user-profile.png",
            'banner_img' => $this->banner_img ? env("IMG_URL") . $this->banner_img : env("IMG_URL") . "user-cover.jpg",
            'phone' => $this->phone,
            'email' => $this->email,
            'description' => $this->description,
            'streak_count' => $this->streak_count,
            'school_id' => $this->school_id,
        ];

    }
}
