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

	<title>Select your Flight</title>
	
	<style>
		body  {
  background-image: url("https://i.pinimg.com/originals/55/0b/7a/550b7afbf123fa534ac657745e1d512c.png");
	background-size: cover;
  background-color: #cccccc;
  
}
	</style>
	
</head>

<body>

<div class = "container">
<div class="jumbotron">
	<h3 class="display-4" align="center">Select your Flight</h3>
	<font align="center" color="red">${errorMessage}</font>
	<br>
	
	<table class="table table-hover" id="flights">
		
		<thread>
			<tr>
				<th>Flight Number</th>
		        <th>Airlines Name</th>
		        <th>Departure City</th>
		        <th>Arrival City</th>
		        <th>Departure Time</th>
		        <th>Arrival Time</th>
		        <th>Price</th>
			</tr>
		</thread>
		
		<tbody>
			<c:forEach items="${flightList}" var="flight">
	        <tr>
	        	<td> <a href="selected/${flight.flight_num}"> <c:out value="${flight.flight_num}"/> </a> </td>
	        	<td> <c:out value="${flight.airlines}"/> </td>
	        	<td> <c:out value="${flight.departure}"/> </td>
	        	<td> <c:out value="${flight.arrival}"/> </td>
	        	<td> <c:out value="${flight.dep_time}"/> </td>
	        	<td> <c:out value="${flight.arr_time}"/> </td>
	        	<td> <c:out value="${flight.price}"/> </td>
	        </tr>
    </c:forEach>
		</tbody>
	</table>
</div>
</div>





</body>
</html>