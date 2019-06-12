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
	<form action="/new2" method="POST">
		<div class="container">
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6 col-xs-12">
					<div class="jumbotron">
						<h3>Choose username and Password</h3>
						<font color="red">${errorPass}</font> <font color="red">${errorUsername}</font>

						<br>
						<div class="form-group">
							<div class="row">
								Username: <input type="text" class="form-control"
									name="username" required>
							</div>
							<div class="row">
								Password: <input type="password" class="form-control"
									name="password1" required>
							</div>
							<div class="row">
								Re-enter Password: <input type="password" class="form-control"
									name="password2" required>
							</div>

							<br>
							<div align="center">
								<button type="submit" class="btn btn-outline-success">Sign
									up</button>
								<button type="reset" class="btn btn-outline-dark">Clear</button>
							</div>

						</div>
					</div>
				</div>
</body>

</html>