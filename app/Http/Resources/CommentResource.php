<?php

namespace App\Http\Resources;
use App\Http\Resources\UserResource ;

use Illuminate\Http\Resources\Json\JsonResource;
use App\User;

class CommentResource extends JsonResource
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
                    'id' => $this->id,
                    'post_id' => $this->post_id,
                    'description' => $this->description,
                    'user'=> new UserResource(User::find($this->user_id))
                ];

    }
}
