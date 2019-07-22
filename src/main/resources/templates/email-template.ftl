
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Your Flight has been Booked</title>
</head>

<body>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td align="center" valign="top" bgcolor="#6495ED"
				style="background-color: #6495ED;"><br> <br>
				<table width="600" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td align="center" valign="top" bgcolor="#FFB6C1"
							style="background-color: #FFB6C1; font-family: Arial, Helvetica, sans-serif; font-size: 13px; color: #000000; padding: 0px 15px 10px 15px;">
							
							<div style="font-size: 48px; color:blue;">
								<b>Please review the following information about your ticket</b>
							</div>
							
							<div style="font-size: 24px; color: red;">
							Flight Num : ${flight.flightNum}<br>
							Departure : ${flight.departure}<br>
							Arrival : ${flight.arrival}<br>
							<br>
							Passenger Details:<br>
							<#list listOfPassengers as passenger>
								${passenger.lastname}, ${passenger.firstname} <br>
							</#list>
							</div>
							<div>
								<h4>you are officially a member</h4>
							</div>
						</td>
					</tr>
				</table> <br> <br></td>
		</tr>
	</table>
</body>
</html>