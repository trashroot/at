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
                        <form method="post" action="{{ route('sa_user_bulk_confirm') }}" autocomplete="off"
                            enctype="multipart/form-data">
                            @csrf

                            <h6 class="heading-small text-muted mb-4">Bulk Import information</h6>
                            <div class="pl-lg-4">

                                <div class="form-group focused">
                                    <label class="form-control-label" for="input-name">Type</label>
                                    <select name="type" id="input-name" class="form-control form-control-alternative">
                                        @foreach ($type as $t)
                                            <option value="{{ $t }}">{{ $t }}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="form-group focused">
                                    <label class="form-control-label" for="input-name">School</label>
                                    <select required name="school_id" id="input-name"
                                        class="form-control form-control-alternative">
                                        @foreach ($schools as $sc)
                                            <option value="{{ $sc->id }}">{{ $sc->name }}</option>
                                        @endforeach
                                    </select>
                                </div>

                                <div class="form-group focused">
                                    <label class="form-control-label" for="input-name">Name Column ( matching column name
                                        from CSV)</label>
                                    <input type="text" name="name" id="input-name"
                                        class="form-control form-control-alternative" placeholder="Name Column" value=""
                                        autofocus="">
                                </div>

                                <div class="form-group focused">
                                    <label class="form-control-label" for="input-email">Email Column*</label>
                                    <input type="text" name="email" id="input-name"
                                        class="form-control form-control-alternative" placeholder="Email Column Name*"
                                        value="" autofocus="">
                                </div>
                                <div class="form-group focused">
                                    <label class="form-control-label" for="input-email">Phone Column</label>
                                    <input type="text" name="phone" id="input-name"
                                        class="form-control form-control-alternative" placeholder="phone" value=""
                                        autofocus="">
                                </div>

                                <div class="form-group focused">
                                    <label class="form-control-label" for="description">Description Column</label>
                                    <input type="text" name="description" id="description"
                                        class="form-control form-control-alternative" placeholder="" value="" autofocus="">

                                </div>

                                <div class="form-group focused">
                                    <label class="form-control-label" for="input-email">CSV File</label>
                                    <input required type="file" class="form-control form-control-alternative"
                                        name="csv_file" />
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
