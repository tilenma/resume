<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login page</title>
<jsp:include page="../acas_common.jsp" />
<link rel="stylesheet" type="text/css"
	href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.css" />
</head>

<body>
	<div class="container-fluid">
		<div class="row">			
				<div class="col-md-4 narrow">
				</div>
				<div class="col-md-4 narrow">
					<div class="menutitlecontainer">
						<div><h4 class="maptitle">Admin Login</h4></div>
					<c:url var="loginUrl" value="/login" />
					<form action="${loginUrl}" method="post" class="form-horizontal">
						<c:if test="${param.error != null}">
							<div class="alert alert-danger">
								<p>Invalid username and password.</p>
							</div>
						</c:if>
						<c:if test="${param.logout != null}">
							<div class="alert alert-success">
								<p>You have been logged out successfully.</p>
							</div>
						</c:if>
						<div class="input-group input-sm">
							<label class="input-group-addon" for="username"><i
								class="fa fa-user"></i></label> <input type="text" class="form-control"
								id="username" name="ssoId" placeholder="Enter Username" required autofocus>
						</div>
						<div class="input-group input-sm">
							<label class="input-group-addon" for="password"><i
								class="fa fa-lock"></i></label> <input type="password"
								class="form-control" id="password" name="password"
								placeholder="Enter Password" required>
						</div>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />

						<div class="form-actions">
							<input type="submit"
								class="btn btn-block btn-primary btn-default" value="Log in">
						</div>
					</form>
						<div><a href="<c:url value="/" />">Back to Home</a></div>
					</div>
				</div>
		</div>
	</div>
		<div class="menutitlecontainer">
			<div><h3 class="projectdesc">About this Login Page</h3></div>
			<div class="row">
			    <div class="col-md-3 techdesc">Spring Security 4.2.10.RELEASE</div>
			    <div class="col-md-3 techdesc">Spring MVC 4.3.15.RELEASE</div>		    
			</div>
		</div>
</body>
</html>