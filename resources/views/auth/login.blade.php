
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
 <link rel="icon" href="{{ asset('logo.png') }}">
  <title>DMMA - Login</title>

  <!-- Custom fonts for this template-->
  <link href="{{ asset('adminAsset/vendor/fontawesome-free/css/all.min.css') }}" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="{{ asset('adminAsset/css/sb-admin-2.min.css') }}" rel="stylesheet">

</head>

<body style="background-color: #d62114;
    background-image: linear-gradient(180deg,#e47714 10%,#d62114 100%);
    background-size: cover;">

  <div class="container">

    <!-- Outer Row -->

    <div class="row justify-content-center">
      <div class="col-xl-6 col-lg-6 col-md-9">
          
      @if ($message = Session::get('success'))
            <div class="alert alert-success alert-block mt-4">
            	<button type="button" class="close" data-dismiss="alert">×</button>	
                    <strong>{{ $message }}</strong>
            </div>
            @endif
            @if ($message = Session::get('danger'))
            <div class="alert alert-danger alert-block mt-4">
            	<button type="button" class="close" data-dismiss="alert">×</button>	
                    <strong>{{ $message }}</strong>
            </div>
          @endif
          
      </div>
    </div>
    <div class="row justify-content-center">

      <div class="col-xl-6 col-lg-6 col-md-9">
      
        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
              <div class="col-lg-12">
                <div class="p-5">
              <img src="{{ asset('logo.png') }}" width="100%">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Login!</h1>
                  </div>
                  <form class="user" method="POST" action="{{ route('login') }}">
                    @csrf
                    <div class="form-group">
                      <input type="email" class="form-control form-control-user @error('email') is-invalid @enderror" name="email" id="exampleInputEmail" aria-describedby="emailHelp" placeholder="Enter Email Address...">
                      @error('email')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                      @enderror
                    </div>
                    <div class="form-group">
                      <input type="password" class="form-control form-control-user @error('password') is-invalid @enderror" name="password" id="exampleInputPassword" placeholder="Password">
                    @error('password')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                    </div>
                    <div class="form-group">
                      <div class="custom-control custom-checkbox small">
                        <input type="checkbox" class="custom-control-input" id="customCheck">
                        <label class="custom-control-label" for="customCheck">Remember Me</label>
                      </div>
                    </div>
                    <button type="submit" class="btn btn-primary btn-user btn-block">
                      Login
                    </button>
                    <hr>
                    
                  </form>
                  <!-- <hr> -->
                  <!-- <div class="text-center">
                    <a class="small" href="forgot-password.html">Forgot Password?</a>
                  </div>
                  <div class="text-center">
                    <a class="small" href="{{ url('/register') }}">Create an Account!</a>
                  </div> -->
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>

    </div>

  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="{{ asset('adminAsset/vendor/jquery/jquery.min.js') }}"></script>
  <script src="{{ asset('adminAsset/vendor/bootstrap/js/bootstrap.bundle.min.js') }}"></script>

  <!-- Core plugin JavaScript-->
  <script src="{{ asset('adminAsset/vendor/jquery-easing/jquery.easing.min.js') }}"></script>

  <!-- Custom scripts for all pages-->
  <script src="{{ asset('adminAsset/js/sb-admin-2.min.js') }}"></script>

</body>

</html>
