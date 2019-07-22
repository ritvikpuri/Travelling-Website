<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@
taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

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

<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">

<title>Log in with your account</title>

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
				<h1 class="text-center">Login Page</h1>
						<p class="lead" align="center">
							Come fly with us <i class="fa fa-plane"></i>
						</p>
						<br>
					<form method="POST" action="${contextPath}/login"
						class="form-signin">

						<div class="form-group ${error != null ? 'has-error' : ''}">
							<span>${message}</span> <input name="username" type="text"
								class="form-control" placeholder="Username" autofocus="true" />
								<br>
							<input name="password" type="password" class="form-control"
								placeholder="Password" /> <span>${error}</span> <input
								type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
								<br>
							<div align="center">
							<button type="submit" class="btn btn-outline-info">Login</button>
							<button type="reset" class="btn btn-outline-dark">Close</button>
							</div>
							<br>
							<div>
							<font size="4">New flyer?</font> <a href="${contextPath}/registration">Sign Up</a>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>