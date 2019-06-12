<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
import="java.util.*"%> <%@ page import="java.sql.*"%> <%@ taglib prefix
= "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=PT+Sans:400"
	rel="stylesheet">
<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />
<link type="text/css" rel="stylesheet" href="css/style.css" />

<title>Book your Flights</title>

<style>
body {
	background-image:
		url("https://cdn2.hubspot.net/hubfs/53/ross-parmly-25230.jpg");
	background-size: cover;
	background-color: #cccccc;
}
</style>



</head>

<body>
	<form action="/book" method="POST">
		<div class="container">
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6 col-xs-12">
					<div class="jumbotron">
						<h3 class="display-4" align="center">Book your Flights</h3>
						<p class="lead" align="center">Where would you like to go
							today?</p>
						<br>
						<div class="form-group">
							<div class="form-row">
								<div class="form-group col-md-3">Flight Type</div>
								<div class="form-group col-md-3">
									<label for="roundtrip"> <input type="radio"
										id="roundtrip" name="flight-type" checked> <span></span>Roundtrip
									</label>
								</div>
								<div class="form-group col-md-3">
									<label for="oneway"> <input type="radio" id="oneway"
										name="flight-type"> <span></span>One way
									</label>
								</div>
								<div class="form-group col-md-3">
									<label for="multicity"> <input type="radio"
										id="multicity" name="flight-type"> <span></span>Multi-City
									</label>
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<span class="form-label">Departure</span> <select
										class="custom-select" name="departures">
										<option value="delhi">Delhi</option>
										<option value="mumbai">Mumbai</option>
										<option value="goa">Goa</option>
										<option value="lucknow">Lucknow</option>
										<option value="bangalore">Bangalore</option>
										<option value="kanpur">Kanpur</option>
									</select>
								</div>
								<div class="form-group col-md-6">
									<span class="form-label">Arrival</span> <select
										class="custom-select" name="arrival">
										<option value="mumbai">Mumbai</option>
										<option value="delhi">Delhi</option>
										<option value="goa">Goa</option>
										<option value="lucknow">Lucknow</option>
										<option value="bangalore">Bangalore</option>
										<option value="kanpur">Kanpur</option>
									</select>
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<span class="form-label">Departing</span> <input
										class="form-control" type="date" name="depdate" required>
								</div>
								<div class="form-group col-md-6">
									<span class="form-label">Arriving</span> <input
										class="form-control" type="date" name="arrdate" required>
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-4">
									<span class="form-label">No. of Passengers</span>
								</div>
								<div class="form-group col-md-2">
									<input type="number" name="passengers" min="1" max="10"
										required>
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-2">Class</div>
								<div class="form-group col-md-3">
									<label for="economy"> <input type="radio"
										value="economy" name="travelClass" checked> <span></span>Economy
									</label>
								</div>
								<div class="form-group col-md-3">
									<label for="business"> <input type="radio"
										value="business" name="travelClass"> <span></span>Business
									</label>
								</div>
								<div class="form-group col-md-3">
									<label for="first"> <input type="radio" value="first"
										name="travelClass"> <span></span>First
									</label>
								</div>
							</div>

							<br>
							<div align="center">
								<button type="submit" class="btn btn-outline-primary">Search</button>
								<button type="reset" class="btn btn-outline-dark">Reset</button>
								<button type="button" class='btn btn-outline-danger pull-right'
									data-toggle="modal" data-target="#smallModal">Log out</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>


	<div class="modal fade" id="smallModal" tabindex="-1" role="dialog"
		aria-labelledby="basicModal" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">Log Out</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">Are you sure?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-cancel"
						data-dismiss="modal">Close</button>
					<a href="logout" class="btn btn-outline-danger">Log Out
						</button>
				</div>
			</div>
		</div>
	</div>




</body>

</html>