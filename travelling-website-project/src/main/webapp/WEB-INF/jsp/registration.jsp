<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@
taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<html>
<head>
<metaname ="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<title>Create an account</title>

<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${contextPath}/resources/css/common.css" rel="stylesheet">

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

	<div class="container">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6 col-xs-12">
				<div class="jumbotron">
					<form:form method="POST" modelAttribute="userForm"
						class="form-signin">

						<h1 class="text-center">Sign up to travel</h1>
						<font color="red">${errorPhone}</font>
						<font color="red">${errorEmail}</font>
						<p class="lead" align="center">Please enter you details below.</p>
						<br>
						
						<spring:bind path="username">
							<div class="form-group ${status.error ? 'has-error' : ''}">
								<form:input type="text" path="username" class="form-control"
									placeholder="Username" autofocus="true"></form:input>
								<form:errors path="username"></form:errors>
							</div>
						</spring:bind>

						<spring:bind path="password">
							<div class="form-group ${status.error ? 'has-error' : ''}">
								<form:input type="password" path="password" class="form-control"
									placeholder="Password"></form:input>
								<form:errors path="password"></form:errors>
							</div>
						</spring:bind>

						<spring:bind path="passwordConfirm">
							<div class="form-group ${status.error ? 'has-error' : ''}">
								<form:input type="password" path="passwordConfirm"
									class="form-control" placeholder="Confirm your password"></form:input>
								<form:errors path="passwordConfirm"></form:errors>
							</div>
						</spring:bind>

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

							
								<spring:bind path="email">
							<div class="form-group ${status.error ? 'has-error' : ''}">
								<form:input type="email" path="email" class="form-control"
									placeholder="email" autofocus="true"></form:input>
								<form:errors path="email"></form:errors>
							</div>
						</spring:bind>
							

							<spring:bind path="phone">
							<div class="form-group ${status.error ? 'has-error' : ''}">
								<form:input type="text" path="phone" class="form-control"
									placeholder="phone" autofocus="true"></form:input>
								<form:errors path="phone"></form:errors>
							</div>
						</spring:bind>



						<div align="center">
							<button type="submit" class="btn btn-outline-success">Sign
								up</button>
							<button type="reset" class="btn btn-outline-dark">Clear</button>
						</div>
					</form:form>

				</div>
			</div>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>