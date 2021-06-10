@extends('layouts.sa')

@section('content')
    <div class="header bg-gradient-primary pt-2"></div>
    <br>
    <div class="container-fluid mt--6">
        <div class="row">
            <div class="col">
                <div class="card">
                    <!-- Card header -->
                    <div class="card-header border-0">
                        <h3 class="mb-0">Update User</h3>
                    </div>
                    <div class="card-body">
                        <form method="post" action="{{ route('sa_user_edit_save', $post->id) }}" autocomplete="off"
                            enctype="multipart/form-data">
                            @method('PUT')
                            @csrf

                            <h6 class="heading-small text-muted mb-4">User information</h6>
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
                                    <label class="form-control-label" for="input-name">Name *</label>
                                    <input required type="text" name="name" id="input-name"
                                        class="form-control form-control-alternative" placeholder="Name *"
                                        value="{{ $post->name }}" autofocus="">
                                </div>
                                <div class="form-group focused">
                                    <label class="form-control-label" for="input-name">Type</label>
                                    <select name="type" id="input-name" class="form-control form-control-alternative">
                                        @foreach ($type as $t)
                                            <option @if ($t == $post->type)
                                                selected
                                        @endif value="{{ $t }}">{{ $t }}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="form-group focused">
                                    <label class="form-control-label" for="input-name">School</label>
                                    <select name="school_id" id="input-name" class="form-control form-control-alternative">
                                        <option value="-1">-Select-</option>
                                        @foreach ($schools as $sc)
                                            <option @if ($sc->id == $post->school_id)
                                                selected
                                        @endif
                                        value="{{ $sc->id }}">{{ $sc->name }}</option>
                                        @endforeach
                                    </select>
                                </div>

                                <div class="form-group focused">
                                    <label class="form-control-label" for="input-email">Email *</label>
                                    <input required type="email" name="email" id="input-name"
                                        class="form-control form-control-alternative" placeholder="Email *"
                                        value="{{ $post->email }}" autofocus="">
                                </div>
                                <div class="form-group focused">
                                    <label class="form-control-label" for="input-email">Password(leave blank to keep old
                                        password)</label>
                                    <input type="text" name="password" id="input-name"
                                        class="form-control form-control-alternative" placeholder="Password *" value=""
                                        autofocus="">
                                </div>

                                <div class="form-group focused">
                                    <label class="form-control-label" for="input-email">Description</label>
                                    <textarea required name="description"
                                        class="form-control form-control-alternative">{{ $post->description }}</textarea>
                                </div>

                                <div class="form-group focused">
                                    <label class="form-control-label" for="input-email">Profile Image</label>
                                    <input type="file" class="form-control form-control-alternative" name="profile_img" />
                                    @if (isset($post->profile_img))
                                        <img class="thumb-or" src="{{ asset('img') . '/' . $post->profile_img }}" alt="">
                                        <input type="hidden" class="form-control form-control-alternative"
                                            name="profile_img_name" value="{{ $post->profile_img }}" />
                                    @endif
                                </div>

                                <div class="form-group focused">
                                    <label class="form-control-label" for="input-email">Banner Image</label>
                                    <input type="file" class="form-control form-control-alternative" name="banner_img" />
                                    @if (isset($post->banner_img))
                                        <img class="thumb-or" src="{{ asset('img') . '/' . $post->banner_img }}" alt="">
                                        <input type="hidden" class="form-control form-control-alternative"
                                            name="banner_img_name" value="{{ $post->banner_img }}" />
                                    @endif
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
