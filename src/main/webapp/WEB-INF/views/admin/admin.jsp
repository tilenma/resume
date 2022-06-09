<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<title>Admin Page</title>
<style>
</style>
<meta charset="utf-8">
<jsp:include page="../common.jsp" />

<link rel="stylesheet"
	href="<spring:url value="/resources/css/draw.css"/>" type="text/css">
</head>
<body>
	<script>
		function backHome() {
			var url = 'acas';
			$(location).attr('href', url);
		}
	</script>
	<div class="container-fluid">
		<div class="menutitlecontainer">
			<div>
				<h3 class="projectdesc">Demo on ACAS Project - Spring Security2</h3>
			</div>
			<div class="row">
				<div class="col-md-3 techdesc">Spring Security 4.0.1.RELEASE</div>
				<div class="col-md-3 techdesc">Spring MVC 4.1.7.RELEASE</div>
				<div class="col-md-3">
					<button type="button" class="btn btn-primary btn-md"
						style="width: 120px" onclick="backHome()">
						<span id="mapicon" class="glyphicon glyphicon-home"></span><b>Home</b>
					</button>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-md-4 narrow">
				Dear <strong>${user}</strong>, Welcome to Admin Page.
			</div>
			<div class="col-md-4 narrow"></div>
			<div class="col-md-4 narrow">
				<a href="<c:url value="/logout" />">Logout</a>
			</div>
		</div>

		<c:if test="${param.runEtl != null}">
			<div class="alert alert-danger">
				<p>ETL Program is triggered manually.</p>
			</div>
		</c:if>
		<c:if test="${param.startEtl != null}">
			<div class="alert alert-danger">
				<p>ETL Program is scheduled.</p>
			</div>
		</c:if>
		<c:if test="${param.stopEtl != null}">
			<div class="alert alert-danger">
				<p>ETL Program is stopped.</p>
			</div>
		</c:if>
		<c:if test="${param.saveProduct != null}">
			<div class="alert alert-danger">
				<p>Product list is updated.</p>
			</div>
		</c:if>

		<div class="menutitlecontainer">
			<table class="table table-bordered">
				<thead>
					<tr class="success">
						<th><div class="contentsubtitle">System Parameter</div></th>
						<th><div class="contentsubtitle">Value</div></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="key" items="${keyList}" varStatus="status">
						<c:if test="${status.index%2==0 }">
							<tr class="success">
						</c:if>
						<c:if test="${status.index%2==1 }">
							<tr class="success2">
						</c:if>
						<td><div class="contentitem">${key}</div></td>
						<td><div class="contentitem">${valueList.get(status.index)}</div></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>