 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@
page import="java.util.*"%> <%@ page import="java.sql.*"%> <%@ taglib
prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>



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

<link rel="icon" type="image/png" href="images/icons/favicon.ico" />
<link rel="stylesheet" type="text/css"
	href="vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<link rel="stylesheet" type="text/css"
	href="vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css"
	href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">

<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">

<title>Review your Booking</title>

<style>
body {
	background-image:
		url("http://www.technocrazed.com/wp-content/uploads/2015/12/Airplane-wallpaper-125.jpg");
	background-size: cover;
	background-color: #cccccc;
}
</style>



<script>
	$(document)
			.ready(
					function() {

						var max_fields = ${passengers};
						var wrapper = $(".input_fields_wrap");
						var add_button = $(".add_field_button");

						var x = 1;
						$(add_button)
								.click(
										function(e) {
											e.preventDefault();
											if (x < max_fields) {
												x++;
												$(wrapper)
														.append(
																'<div class="form-row"><div class="form-group col-md-2"><select class="custom-select" name="title"><option value="mr">Mr.</option><option value="mrs">Mrs.</option><option value="ms">Ms.</option></select></div><div class="form-group col-md-4"><input type="text" name="firstname" class="form-control" placeholder="First Name" required></div><div class="form-group col-md-4"><input type="text" name="lastname" class="form-control" placeholder="Last Name" required></div><a href="#" class="remove_field" style="color:red">X</a></div>')
											}
										});
						$(wrapper).on("click", ".remove_field", function(e) {
							e.preventDefault();
							$(this).parent('div').remove();
							x--;
						})
					})

	$('#submitForm').submit(function(e) {
		// reference to form object
		debugger;
		var form = this;
		// for stopping the default action of element
		e.preventDefault();
		// mapthat will hold form data
		var formData = {}
		//iterate over form elements   
		$.each(this, function(i, v) {
			var input = $(v);
			// populate form data as key-value pairs
			// with the name of input as key and its value as value
			formData[input.attr("name")] = input.val();
			console.log(formData);
		});
		/* $.ajax({
			type : form.attr('method'), // method attribute of form
			url : form.attr('action'), // action attribute of form
			dataType : 'json',
			contentType: "application/json",
			// convert form data to json format
			data : JSON.stringify(formData),
		}); */
	});
</script>


</head>

<body>

	<form id="submitForm" action="/selected/${flightNum}" method="POST">
		<div class="container">
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6 col-xs-12">
					<div class="jumbotron">
						<h3 class="display-4" align="center">Review your Booking</h3>
						<p class="lead" align="center">Please check the details below
							before you proceed.</p>
						<br>

						<div class="form-group">
							<div class="form-row">
								<div class="form-group col-md-5">
									<h4 align="center">Departure</h4>
									<h5 align="center">${bookedFlight.departure}</h5>
									<h6 align="center">
										<fmt:formatDate type="date" value="${bookedFlight.dep_time}" />
									</h6>
									<h6 align="center">
										<fmt:formatDate type="time" value="${bookedFlight.dep_time}" />
									</h6>
								</div>

								<div class="form-group col-md-2">
									<br> <br>
									<h5 align="center">
										<i class="fa fa-arrow-right"></i>
									</h5>
								</div>

								<div class="form-group col-md-5">
									<h4 align="center">Arrival</h4>
									<h5 align="center">${bookedFlight.arrival}</h5>
									<h6 align="center">
										<fmt:formatDate type="date" value="${bookedFlight.arr_time}" />
									</h6>
									<h6 align="center">
										<fmt:formatDate type="time" value="${bookedFlight.arr_time}" />
									</h6>
								</div>
							</div>
							<br>

							<h4 align="center">Contact Details</h4>

							<div class="form-row">
								<div class="form-group col-md-6">
									<h6>Email Address</h6>
									<input type="text" name="email" class="form-control"
										value="${loggedInUser.email}">
								</div>
								<div class="form-group col-md-6">
									<h6>Phone Number</h6>
									<input type="text" name="phone" class="form-control"
										value="${loggedInUser.phone}">
								</div>
							</div>



							<div class="input_fields_wrap">
								<h4 align="center">Traveller Information</h4>
								<button type="button" class="add_field_button btn btn-info">Add
									More Fields</button>
								<br> <br>
								<div class="form-row">
									<div class="form-group col-md-2">
										<select class="custom-select" name="title">
											<option value="mr">Mr.</option>
											<option value="mrs">Mrs.</option>
											<option value="ms">Ms.</option>
										</select>
									</div>
									<div class="form-group col-md-4">
										<input type="text" name="firstname" class="form-control"
											placeholder="First Name" required>
									</div>
									<div class="form-group col-md-4">
										<input type="text" name="lastname" class="form-control"
											placeholder="Last Name" required>
									</div>
								</div>
							</div>



							<h4 align="center">Fare Breakdown</h4>
							<table class="table table-hover" id="flights">
								<thread>
								<tr>
									<th>Base Fare<br>(${passengers} Travellers)
									</th>
									<th>Fee & Surcharge</th>
									<th>You Pay</th>
								</tr>
								</thread>
								<tbody>
									<tr>
										<td>${bookedFlight.price * passengers}<br>(${bookedFlight.price}
											* ${passengers})
										</td>
										<td>${0.1*(bookedFlight.price)*passengers}<br>(${0.1*(bookedFlight.price)}
											* ${passengers})
										</td>
										<td>${bookedFlight.price*passengers +
											0.1*(bookedFlight.price)*passengers}</td>
									</tr>
								</tbody>
							</table>
						</div>
						<br>
						<div align="center">
							<button type="submit" class="btn btn-outline-danger">Proceed
								to Payment</button>
						</div>

					</div>
				</div>
			</div>

		</div>
		</div>
	</form>

</body>
</html>