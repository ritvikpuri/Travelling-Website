<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List"%>

<html>
<head>
	<title>Select your Flight</title>
</head>

<body>
    <font color = "red"> ${errorMessage} </font>
	<h4>The following matching flights have been found</h4>
	

<table border= "2">
	<tr>
		<th>Flight Number</th>
        <th>Airlines Name</th>
        <th>Departure City</th>
        <th>Arrival City</th>
        <th>Departure Time</th>
        <th>Arrival Time</th>    
    </tr>

<c:forEach items="${flightList}" var="flight">
        <tr>
        	<td> <c:out value="${flight.flight_num}"/> </td>
        	<td> <c:out value="${flight.airlines}"/> </td>
        	<td> <c:out value="${flight.departure}"/> </td>
        	<td> <c:out value="${flight.arrival}"/> </td>
        	<td> <c:out value="${flight.dep_time}"/> </td>
        	<td> <c:out value="${flight.arr_time}"/> </td>
        </tr>
    </c:forEach>
</html>
</body>

</html>