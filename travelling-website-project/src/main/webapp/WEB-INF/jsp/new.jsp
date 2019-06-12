<html>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<title>Sign up here</title>

<style>
body {
	background-image:
		url("https://d3im5pz5a8pbts.cloudfront.net/wp-content/uploads/2019/04/common-landing-page-mistakes.jpg");
	background-size: cover;
	background-color: #cccccc;
}
</style>
</head>

<body>
	<form action="/new" method="POST">
		<div class="container">
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6 col-xs-12">
					<div class="jumbotron">
						<h1 class="text-center">Sign up to travel</h1>
						<font color="red">${errorPhone}</font> <font color="red">${errorEmail}</font>
						<p class="lead" align="center">Please enter you details below.</p>
						<br>

						<div class="form-group">
							<div class="row">
								<div class="form-group col-md-6">
									First Name: <input type="text" class="form-control"
										name="firstname" required>
								</div>
								<div class="form-group col-md-6">
									Last Name: <input type="text" class="form-control"
										name="lastname" required>
								</div>
							</div>

							<div class="row">
								<div class="form-group col-md-12">
									Email Address: <input type="email" class="form-control"
										name="email" required>
								</div>
							</div>

							<div class="row>
					<div class=" form-groupcol-md-6">
								Phone Number: <input type="text" class="form-control"
									name="phone" required>
							</div>
						</div>

						<!--- <div class="row"> 
					<div class="form-group col-md-6">
						Date of Birth: (Optional) <input type="date" class="form-control" id="dob">
					</div>
					<div class="form-group col-md-6">
						Gender: (Optional)
						<select class="custom-select" name="gender">
											<option value="female">Female</option>
											<option value="male">Male</option>
											<option value="other">Other</option>
										</select>
					</div>
				</div> ---!>
				
				<br>
				<div align="center">
				<button type="submit" class="btn btn-outline-success">Sign up</button>
				<button type="reset" class="btn btn-outline-dark">Clear</button>
				</div>
				
			</div>
		</div>
		
</body>

</html>