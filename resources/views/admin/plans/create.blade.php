@extends('layouts.ca')

@section('content')
    <div class="header bg-gradient-primary pt-2"></div>
    <br>
    <div class="container-fluid mt--6">
        <div class="row">
            <div class="col">
                <div class="card">
                    <!-- Card header -->
                    <div class="card-header border-0">
                        <h3 class="mb-0">Add Plan</h3>
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
                        <form method="post" action="{{ url('admin/plans') }}" autocomplete="off"
                            enctype="multipart/form-data">
                            @csrf

                            <h6 class="heading-small text-muted mb-4">Plan information</h6>
                            <div class="pl-lg-4">
                                <div class="form-group focused">
                                    <label class="form-control-label" for="input-name">Name *</label>
                                    <input required type="text" name="name" id="input-name"
                                        class="form-control form-control-alternative" placeholder="Name *" value=""
                                        autofocus="">
                                </div>
                                <div class="form-group focused">
                                    <label class="form-control-label" for="input-name">Category</label>
                                    <select name="category_id" id="input-name"
                                        class="form-control form-control-alternative">
                                        @foreach ($category as $cat)
                                            <option value="{{ $cat->id }}">{{ $cat->name }}</option>
                                        @endforeach
                                    </select>
                                </div>

                                <div class="form-group focused">
                                    <label class="form-control-label" for="input-email">Short Description *</label>
                                    <textarea required name="short_description"
                                        class="form-control form-control-alternative"></textarea>
                                </div>
                                <div class="form-group focused">
                                    <label class="form-control-label" for="input-email">Description *</label>
                                    <textarea required name="description"
                                        class="main-editor form-control form-control-alternative"></textarea>
                                </div>

                                <div class="form-group focused">
                                    <label class="form-control-label" for="input-email">Thumb Image</label>
                                    <input type="file" class="form-control form-control-alternative" name="thumb_img" />
                                </div>

                                <div class="form-group focused">
                                    <label class="form-control-label" for="input-email">Video URL</label>
                                    <textarea name="video_url" class="form-control form-control-alternative"></textarea>
                                </div>


                                <div class="form-group focused">
                                    <label class="form-control-label" for="input-name">Days</label>

                                    <div class="form-control-alternative" id="days_list" style="padding: 15px;">


                                    </div>

                                    <span style="float: right;" id="add_day" class="ml-auto btn btn-sm btn-info mr-4"
                                        href="">Add Day +</span>
                                </div>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-success mt-4">Save</button>
                                </div>
                            </div>
                        </form>
                        <div id="add_div_count" rel="0"></div>
                        <div id="add_div" style="display: none;">
                            <div class="row mb-3 mt-6">
                                <div class="col-2">
                                    <input required type="text" name="days[IND][label]" id="input-name"
                                        class="form-control form-control-alternative" placeholder="label" value="">
                                </div>
                                <div class="col-2">
                                    <input type="file" name="days[IND][thumb_img]" id="input-name"
                                        class="form-control form-control-alternative" placeholder="Image" value="">
                                </div>
                                <div class="col-5">
                                    <input type="text" name="days[IND][title]" id="input-name"
                                        class="form-control form-control-alternative" placeholder="Title" value="">
                                </div>
                                <div class="col-2">
                                    <input required type="number" name="days[IND][day]" id="input-name"
                                        class="form-control form-control-alternative" placeholder="Day(used in order)"
                                        value="">
                                </div>
                                <div class="col-11 mt-2">
                                    <textarea required name="days[IND][description]" id="input-name"
                                        class="editor form-control form-control-alternative"
                                        placeholder="Description"></textarea>
                                </div>
                                <div class="col-1">
                                    <span onclick="remove_row($(this));" style="float: right;"
                                        class="ml-auto btn btn-sm btn-info mr-4">
                                        -</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    @include('layouts.footers.auth')

@endsection
