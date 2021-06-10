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
                        <h3 class="mb-0">Bulk Add User</h3>
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
                        <form method="post" action="{{ route('sa_user_bulk_create_save') }}" autocomplete="off"
                            enctype="multipart/form-data">
                            @csrf

                            <div class="pl-lg-4">

                                <div class="form-group focused">
                                    <label class="form-control-label" for="input-name">Type</label>
                                    <input type="text" name="type" id="input-name"
                                        class="form-control form-control-alternative" placeholder="Type"
                                        value="<?php echo $type; ?>" readonly>
                                </div>
                                <div class="form-group focused">
                                    <label class="form-control-label" for="input-name">School ID</label>
                                    <input type="text" name="school_id" id="input-name"
                                        class="form-control form-control-alternative" placeholder="Type"
                                        value="<?php echo $school_id; ?>" readonly>
                                </div>

                                <?php if (is_array($records)) {
                                $cn = 0;
                                foreach ($records as $key => $value) { ?>

                                <div class="row">
                                    <div class="col">
                                        <input type="text"
                                            name="st[<?php echo $cn; ?>][name]"
                                            id="input-name" class="form-control form-control-alternative" placeholder="Name"
                                            value="<?php echo isset($value['name']) ? $value['name'] : ''; ?>"
                                            autofocus="">
                                    </div>

                                    <div class="col">
                                        <input required type="email"
                                            name="st[<?php echo $cn; ?>][email]"
                                            id="input-name" class="form-control form-control-alternative"
                                            placeholder="Email *"
                                            value="<?php echo isset($value['email']) ? $value['email'] : ''; ?>"
                                            autofocus="">
                                    </div>


                                    <div class="col">
                                        <input type="text"
                                            name="st[<?php echo $cn; ?>][phone]"
                                            id="input-name" class="form-control form-control-alternative"
                                            placeholder="Phone"
                                            value="<?php echo isset($value['phone']) ? $value['phone'] : ''; ?>"
                                            autofocus="">
                                    </div>

                                    <div class="col">
                                        <input type="text"
                                            name="st[<?php echo $cn; ?>][description]"
                                            id="input-name" class="form-control form-control-alternative"
                                            placeholder="Description"
                                            value="<?php echo isset($value['description']) ? $value['description'] : ''; ?>"
                                            autofocus="">
                                    </div>

                                    <div class="col">
                                        <input type="text"
                                            name="st[<?php echo $cn; ?>][password]"
                                            id="input-name" class="form-control form-control-alternative"
                                            placeholder="Password *"
                                            value="<?php echo $value['password']; ?>"
                                            autofocus="">
                                    </div>
                                </div>
                                <br>
                                <?php $cn++;}
                                } ?>

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
