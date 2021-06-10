@extends('layouts.school')

@section('content')
    <div class="header bg-gradient-primary pt-2"></div>
    <br>
    <div class="container-fluid mt--6">
        <div class="row">
            <div class="col">
                <div class="card">
                    <!-- Card header -->
                    <div class="card-header border-0">
                        <h3 class="mb-0">Update Post</h3>
                    </div>
                    <div class="card-body">
                        <form method="post" action="{{ route('school_post_edit_save', $post->id) }}" autocomplete="off"
                            enctype="multipart/form-data">
                            @method('PUT')
                            @csrf

                            <h6 class="heading-small text-muted mb-4">Post information</h6>
                            @if ($errors->any())
                                <div class="alert alert-danger">
                                    <ul>
                                        @foreach ($errors->all() as $error)
                                            <li>{{ $error }}</li>
                                        @endforeach
                                    </ul>
                                </div>
                                <br />
                            @endif
                            <div class="pl-lg-4">
                                <div class="form-group focused">
                                    <label class="form-control-label" for="input-name">Name</label>
                                    <input type="text" name="name" id="input-name"
                                        class="form-control form-control-alternative" placeholder="Name"
                                        value="{{ $post->name }}" autofocus="">
                                </div>
                                <div class="form-group focused">
                                    <label class="form-control-label" for="input-email">Description</label>
                                    <textarea name="description"
                                        class="form-control form-control-alternative">{{ $post->description }}</textarea>
                                </div>

                                <div class="form-group focused">
                                    <label class="form-control-label" for="input-email">Thumb Image</label>
                                    <input type="hidden" value="{{ $post->thumb_img }}" name="thumb_img_value" />
                                    <input type="file" class="form-control form-control-alternative" name="thumb_img" />
                                </div>

                                <div class="form-group focused">
                                    <label class="form-control-label" for="input-email">Video URL</label>
                                    <textarea name="video_url"
                                        class="form-control form-control-alternative">{{ $post->video_url }}</textarea>
                                </div>

                                <div class="text-center">
                                    <button type="submit" class="btn btn-success mt-4">Save</button>
                                </div>
                            </div>
                        </form>

                    </div>


                </div>
            </div>
        </div>
    </div>
    @include('layouts.footers.auth')
@endsection
