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
                        <h3 class="mb-0">Update Plan</h3>
                    </div>
                    <div class="card-body">
                        <form method="post" action="{{ route('admin_plan_edit_save', $post->id) }}" autocomplete="off"
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
                                    <label class="form-control-label" for="input-name">Category</label>
                                    <select name="category_id" id="input-name"
                                        class="form-control form-control-alternative">
                                        @foreach ($category as $cat)
                                            <option @if ($cat->id == $post->category_id)
                                                {{ 'selected' }}
                                        @endif value="{{ $cat->id }}">{{ $cat->name }}</option>
                                        @endforeach
                                    </select>

                                </div>


                                <div class="form-group focused">
                                    <label class="form-control-label" for="input-email">Short Description</label>
                                    <textarea name="short_description"
                                        class="form-control form-control-alternative">{{ $post->short_description }}</textarea>
                                </div>


                                <div class="form-group focused">
                                    <label class="form-control-label" for="input-email">Description</label>
                                    <textarea name="description"
                                        class="main-editor form-control form-control-alternative">{{ $post->description }}</textarea>
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


                                <div class="form-group focused">
                                    <label class="form-control-label" for="input-name">Days</label>

                                    <div class="form-control-alternative" id="days_list" style="padding: 15px;">
                                        <?php
                                        $cn = 0;
                                        //var_dump($days);
                                        if (is_array($days)) {
                                        foreach ($days as $item) { ?>

                                        <div class="row mb-3  mt-5">
                                            <div class="col-2">
                                                <input type="text"
                                                    name="days[<?php echo $item['day']; ?>][label]"
                                                    id="input-name" class="form-control form-control-alternative"
                                                    placeholder="label *"
                                                    value="<?php echo $item['label']; ?>">
                                            </div>
                                            <div class="col-3 d-flex">
                                                <?php if (!empty($item['thumb_img'])) { ?>
                                                <span><img class="thumb-or" alt="Image placeholder"
                                                        src="{{ asset('img') }}/{{ $item['thumb_img'] }}"></span>

                                                <?php } ?>
                                                <span> <input style="width: 120px" type="file"
                                                        name="days[<?php echo $item['day']; ?>][thumb_img]"
                                                        id="input-name" class="form-control form-control-alternative"
                                                        placeholder="label *" value=""></span>
                                                <input type="hidden"
                                                    name="days[<?php echo $item['day']; ?>][thumb_img_name]"
                                                    id="input-name" class="form-control form-control-alternative"
                                                    placeholder="label *"
                                                    value="<?php echo $item['thumb_img']; ?>">

                                            </div>
                                            <div class="col-5">
                                                <input type="text"
                                                    name="days[<?php echo $item['day']; ?>][title]"
                                                    id="input-name" class="form-control form-control-alternative"
                                                    placeholder="Title"
                                                    value="<?php echo $item['title']; ?>">
                                            </div>

                                            <div class="col-2">
                                                <input type="number" required
                                                    name="days[<?php echo $item['day']; ?>][day]"
                                                    id="input-name" class="form-control form-control-alternative"
                                                    placeholder="Day"
                                                    value="<?php echo $item['day']; ?>">
                                            </div>
                                            <div class="col-11 mt-2">
                                                <textarea
                                                    name="days[<?php echo $item['day']; ?>][description]"
                                                    id="input-name" class="editor form-control form-control-alternative"
                                                    placeholder="Description"><?php echo $item['description']; ?></textarea>
                                            </div>
                                            <div class="col-1">
                                                <input type="hidden"
                                                    name="days[<?php echo $item['day']; ?>][id]"
                                                    value="<?php echo $item['id']; ?>">

                                                <span onclick="remove_row($(this));" style="float: right;"
                                                    class="ml-auto btn btn-sm btn-info mr-4">
                                                    -</span>
                                            </div>
                                        </div>
                                        <?php }
                                        }
                                        ?>
                                    </div>

                                    <span style="float: right;" id="add_day_edit_page"
                                        class="ml-auto btn btn-sm btn-info mr-4" href="">Add Day +</span>
                                </div>

                                <div class="text-center">
                                    <button type="submit" class="btn btn-success mt-4">Save</button>
                                </div>
                            </div>
                        </form>
                        <div id="add_div_count" rel="-1000"></div>
                        <div id="add_div" style="display: none;">
                            <div class="row mb-3 mt-6">
                                <div class="col-2">
                                    <input required type="text" name="days[IND][label]" id="input-name"
                                        class="form-control form-control-alternative" placeholder="label" value="">
                                </div>
                                <div class="col-3">
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
                                    <textarea name="days[IND][description]" id="input-name"
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
