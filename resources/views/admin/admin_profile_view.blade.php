@extends('admin.admin_master')
@section('admin')

<div class="page-content">
<div class="container-fluid">

<div class="row">
                            <div class="col-lg-4">
                                <div class="card">
                                    <img class="card-img-top img-fluid"  src="{{ (!empty($admindata->profile_image))? url('upload/admin_images/'.$admindata->profile_image):url('upload/no_image.jpg') }}" alt="Card image cap">
                                    <div class="card-body">
                                        <h4 class="card-title">Name : {{ $admindata->name }}</h4>
                                        <h4 class="card-title">Email : {{ $admindata->email}}</h4>
                                        <h4 class="card-title">Username : {{ $admindata->username }}</h4>
                        <hr>
                                        <a href = "{{ route('edit.profile') }}" class="btn btn-danger waves-effect waves-light"> Edit Profile </a>                                   
                                    </div>
                                </div>
                            </div>

        
                        </div>

</div>
</div>

@endsection