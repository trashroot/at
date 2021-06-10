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
                        <h3 class="mb-0">Add Resource</h3>
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
                        <form method="post" action="{{ route('sa_resources') }}" autocomplete="off"
                            enctype="multipart/form-data">
                            @csrf

                            <h6 class="heading-small text-muted mb-4">Resource information</h6>
                            <div class="pl-lg-4">
                                <div class="form-group focused">
                                    <label class="form-control-label" for="input-name">Content</label>
                                    <textarea required name="name" id="input-name"
                                        class="form-control form-control-alternative" placeholder="Resource Content Here"
                                        value="" autofocus=""></textarea>
                                </div>
                                <div class="form-group focused">
                                    <label class="form-control-label" for="input-name">School</label>
                                    <select name="school_id" id="input-name" class="form-control form-control-alternative">
                                        <option value="-1">-Select-</option>
                                        @foreach ($schools as $sc)
                                            <option value="{{ $sc->id }}">{{ $sc->name }}</option>
                                        @endforeach
                                    </select>
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
