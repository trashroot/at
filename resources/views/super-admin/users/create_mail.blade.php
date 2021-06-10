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
                        <h3 class="mb-0">Send Mail</h3>
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
                        <form method="post" action="{{ route('sa_user_send_email') }}" autocomplete="off"
                            enctype="multipart/form-data">
                            @csrf

                            <h6 class="heading-small text-muted mb-4">Mail information</h6>
                            <div class="pl-lg-4">
                                <div class="form-group focused">
                                    <label class="form-control-label" for="input-name">Name</label>
                                    <input type="text" name="name" id="input-name"
                                        class="form-control form-control-alternative" placeholder="Name" value=""
                                        autofocus="">
                                </div>
                                <div class="form-group focused">
                                    <label class="form-control-label" for="input-email">Email *</label>
                                    <input required type="text" name="email" id="input-email"
                                        class="form-control form-control-alternative" placeholder="Email *" value=""
                                        autofocus="">
                                </div>
                                <div class="form-group focused">
                                    <label class="form-control-label" for="input-message">Message</label>
                                    <textarea required name="message" id="input-message"
                                        class="form-control form-control-alternative" placeholder="Your Message here"
                                        value="" autofocus=""></textarea>
                                </div>

                                <div class="text-center">
                                    <button type="submit" class="btn btn-success mt-4">Send</button>
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
