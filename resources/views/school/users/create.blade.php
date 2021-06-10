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
                        <h3 class="mb-0">Add user</h3>
                    </div>
                    <div class="card-body">
                        @if ($errors->any())
                            <div class="alert alert-danger">
                                <ul>
                                    @foreach ($errors->all() as $error)
                                        <li>{{ $error }}</li>
                                    @endforeach
                                </ul>
                            </div><br />
                        @endif
                        <form method="post" action="{{ route('school_users') }}" autocomplete="off"
                            enctype="multipart/form-data">
                            @csrf

                            <h6 class="heading-small text-muted mb-4">User information</h6>
                            <div class="pl-lg-4">
                                <div class="form-group focused">
                                    <label class="form-control-label" for="input-name">Name *</label>
                                    <input required type="text" name="name" id="input-name"
                                        class="form-control form-control-alternative" placeholder="Name *" value=""
                                        autofocus="">
                                </div>
                                <div class="form-group focused">
                                    <label class="form-control-label" for="input-name">Type</label>
                                    <select name="type" id="input-name" class="form-control form-control-alternative">
                                        @foreach ($type as $t)
                                            <option value="{{ $t }}">{{ $t }}</option>
                                        @endforeach
                                    </select>
                                </div>
                                {{-- <div class="form-group focused">
                                    <label class="form-control-label" for="input-name">School</label>
                                    <select name="school_id" id="input-name" class="form-control form-control-alternative">
                                        <option value="-1">-Select-</option>
                                        @foreach ($schools as $sc)
                                            <option value="{{ $sc->id }}">{{ $sc->name }}</option>
                                        @endforeach
                                    </select>
                                </div> --}}

                                <div class="form-group focused">
                                    <label class="form-control-label" for="input-email">Email *</label>
                                    <input required type="email" name="email" id="input-name"
                                        class="form-control form-control-alternative" placeholder="Email *" value=""
                                        autofocus="">
                                </div>
                                <div class="form-group focused">
                                    <label class="form-control-label" for="input-email">Password *</label>
                                    <input required type="text" name="password" id="input-name"
                                        class="form-control form-control-alternative" placeholder="Password *" value=""
                                        autofocus="">
                                </div>

                                <div class="form-group focused">
                                    <label class="form-control-label" for="input-email">Description</label>
                                    <textarea required name="description"
                                        class="form-control form-control-alternative"></textarea>
                                </div>

                                <div class="form-group focused">
                                    <label class="form-control-label" for="input-email">Profile Image</label>
                                    <input type="file" class="form-control form-control-alternative" name="profile_img" />
                                </div>

                                <div class="form-group focused">
                                    <label class="form-control-label" for="input-email">Banner Image</label>
                                    <input type="file" class="form-control form-control-alternative" name="banner_img" />
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
