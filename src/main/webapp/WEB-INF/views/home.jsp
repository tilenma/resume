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


<!--
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-more.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>

<script
	src="<spring:url value="/resources/js/highcharts/highcharts.js"/>"
	type="text/javascript"></script>
<script
	src="<spring:url value="/resources/js/highcharts/highcharts-more.js"/>"
	type="text/javascript"></script>
<script
	src="<spring:url value="/resources/js/highcharts/modules/exporting.js"/>"
	type="text/javascript"></script>
-->
<link rel="stylesheet"
	href="<spring:url value="/resources/css/coupon.css"/>" type="text/css">
<link rel="stylesheet"
	href="<spring:url value="/resources/css/slideshow.css"/>"
	type="text/css">
</head>
<body>
	<div class="container-fluid">
		<jsp:include page="header.jsp" />
		<h3 class="projectdesc">
			My IT Experience: ${workYear} years ${workMonth} months
			<a href="#" data-toggle="tooltip" title="A total of ${totalDay} days (auto counting)">
				<span class="glyphicon glyphicon-question-sign"></span></a>
		</h3>
		<!-- Dots/bullets/indicators -->
		<div class="dot-container">
			<span class="dot" onclick="currentSlide(1)"></span>
			<button type="button" class="btn btn-success btn-lg" id="summaryBtn" onclick="currentSlide(1)">
			<span class="glyphicon glyphicon-screenshot"></span> Summary</button>

			<span class="dot" onclick="currentSlide(2)"></span>
			<button type="button" class="btn btn-success btn-lg" id="certBtn" onclick="currentSlide(2)">
			<span class="glyphicon glyphicon-list-alt"></span> Certifications</button>		
		</div>
		<!-- Slideshow container -->
		<div class="slideshow-container">
			<!-- Full-width slides/quotes -->
			<div class="mySlides">
				<table class="table">
					<thead>
						<tr>
							<th class="col-md-4"></th>
							<th class="col-md-4"></th>
							<th class="col-md-4"></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<div class="coupon">
									<div class="coupon-container">
										<h3>Technical Lead / Manager</h3>
									</div>
									<img
										src="<spring:url value="/resources/image/leadership.jpg"/>"
										alt="Leader" style="width: 100%;">
									<div class="coupon-container" style="background-color: white">
										<h2>
											<b>Leading a team</b>
										</h2>
										<p>to deliver IT projects under best practices</p>
									</div>
									<div class="coupon-container">
										<p>
											Skills: <span class="promo">PMP</span> 
											<span class="promo">Scrum Master</span>
											<span class="promo">Agile</span> 
											<span class="promo">Full SDLC</span>
										</p>
										<p class="expire">7+ year of project management experience</p>
									</div>
								</div>
							</td>
							<td>
								<div class="coupon">
									<div class="coupon-container">
										<h3>System Analyst / Enterprise Architect</h3>
									</div>
									<img
										src="<spring:url value="/resources/image/systemdesign.png"/>"
										alt="System Analyst" style="width: 100%;">
									<div class="coupon-container" style="background-color: white">
										<h2>
											<b>Design and Develop</b>
										</h2>
										<p>to develop applications with quality control</p>
									</div>
									<div class="coupon-container">
										<p>
											Skills: <span class="promo">Certified Architect</span>
											<span class="promo">AWS certified</span>
											<span class="promo">System Design</span> 
											<span class="promo">Code review</span>
										</p>
										<p class="expire">13+ year in application design and development</p>
										<p class="expire">11+ year in Java-based web application</p>
									</div>
								</div>
							</td>
							<td>
								<div class="coupon">
									<div class="coupon-container">
										<h3>Fast Learner</h3>
									</div>
									<img
										src="<spring:url value="/resources/image/fastlearner.jpg"/>"
										alt="Fast Learner" style="width: 100%;">
									<div class="coupon-container" style="background-color: white">
										<h2>
											<b>Advance and Adopt</b>
										</h2>
										<p>to adopt new technology and skills passionately</p>
									</div>
									<div class="coupon-container">
										<p>
											Skills: <span class="promo">Proof of Concepts</span>
											<span class="promo">Self learning</span> 
											<span class="promo">Apply</span>
											<span class="promo">Open Source Tools</span>
										</p>
										<p class="expire">Keep learning and apply project management, leadership and architecture skills</p>
									</div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="mySlides">
				<table class="table">
					<thead>
						<tr>
							<th class="col-md-4"></th>
							<th class="col-md-4"></th>
							<th class="col-md-4"></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<div class="coupon">
									<div class="coupon-container">
										<h3>Project Management Professional</h3>
									</div>
									<img src="resources/icon/pmp.png" alt="PMP" style="width: 100%;">
									<div class="coupon-container" style="background-color: white">
										<p>certified by Project Management Institute</p>
									</div>
								</div>
							</td>
							<td>
								<div class="coupon">
									<div class="coupon-container">
										<h3>TOGAF Enterprise Architect</h3>
									</div>
									<img src="resources/icon/togaf.jpg" alt="Togaf" style="width: 100%;">
									<div class="coupon-container" style="background-color: white">
										<p>certified by the Open Group</p>
									</div>
								</div>
							</td>							
							<td>
								<div class="coupon">
									<div class="coupon-container">
										<h3>Scrum Master</h3>
									</div>
									<img src="resources/icon/scrum.png" alt="Scrum" style="width: 100%;">
									<div class="coupon-container" style="background-color: white">
										<p>certified by Project Management Institute</p>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="coupon">
									<div class="coupon-container">
										<h3>AWS Solution Architect - Associate</h3>
									</div>
									<img src="resources/icon/aws_sa.png" alt="AWS SA" style="width: 100%;">
									<div class="coupon-container" style="background-color: white">
										<p>certified by Amazon Web Services</p>
									</div>
								</div>
							</td>
							<td>
								<div class="coupon">
									<div class="coupon-container">
										<h3>Profession Scrum Developer</h3>
									</div>
									<img src="resources/icon/psd.png" alt="PSD" style="width: 100%;">
									<div class="coupon-container" style="background-color: white">
										<p>certified by Scrum.org</p>
									</div>
								</div>
							</td>	
							<td></td>						
						</tr>
					</tbody>
				</table>
			</div>			
			<!-- Next/prev buttons -->
			<a class="prev" onclick="plusSlides(-1)">&#10094;</a> <a class="next"
				onclick="plusSlides(1)">&#10095;</a>
		</div>
	</div>
	<script src="<spring:url value="/resources/js/slideshow.js"/>"
		type="text/javascript"></script>
	<div class="container-fluid">
		<jsp:include page="footer.jsp" />
	</div>
	
	<script>		
		var hash = $(location).prop('hash');
		if(hash != null && hash != ''){
			//alert(hash);
			$(hash).click();
		}
	</script>
</body>
</html>

