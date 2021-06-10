<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\UserResource ;
use App\User;
use App\PostLike;
use Auth;
class PostResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        //var_dump($request);
        //return parent::toArray($request);
        $user_like = PostLike::where('post_id', $this->id)->where('user_id',Auth::id())->first();
        return [
            'id' => $this->id,
            //'user_id'=>$this->user_id,
            'name' => $this->name,
            'thumb_img' => $this->thumb_img ? env("IMG_URL"). $this->thumb_img:"",
            'video_url' => $this->video_url,
            'description' => $this->description,
            'like_count' => $this->like_count,
            'comment_count' => $this->comment_count,
            'is_liked' => (isset($user_like) && $user_like != null) ? true: false,
            'user'=> new UserResource(User::find($this->user_id)),
            
        ];
    }
}
