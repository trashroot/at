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
                        <h3 style="display: inline-block;" class="mb-0">All Users</h3>

                        <a style="float: right;" class="ml-auto btn btn-sm btn-info mr-4"
                            href="{{ route('sa_user_create') }}">Add User</a>
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
                                    <th scope="col" class="sort" data-sort="name">Banner</th>
                                    <th scope="col" class="sort" data-sort="budget">Name</th>
                                    <th scope="col" class="sort" data-sort="budget">Email<br>Phone</th>
                                    <th scope="col" class="sort" data-sort="likes">School</th>
                                    <th scope="col" class="sort" data-sort="likes">Action</th>
                                    <th scope="col">
                                        <form action="{{ route('sa_users') }}" method="get">
                                            @csrf
                                            <div><select name="school">
                                                    <option value="-1">-Select-</option>
                                                    @foreach ($schools as $sc)
                                                        <option value="{{ $sc->id }}">{{ $sc->name }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                            <div>
                                                <select name="type">
                                                    <option value="-1">-Select-</option>
                                                    @foreach ($type as $sc)
                                                        <option value="{{ $sc }}">{{ $sc }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                            <button type="submit">Filter</button>
                                            <a href="{{ route('sa_users') }}">Reset</a>
                                        </form>
                                    </th>
                                </tr>
                            </thead>
                            <tbody class="list">
                                @foreach ($posts as $post)
                                    <tr>
                                        <th scope="row">
                                            <div class="media align-items-center">
                                                <?php if (isset($post->profile_img) &&
                                                !empty($post->profile_img)) { ?>
                                                <img class="thumb" alt="Image placeholder"
                                                    src="{{ asset('img') }}/{{ $post->profile_img }}">
                                                <?php } ?>
                                            </div>
                                        </th>
                                        <th scope="row">
                                            <div class="media align-items-center">
                                                <?php if (isset($post->banner_img) &&
                                                !empty($post->banner_img)) { ?>
                                                <img class="thumb-or" alt="Image placeholder"
                                                    src="{{ asset('img') }}/{{ $post->banner_img }}">
                                                <?php } ?>
                                            </div>
                                        </th>
                                        <td class="budget">
                                            <div class="media-body">
                                                <span class="name mb-0 text-sm">{{ $post->name }}
                                                </span>
                                            </div>
                                        </td>

                                        <td>
                                            {{ $post->email }}
                                            <br>
                                            {{ $post->phone }}
                                        </td>

                                        <td>
                                            @foreach ($schools as $sc)
                                                @if ($sc->id == $post->school_id)
                                                    {{ $sc->name }}
                                                @endif
                                            @endforeach
                                        </td>
                                        <td>
                                            <span data-url={{ route('sa_user_send_email_wc') }} data-id={{ $post->id }}
                                                class="send_mail alert alert-info small">Send Welcome
                                                Email</span>
                                        </td>
                                        <td class="text-right">
                                            {{ $post->type }}
                                            <div class="dropdown">
                                                <a class="btn btn-sm btn-icon-only text-light" href="#" role="button"
                                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <i class="fas fa-ellipsis-v"></i>
                                                </a>
                                                <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">
                                                    <a class="dropdown-item"
                                                        href="{{ route('sa_user_edit', $post->id) }}">Edit</a>

                                                    <form onsubmit="return window.confirm('are you sure to delete?');"
                                                        action="{{ route('sa_user_delete', $post->id) }}" method="post">
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
                        <nav aria-label="...">
                            <?php echo $posts->withQueryString()->links(); ?>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    @include('layouts.footers.auth')
@endsection
