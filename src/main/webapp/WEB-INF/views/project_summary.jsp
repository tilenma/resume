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
</head>
<body>
	<script>
		$(document).ready(function(){
		    $("#homeTab").removeClass("active");
		    $("#projectsummaryTab").addClass("active");
		});
	</script>
	<div class="container-fluid">
		<jsp:include page="header.jsp" />

		<div class="menutitlecontainer">
			<div>
				<h3 class="projectdesc">Project Experience Summary</h3>
			</div>

			<div id="summary" class="table-responsive">
				<table class="table table-bordered">
					<thead>
						<tr class="success">
							<th class="wide-1"><div class="contentsubtitle">Project Name</div></th>
							<th class=""><div class="contentsubtitle">Client</div></th>
							<th class=""><div class="contentsubtitle">Sector / Industry</div></th>
							<th class=""><div class="contentsubtitle">Participate Duration</div></th>
							<th class="wide-2"><div class="contentsubtitle">Objective</div></th>
							<th class="wide-1"><div class="contentsubtitle">Online Demo /
									Production Link</div></th>
						</tr>
					</thead>
					<tbody>
						<tr class="success2">
							<td><div class="contentitem">Integration Service (IS) in Digital IT</div></td>
							<td><div class="contentitem">
									<a href="https://www.sunlife.com" target="_blank"> Sun Life Kong Limited
								</div></td>
							<td><div class="contentitem">Insurance</div></td>
							<td><div class="contentitem">7 months</div></td>
							<td><div class="contentitem">
				Lead the development of new capabilities in integration service system to support different business operations including policy creation, claims and value withdrawal.
							</div></td>
							<td><div class="contentitem">
									(Middleware)
								</div></td>
						</tr>						
						<tr class="success">
							<td><div class="contentitem">Class Licence for Offer of Telecommunications Services (CLOTS)</div></td>
							<td><div class="contentitem">
									<a href="https://www.ofca.gov.hk" target="_blank"> Office
										of the Communications Authority (OFCA) 
								</div></td>
							<td><div class="contentitem">Government / Public
									Services</div></td>
							<td><div class="contentitem">13 months</div></td>
							<td><div class="contentitem">
							Development of new licence management system to control telecommunications services 
							including mobile services, IDD, Wi-Fi eggs and Wireless Internet of Things.
							</div></td>
							<td><div class="contentitem">
									<a href="https://app2.coms-auth.hk/clots_ext/login" target="_blank">CLOTS Licence Registration</a>
								</div></td>
						</tr>					
						<tr class="success2">
							<td><div class="contentitem">Public Mobile Radio
									Station system (PMRS)</div></td>
							<td><div class="contentitem">
									<a href="https://www.ofca.gov.hk" target="_blank"> Office
										of the Communications Authority (OFCA) 
								</div></td>
							<td><div class="contentitem">Government / Public
									Services</div></td>
							<td><div class="contentitem">16 months</div></td>
							<td><div class="contentitem">Redevelopment of existing
									Foxpro application that supports the workflow of public mobile
									radio station licensing</div></td>
							<td><div class="contentitem">(Internal system)</div></td>
						</tr>
						<tr class="success">
							<td><div class="contentitem">Film Censorship Database
									Management System (FCDMS)</div></td>
							<td><div class="contentitem">
									<a href="https://www.ofnaa.gov.hk/" target="_blank"> Office
										for Film, Newspaper and Article Administration 
								</div></td>
							<td><div class="contentitem">Government / Public
									Services</div></td>
							<td><div class="contentitem">17 months</div></td>
							<td><div class="contentitem">Redevelopment of existing
									Lotus Notes application that supports the workflow of film
									censorship</div></td>
							<td><div class="contentitem">(Internal system)</div></td>
						</tr>
						<tr class="success2">
							<td><div class="contentitem">Online eCommerce System</div></td>
							<td><div class="contentitem">
									<a href="http://www.watsons.com.hk/" target="_blank">A.S. Watsons Group</a>
								</div></td>
							<td><div class="contentitem">Health and Beauty Retail</div></td>
							<td><div class="contentitem">11 months</div></td>
							<td><div class="contentitem">Implement and Customize
									eCommerce System for Watsons Philipphines</div></td>
							<td><div class="contentitem">
									<a href="http://www.watsons.com.ph" target="_blank">Watsons eShop Philippines</a>
								</div></td>
						</tr>
						<tr class="success">
							<td><div class="contentitem">Computer System for
									Assessment of Accident Consequence (ACAS)</div></td>
							<td><div class="contentitem">
									<a href="http://www.hko.gov.hk/abouthko/aboutus.htm"
										target="_blank">Hong Kong Observatory</a> (HKO)
								</div></td>
							<td><div class="contentitem">Government / Public
									Services</div></td>
							<td><div class="contentitem">20 months</div></td>
							<td><div class="contentitem">New system for automate
									assessment process</div></td>
							<td><div class="contentitem">
								<a href="http://www.hko.gov.hk/education/dbcp/plan/eng/r1.htm"
										target="_blank">Nuclear Accident Contingency Plan</a>
									<button type="button" class="btn btn-danger btn-md"
										style="width: 150px" onclick="gotoACAS()">
										<span id="gisicon" class="glyphicon glyphicon-eye-open"></span><b>Online
											Demo</b>
									</button>
								</div></td>
						</tr>
						<tr class="success2">
							<td><div class="contentitem">Smart card operation &
									clearing house system (OCHS)</div></td>
							<td><div class="contentitem">
									<a href="http://www.octopus.com.hk/" target="_blank">Octopus
										Holdings Limited</a>, <a href="http://www.rta.ae/" target="_blank">Dubai
										Government Roads and Transport Authority</a> (RTA)
								</div></td>
							<td><div class="contentitem">Finance</div></td>
							<td><div class="contentitem">41 months</div></td>
							<td><div class="contentitem">Manage and support smart
									card system for operation and transaction settlement</div></td>
							<td><div class="contentitem">
									<a href="http://www.nol.ae" target="_blank">Dubai Nol Card</a>
								</div></td>
						</tr>
						<tr class="success">
							<td><div class="contentitem">Regional Communication
									Services (RCS)</div></td>
							<td><div class="contentitem">
									<a href="http://www.axa.com.hk/" target="_blank">AXA Group</a>
								</div></td>
							<td><div class="contentitem">Insurance</div></td>
							<td><div class="contentitem">11 months</div></td>
							<td><div class="contentitem">New system for
									communication management</div></td>
							<td><div class="contentitem">
									<a href="https://www.thunderhead.com/" target="_blank">Enterprise Software-Thunderhead</a>
								</div></td>
						</tr>
						<tr class="success2">
							<td><div class="contentitem">DBS Two Phase
									Authentication (2FA)</div></td>
							<td><div class="contentitem">
									<a href="http://www.dbs.com.hk/" target="_blank">DBS Hong
										Kong</a>
								</div></td>
							<td><div class="contentitem">Banking</div></td>
							<td><div class="contentitem">12 months</div></td>
							<td><div class="contentitem">Enhance system security
									level</div></td>
							<td><div class="contentitem">
									<a href="https://internet-banking.hk.dbs.com/IB/Welcome"
										target="_blank">DBS eBanking Login</a>
								</div></td>
						</tr>
						<tr class="success">
							<td><div class="contentitem">Cathay Pacific Airline
									(CX) Business System Support</div></td>
							<td><div class="contentitem">
									<a href="https://www.cathaypacific.com/" target="_blank">Cathay
										Pacific Airline</a>
								</div></td>
							<td><div class="contentitem">Airline</div></td>
							<td><div class="contentitem">9 months</div></td>
							<td><div class="contentitem">Maintenance and support
									of over 180 business applications</div></td>
							<td><div class="contentitem">
									<a href="https://www.cathaypacific.com" target="_blank">Cathay Pacific</a>,									
									<a href="https://www.asiamiles.com" target="_blank">Asia Miles</a>
								</div></td>
						</tr>
						<tr class="success2">
							<td><div class="contentitem">Trade Development Centre
									eMarket Place</div></td>
							<td><div class="contentitem">
									<a href="https://www.hktdc.com/" target="_blank">Hong Kong
										Trade Development Council (HKTDC)</a>
								</div></td>
							<td><div class="contentitem">Trading</div></td>
							<td><div class="contentitem">16 months</div></td>
							<td><div class="contentitem">New platform for buyer
									and seller matching</div></td>
							<td><div class="contentitem">
									<a href="https://home.hktdc.com/en/source-products-services" target="_blank">HKTDC eMarketplace</a>										
								</div></td>
						</tr>
					</tbody>
					</tbody>
				</table>

			</div>
		</div>
	</div>
</body>
</html>

