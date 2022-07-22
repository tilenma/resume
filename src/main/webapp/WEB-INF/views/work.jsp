<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page session="false"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<link rel="icon" href="resources/image/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="resources/image/favicon.ico"
	type="image/x-icon">
<html>
<head>
<title>Tilen Ma's Online Resume</title>
<style>
</style>
<meta charset="utf-8">
<jsp:include page="common.jsp" />
<link rel="stylesheet"
	href="<spring:url value="/resources/css/draw.css"/>" type="text/css">
<link rel="stylesheet"
	href="<spring:url value="/resources/css/timeline.css"/>"
	type="text/css">
</head>
<body>
	<script>
		function gotoACAS() {
			var url = 'acas';
			$(location).attr('href', url);
		}
		$(document).ready(function() {
			$('[data-toggle="tooltip"]').tooltip();
			$("#homeTab").removeClass("active");
			$("#workTab").addClass("active");
		});
	</script>
	<div class="container-fluid">
		<jsp:include page="header.jsp" />

		<div class="menutitlecontainer">
			<div>
				<h3 class="projectdesc">Roles & Responsibilities</h3>
			</div>
			<div class="timeline">
				<div class="container2 left2">
					<div class="card2">
						<!-- 
						<img src="img.jpg" alt="John" style="width: 100%"> -->
						<div class="content2">
							<h2>2020-02-03 to 2022-04-24</h2>
							<h1>Technical Lead</h1>
							<p class="title"><a href="https://www.sunlife.com" target="_blank">Sun Life Hong Kong Limited</a></p>
							<p class="title">Digital IT</p>
							<div class="contentitem">
								<span class="glyphicon glyphicon-signal"></span>Lead development
								team to transform existing IT systems by adding new features to
								middleware application
							</div>
							<div class="contentitem">
								<span class="glyphicon glyphicon-signal"></span>Provide
								technical advice and project management for the on-going support
								of existing web applications, mobile applications and
								middlewares
							</div>
							<div class="contentitem">
								<span class="glyphicon glyphicon-signal"></span>Requirements
								gathering, coding, application design and code review
							</div>
							<div class="licontentitem">Major Projects</div>
							<p>
								<a class= "btn btn-warning" href="<spring:url value="/project#is"/>">Integration Service (IS)</a>
							</p>
							<p>
								<a class= "btn btn-warning" href="<spring:url value="/project#fps"/>">Faster Payment Service (FPS)</a>
							</p>							
						</div>
					</div>
				</div>
				<div class="container2 right2">
					<div class="card2">
						<!-- 
						<img src="img.jpg" alt="John" style="width: 100%"> -->
						<div class="content2">
							<h2>2017-10-16 to 2020-01-28</h2>
							<h1>Assistant IT Manager</h1>
							<p class="title">
								<a href="https://www.ofca.gov.hk" target="_blank">Office of
									The Communications Authority (OFCA)</a>
							</p>
							<p class="title">Hong Kong SAR Government</p>
							<div class="contentitem">
								<span class="glyphicon glyphicon-star"></span>Lead development
								team to implement project deliverables of new IT systems
							</div>
							<div class="contentitem">
								<span class="glyphicon glyphicon-star"></span>Provide IT advice,
								project management and coordination service for the on-going
								support of existing IT applications, web applications and GIS
								systems
							</div>
							<div class="contentitem">
								<span class="glyphicon glyphicon-star"></span>Staff management,
								vendor management and outsourcing contractor management
							</div>
							<div class="contentitem">
								<span class="glyphicon glyphicon-star"></span>Perform quality
								assurance of contractor’s deliverables and services
							</div>
							<div class="licontentitem">Major Projects</div>
							<p>
								<a class= "btn btn-warning" href="<spring:url value="/project#clots"/>">Class Licence for Offer of Telecommunications Services (CLOTS)</a>
								<a class= "btn btn-warning" href="<spring:url value="/project#pmrs"/>">Public Mobile Radio Station system (PMRS)</a>
								<button>Film Censorship Database Management System (FCDMS)</button>
							</p>
						</div>
					</div>
				</div>
				<div class="container2 left2">
					<div class="card2">
						<!-- 
						<img src="img.jpg" alt="John" style="width: 100%"> -->
						<div class="content2">
							<h2>2016-12-12 to 2017-10-15</h2>
							<h1>System Analyst</h1>
							<p class="title"><a href="https://www.dxc.technology/about_us/ds/29505-company_profile" target="_blank">Hewlett-Packard Enterprise (HPE) / DXC
										Technology</a></p>
							<p class="title">A.S. Watsons eLab</p>
							<div class="contentitem">
								<span class="glyphicon glyphicon-glass"></span>Lead development team to design and implement eCommerce system for A.S. Watsons
							</div>
							<div class="licontentitem">Major Projects</div>
							<p>
							<a class= "btn btn-warning" href="<spring:url value="/project#ecom"/>">Online eCommerce System</a>
							</p>
						</div>
					</div>
				</div>
				<div class="container2 right2">
					<div class="card2">
						<!-- 
						<img src="img.jpg" alt="John" style="width: 100%"> -->
						<div class="content2">
							<h2>2015-02-23 to 2016-12-11</h2>
							<h1>Analyst Programmer</h1>
							<p class="title">
								<a href="https://www.hko.gov.hk/en/abouthko/aboutus.htm"
										target="_blank">Hong Kong Observatory</a>
							</p>
							<p class="title">Hong Kong SAR Government</p>
							<div class="contentitem">
									<span class="glyphicon glyphicon-picture"></span>Manage
									enhancement project for model simulation system for nuclear
									accident in HKO
							</div>
								<div class="contentitem">
									<span class="glyphicon glyphicon-picture"></span>Visualize and
									manage GIS data on web-based platform to facilitate nuclear
									accident consequence assessment
								</div>							
							<div class="licontentitem">Major Projects</div>
							<p>
								<a class= "btn btn-warning" href="<spring:url value="/project#acas"/>">Computer System for Assessment
										of Accident Consequence (ACAS)</a>
							</p>
						</div>
					</div>
				</div>
				<div class="container2 left2">
					<div class="card2">
						<!-- 
						<img src="img.jpg" alt="John" style="width: 100%"> -->
						<div class="content2">
							<h2>2011-09-14 to 2015-02-21</h2>
							<h1>Senior System Engineer</h1>
							<p class="title"><a href="https://www.octopus.com.hk/en/consumer/index.html" target="_blank">Octopus
										Holdings Limited</a></p>
							<p class="title">International Team</p>
								<div class="contentitem">	
									<span class="glyphicon glyphicon-globe"></span>Manage and
									support smart card systems overseas (Dubai, Netherland,
									Auckland, Budapest) for daily operation and transaction
									settlement
								</div>
								<div class="contentitem">
									<span class="glyphicon glyphicon-globe"></span>Implement and
									follow-up change requests and system defects
								</div>
							<div class="licontentitem">Major Projects</div>
							<p>
								<a class= "btn btn-warning" href="<spring:url value="/project#ochs"/>">Smart card operation & clearing house system (OCHS)</a>
							</p>
						</div>
					</div>
				</div>
				<div class="container2 right2">
					<div class="card2">
						<!-- 
						<img src="img.jpg" alt="John" style="width: 100%"> -->
						<div class="content2">
							<h2>2007-08-01 to 2011-09-12</h2>
							<h1>I/T Specialist</h1>
							<p class="title">
								<a href="https://www.ibm.com/hk-en" target="_blank">IBM
										China/Hong Kong Limited</a>
							</p>
							<p class="title">Global Business Services, Delivery</p>
							<div class="contentitem">
									<span class="glyphicon glyphicon-gift"></span>Deliver
									Project-based on demand I/T Solution for clients in different
									industries (e.g. insurance, banking, airline and trading)
								</div>					
							<div class="licontentitem">Major Projects</div>
							<p>
								<a class= "btn btn-warning" href="<spring:url value="/project#rcs"/>">Regional Communication Services
										(RCS)</a>
								<a class= "btn btn-warning" href="<spring:url value="/project#dbs"/>">DBS Two Phase Authentication
										(2FA)</a>
								<a class= "btn btn-warning" href="<spring:url value="/project#cxmain"/>">Cathay Pacific Airline (CX)
										Business System Support</a>																				
								<a class= "btn btn-warning" href="<spring:url value="/project#emp"/>">Trade Development Centre eMarket</a>
							</p>
						</div>
					</div>
				</div>
				<div class="container2 left2">
					<div class="card2">
						<!-- 
						<img src="img.jpg" alt="John" style="width: 100%"> -->
						<div class="content2">
							<h2>2004-06-21 to 2004-08-21</h2>
							<h1>Junior Research Assistant</h1>
							<p class="title"><a href="http://www.cuhk.edu.hk/english/index.html"
										target="_blank">The Chinese University of Hong Kong</a></p>
							<p class="title">Computer Science and Engineering Department</p>
								<div class="contentitem">	
									<span class="glyphicon glyphicon-map-marker"></span>Research
									and develop localization applications for mobile devices
								</div>
						</div>
					</div>
				</div>				
			</div> <!-- end of timeline -->
		</div>
	</div>
	<div class="container-fluid">
		<jsp:include page="footer.jsp" />
	</div>	
	<script>
		$(".nav-tabs a").click(function() {
			$(this).tab('show');
		});
	</script>
</body>
</html>

