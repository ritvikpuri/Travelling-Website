<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>


<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
 	<link href="https://fonts.googleapis.com/css?family=PT+Sans:400" rel="stylesheet">
 	<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />
 	<link type="text/css" rel="stylesheet" href="css/style.css" />
	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">	

	<title>Review your Booking</title>
	
	<style>
		body  {
  background-image: url("http://www.technocrazed.com/wp-content/uploads/2015/12/Airplane-wallpaper-125.jpg");
	background-size: cover;
  background-color: #cccccc;
  
}
	</style>
	
</head>

<body>

<form action="/selected" method="POST">
<div class = "container">
<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6 col-xs-12">
		<div class="jumbotron">
		<h3 class="display-4" align="center">Review your Booking</h3>
		<p class="lead" align="center"> Please check the details below before you proceed. </p>
		<br>
		
		<div class="form-group">
			<div class="form-row">
				<div class="form-group col-md-6">
					<h4 align="center">Departure</h4>
					<h6 align="center"> ${bookedFlight.departure} </h6>
					<h6 align="center"> ${bookedFlight.dep_time}</h6>
				</div>
				
				<div class="form-group col-md-6">
					<h4 align="center">Arrival</h4>
					<h6 align="center"> ${bookedFlight.arrival} </h6>
					<h6 align="center"> ${bookedFlight.arr_time}</h6>
				</div>
			</div>
			<br>
			
			<h4 align="center"> Contact Details </h4>
			
			<div class="form-row">
				<div class="form-group col-md-6">
					<h6> Email Address </h6>
					<input type="text" name="email" class="form-control" value="${loggedInUser.email}">
				</div>
				<div class="form-group col-md-6">
					<h6> Phone Number </h6>
					<input type="number" name="phone" class="form-control" value="loggedInUser.phone">
				</div>
			</div>
			
			<h4 align="center"> Traveller Information </h4>
			<div class="form-row">
				<div class="form-group col-md-2">
						<select class="custom-select" name="title">
							<option value="mr">Mr.</option>
							<option value="mrs">Mrs.</option>
							<option value="ms">Ms.</option>
						</select>
				</div>
				<div class="form-group col-md-5">
					<input type="text" name="firstname" class="form-control" placeholder="First Name">
				</div>
				<div class="form-group col-md-5">
					<input type="text" name="lastname" class="form-control" placeholder="Last Name">
				</div>
			</div>
			<br>
			
			<h4 align="center"> Fare Breakdown </h4>
	<table class="table table-hover" id="flights">		
		<thread>
			<tr>
				<th>Base Fare</th>
		        <th>Fee & Surcharge</th>
		        <th>You Pay</th>
			</tr>
		</thread>
		<tbody>
			<tr>
				<td>${bookedFlight.price}</td>
				<td>${0.1*(bookedFlight.price)}</td>
				<td>${bookedFlight.price + 0.1*(bookedFlight.price)}</td>
			</tr>
		</tbody>
	</table>
		</div>
		<br>
		<div align="center">
			<button type="submit" class="btn btn-outline-danger">Proceed to Payment </button>
		</div>
		
		</div>
		</div>
		</div>
		
</div>
</div>
</form>

</body>
</html>