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

<title>Select your Flight</title>

<style>
body {
	background-image:
		url("https://i.pinimg.com/originals/55/0b/7a/550b7afbf123fa534ac657745e1d512c.png");
	background-size: cover;
	background-color: #cccccc;
}
</style>


</head>

<body>

	<div class="container">
		<div class="jumbotron">
			<h3 class="display-4" align="center">Select your Flight</h3>
			<font align="center" color="red">${errorMessage}</font> <br>

			<table class="table table-hover" id="flights">

				<a href="#" class="btn btn-outline-warning" data-toggle="modal"
					data-target="#largeModal">Modify Search</a>
				<br>
				<br>

				<thread>
				<tr>
					<th onclick="sortTableString(0)">Flight Number</th>
					<th onclick="sortTableString(1)">Airlines Name</th>
					<th>Departure City</th>
					<th>Arrival City</th>
					<th onclick="sortTableDate(4)">Departure Time</th>
					<th onclick="sortTableDate(5)">Arrival Time</th>
					<th onclick="sortTablePrice(6)">Price<br>(per Traveller)
					</th>
					<th onclick="sortTableString(7)">Flight Duration</th>
				</tr>
				</thread>

				<tbody>
					<c:forEach items="${flightList}" var="flight">
						<tr>
							<td><a href="selected/${flight.flight_num}"> <c:out
										value="${flight.flight_num}" />
							</a></td>
							<td><c:out value="${flight.airlines}" /></td>
							<td><c:out value="${flight.departure}" /></td>
							<td><c:out value="${flight.arrival}" /></td>
							<td><fmt:formatDate pattern="HH:mm" type="time"
									value="${flight.dep_time}" /></td>
							<td><fmt:formatDate pattern="HH:mm" type="time"
									value="${flight.arr_time}" /></td>
							<td><c:out value="${flight.price}" /></td>
							<td><c:out value="${flight.duration}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>


	<div class="modal fade" id="largeModal" tabindex="-1" role="dialog"
		aria-labelledby="basicModal" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">Modify Search</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="/book" method="POST">
						<div class="container">
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
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<!-- <div class="modal-footer">
					<button type="button" class="btn btn-outline-danger"
						data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-outline-info">Search</button>
				</div> -->
			</div>
		</div>
	</div>




	<script>
		function sortTableString(n) {
			var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
			table = document.getElementById("flights");
			switching = true;
			//Set the sorting direction to ascending:
			dir = "asc";
			/*Make a loop that will continue until
			no switching has been done:*/
			while (switching) {
				//start by saying: no switching is done:
				switching = false;
				rows = table.rows;
				/*Loop through all table rows (except the
				first, which contains table headers):*/
				for (i = 1; i < (rows.length - 1); i++) {
					//start by saying there should be no switching:
					shouldSwitch = false;
					/*Get the two elements you want to compare,
					one from current row and one from the next:*/
					x = rows[i].getElementsByTagName("TD")[n];
					y = rows[i + 1].getElementsByTagName("TD")[n];
					/*check if the two rows should switch place,
					based on the direction, asc or desc:*/
					if (dir == "asc") {
						if (x.innerHTML.toLowerCase() > y.innerHTML
								.toLowerCase()) {
							//if so, mark as a switch and break the loop:
							shouldSwitch = true;
							break;
						}
					} else if (dir == "desc") {
						if (x.innerHTML.toLowerCase() < y.innerHTML
								.toLowerCase()) {
							//if so, mark as a switch and break the loop:
							shouldSwitch = true;
							break;
						}
					}
				}
				if (shouldSwitch) {
					/*If a switch has been marked, make the switch
					and mark that a switch has been done:*/
					rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
					switching = true;
					//Each time a switch is done, increase this count by 1:
					switchcount++;
				} else {
					/*If no switching has been done AND the direction is "asc",
					set the direction to "desc" and run the while loop again.*/
					if (switchcount == 0 && dir == "asc") {
						dir = "desc";
						switching = true;
					}
				}
			}
		}

		function sortTableDate(n) {
			debugger;
			var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
			table = document.getElementById("flights");
			switching = true;
			//Set the sorting direction to ascending:
			dir = "asc";
			/*Make a loop that will continue until
			no switching has been done:*/
			while (switching) {
				//start by saying: no switching is done:
				switching = false;
				rows = table.rows;
				/*Loop through all table rows (except the
				first, which contains table headers):*/
				for (i = 1; i < (rows.length - 1); i++) {
					//start by saying there should be no switching:
					shouldSwitch = false;
					/*Get the two elements you want to compare,
					one from current row and one from the next:*/
					x = rows[i].getElementsByTagName("TD")[n];
					y = rows[i + 1].getElementsByTagName("TD")[n];
					/*check if the two rows should switch place,
					based on the direction, asc or desc:*/
					if (dir == "asc") {
						if (x.innerHTML > y.innerHTML) {
							//if so, mark as a switch and break the loop:
							shouldSwitch = true;
							break;
						}
					} else if (dir == "desc") {
						if (x.innerHTML < y.innerHTML) {
							//if so, mark as a switch and break the loop:
							shouldSwitch = true;
							break;
						}
					}
				}
				if (shouldSwitch) {
					/*If a switch has been marked, make the switch
					and mark that a switch has been done:*/
					rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
					switching = true;
					//Each time a switch is done, increase this count by 1:
					switchcount++;
				} else {
					/*If no switching has been done AND the direction is "asc",
					set the direction to "desc" and run the while loop again.*/
					if (switchcount == 0 && dir == "asc") {
						dir = "desc";
						switching = true;
					}
				}
			}
		}

		function sortTablePrice(n) {
			var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
			table = document.getElementById("flights");
			switching = true;
			//Set the sorting direction to ascending:
			dir = "asc";
			/*Make a loop that will continue until
			no switching has been done:*/
			while (switching) {
				//start by saying: no switching is done:
				switching = false;
				rows = table.rows;
				/*Loop through all table rows (except the
				first, which contains table headers):*/
				for (i = 1; i < (rows.length - 1); i++) {
					//start by saying there should be no switching:
					shouldSwitch = false;
					/*Get the two elements you want to compare,
					one from current row and one from the next:*/
					x = rows[i].getElementsByTagName("TD")[n];
					y = rows[i + 1].getElementsByTagName("TD")[n];
					/*check if the two rows should switch place,
					based on the direction, asc or desc:*/
					if (dir == "asc") {
						if (Number(x.innerHTML) > Number(y.innerHTML)) {
							//if so, mark as a switch and break the loop:
							shouldSwitch = true;
							break;
						}
					} else if (dir == "desc") {
						if (Number(x.innerHTML) < Number(y.innerHTML)) {
							//if so, mark as a switch and break the loop:
							shouldSwitch = true;
							break;
						}
					}
				}
				if (shouldSwitch) {
					/*If a switch has been marked, make the switch
					and mark that a switch has been done:*/
					rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
					switching = true;
					//Each time a switch is done, increase this count by 1:
					switchcount++;
				} else {
					/*If no switching has been done AND the direction is "asc",
					set the direction to "desc" and run the while loop again.*/
					if (switchcount == 0 && dir == "asc") {
						dir = "desc";
						switching = true;
					}
				}
			}
		}
	</script>


</body>

</html>