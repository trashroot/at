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
                        <h3 style="display: inline-block;" class="mb-0">All Plans</h3>

                        <a style="float: right;" class="ml-auto btn btn-sm btn-info mr-4"
                            href="{{ url('admin/plans/create') }}">Add Plan</a>
                    </div>
                    @if (session()->get('success'))
                        <div class="alert alert-success">
                            {{ session()->get('success') }}
                        </div>
                    @endif
                    <!-- Light table -->
                    <div class="table-responsive">
                        <table class="table align-items-center table-flush">
                            <thead class="thead-light">
                                <tr>
                                    <th scope="col" class="sort" data-sort="name">Thumb</th>
                                    <th scope="col" class="sort" data-sort="budget">Title</th>
                                    <th scope="col" class="sort" data-sort="likes">Short Description</th>
                                    <th scope="col"></th>
                                </tr>
                            </thead>
                            <tbody class="list">
                                @foreach ($posts as $post)

                                    <tr>
                                        <th scope="row">
                                            <div class="media align-items-center">
                                                <a href="#" class="thumb rounded-circle mr-3">
                                                    <?php if (isset($post->thumb_img) &&
                                                    !empty($post->thumb_img)) { ?>
                                                    <img alt="Image placeholder"
                                                        src="{{ asset('img') }}/{{ $post->thumb_img }}">
                                                </a>
                                                <?php } ?>
                                            </div>
                                        </th>
                                        <td class="budget">
                                            <div class="media-body">
                                                <span class="name mb-0 text-sm">{{ $post->name }}
                                                </span>
                                            </div>
                                        </td>

                                        <td class="like">
                                            {{ $post->short_description }}
                                        </td>

                                        <td class="text-right">
                                            <div class="dropdown">
                                                <a class="btn btn-sm btn-icon-only text-light" href="#" role="button"
                                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <i class="fas fa-ellipsis-v"></i>
                                                </a>
                                                <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">
                                                    <a class="dropdown-item"
                                                        href="{{ route('admin_plan_edit', $post->id) }}">Edit</a>

                                                    <form onsubmit="return window.confirm('are you sure to delete?');"
                                                        action="{{ route('admin_plan_delete', $post->id) }}" method="post">
                                                        @csrf
                                                        @method('DELETE')
                                                        <button class="dropdown-item" type="submit">Delete</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                @endforeach

                            </tbody>
                        </table>
                    </div>
                    <!-- Card footer -->
                    <div class="card-footer py-4">
                        <nav aria-label="..." style="display: none;">
                            <ul class="pagination justify-content-end mb-0">
                                <li class="page-item disabled">
                                    <a class="page-link" href="#" tabindex="-1">
                                        <i class="fas fa-angle-left"></i>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                </li>
                                <li class="page-item active">
                                    <a class="page-link" href="#">1</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
                                </li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item">
                                    <a class="page-link" href="#">
                                        <i class="fas fa-angle-right"></i>
                                        <span class="sr-only">Next</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    @include('layouts.footers.auth')
@endsection
