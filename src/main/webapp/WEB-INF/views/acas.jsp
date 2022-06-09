<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page session="false"%>
<html>
<head>
<title>ACAS Home</title>
<style>
</style>
</head>
<meta charset="utf-8">
<jsp:include page="common.jsp" />

<body>
	<div class="container-fluid">
		<jsp:include page="header.jsp" />

		<div class="menutitlecontainer">
			<div>
				<h3 class="projectdesc">Demo on ACAS Project</h3>
			</div>
			<div>Hong Kong Observatory (HKO) operates an accident
				consequence assessment system(ACAS) to assess the possible
				consequences of nuclear accidents with release of radioactive
				material from nuclear power stations. The objective of this project
				is to implement a new ACAS so that the simulation process can be
				automated and the results are displayed in a user-friendly manner in
				GIS platform.</div>
		</div>
	</div>

	<div class="container-fluid">
		<h2 class="maptitle">Display Panel for Accident Consequence
			Assessment Products</h2>
		<div class="row">
			<div class="col-md-9 col-xs-9">
				<h4 class="mapdesc">
					Latest run: <span class="textdesc">${project}
						(${description})</span>
				</h4>
			</div>
			<div class="col-md-3 col-xs-3 rightAlign">
				<a href="admin">Admin Login</a>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3">
				<div class="boxcontainer vertical30">
					<a>Summary <img
						src="<spring:url value="/resources/image/monitor1.jpg"/>"
						height="75%">
					</a>
				</div>
			</div>
			<div class="col-md-3">
				<div class="boxcontainer vertical30">
					<a href="gis">Effective Dose & Thyroid Dose <img
						src="<spring:url value="/resources/image/monitor2.jpg"/>"
						height="75%">
					</a>
				</div>
			</div>
			<div class="col-md-3">
				<div class="boxcontainer vertical30">
					<a>Cloud Arrival Time <img
						src="<spring:url value="/resources/image/monitor3.jpg"/>"
						height="75%">
					</a>
				</div>
			</div>
			<div class="col-md-3">
				<div class="boxcontainer vertical30">
					<a>Map of Total Potential Effective Dose & Thyroid
						Dose <img
						src="<spring:url value="/resources/image/monitor4.jpg"/>"
						height="75%">

					</a>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3">
				<div class="boxcontainer vertical30">
					<a>Total Effective Gamma Dose Rate <img
						src="<spring:url value="/resources/image/monitor5.jpg"/>"
						height="75%">

					</a>
				</div>
			</div>
			<div class="col-md-3">
				<div class="boxcontainer vertical30">
					<a>Air Concentration for Specific Radionuclide<img
						src="<spring:url value="/resources/image/monitor6.jpg"/>"
						height="75%">
					</a>
				</div>
			</div>
			<div class="col-md-3">
				<div class="boxcontainer vertical30">
					<a>Total Ground Deposition for Specific Radionuclide <img
						src="<spring:url value="/resources/image/monitor7.jpg"/>"
						height="75%">

					</a>
				</div>
			</div>
			<div class="col-md-3">
				<div class="boxcontainer vertical30">
					<a>Control Page <img
						src="<spring:url value="/resources/image/monitor8.jpg"/>"
						height="75%">
					</a>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>
