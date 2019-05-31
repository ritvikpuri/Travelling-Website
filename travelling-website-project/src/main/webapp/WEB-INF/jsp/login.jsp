<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  
	<title> User Login Page </title>
	
	<style>
		body  {
  background-image: url("https://d3im5pz5a8pbts.cloudfront.net/wp-content/uploads/2019/04/common-landing-page-mistakes.jpg");
	background-size: cover;
  background-color: #cccccc;
  
}
	</style>
</head>

<body>

	<form action="/login" method="POST">
	<div class="container">
		<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6 col-xs-12">
			<div class="jumbotron">
			<h1 class="text-center"> Login Page </h1>
			<font color = "red"> ${errorMessage} </font>
			<br>
			
			<div class="form-group">
				<label class="control-label" for="username">Username</label>
				<input type="text" name="username" class="form-control" placeholder="Username">
			</div>
			<div class="form-group">
				<label class="control-label" for="password">Password</label>
				<input type="password" name="password" class="form-control" placeholder="Password">
			</div>
			
			<input type="checkbox" name="remember"> Remember Me?
			<br><br>
			<div align="center">
			<button type="submit" class="btn btn-outline-info">Login</button>
			<button type="reset" class="btn btn-outline-dark">Close</button>
			</div>
			<br>
			
			<div class="row">
			<div class="form-group col-md-5">
				<span class="form-label">New User? Join now</span>
			</div>
			<div class="form-group">
				<button onclick="new" class="btn btn-outline-success">Sign Up</button>
			</div>
			</div>
		</div>
		
		<div class="row">
			
		</div>
		

		
</body>


</html>