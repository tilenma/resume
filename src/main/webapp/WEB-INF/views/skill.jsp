<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page session="false"%>
<%@ page contentType="text/html; charset=UTF-8" %>
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
<script
	src="<spring:url value="/resources/js/highcharts/highcharts.js"/>"
	type="text/javascript"></script>
<script
	src="<spring:url value="/resources/js/highcharts/highcharts-more.js"/>"
	type="text/javascript"></script>
<script
	src="<spring:url value="/resources/js/highcharts/modules/exporting.js"/>"
	type="text/javascript"></script>
<link rel="stylesheet"
	href="<spring:url value="/resources/css/draw.css"/>" type="text/css">
</head>
<body>
	<div class="container-fluid">
		<jsp:include page="header.jsp" />

		<div class="menutitlecontainer">
			<div>
				<h3 class="projectdesc">Technical Skills</h3>
			</div>		
			<ul class="nav nav-tabs">						
				<li><a data-toggle="tab" href="#skill" class="nav-item nav-link"><h4>By Category</h4></a></li>
				<li><a data-toggle="tab" href="#strength" class="nav-item nav-link"><h4>Key Strength</h4></a></li>
				<li><a data-toggle="tab" href="#infograph" class="nav-item nav-link active"><h4>Infographics</h4></a></li>
			</ul>
			
			<div class="tab-content">
				<div id="skill" class="tab-pane fade">
					<table class="table table-bordered">
						<tbody>
							<tr class="warning">
								<th><div class="contentsubtitle">Programming</div></th>
								<td>					
									<img src="resources/icon/java.png" title="Java" height="80" width="80">
									<img src="resources/icon/js.png" title="Javascript" height="80" width="80">					
									<img src="resources/icon/jsp.png" title="Java Server Pages" height="80" width="80">
									<img src="resources/icon/sql.png" title="Database SQL" height="80" width="80">
									<img src="resources/icon/ws.png" title="Web Service" height="80" width="80">
									<img src="resources/icon/xml.png" title="XML" height="80" width="80">
									<img src="resources/icon/jquery.png" title="JQuery" height="80" width="80">
								</td>
							</tr>
							<tr class="warning2">
								<th><div class="contentsubtitle">Framework</div></th>
								<td>
									<img src="resources/icon/spring.png" title="Spring" height="80" width="80">
									<img src="resources/icon/struts.png" title="Struts 2" height="80" width="80">
									<img src="resources/icon/mvc.png" title="Spring MVC" height="80" width="80">
									<img src="resources/icon/spring_security.png" title="Spring Security" height="80" width="80">
									<img src="resources/icon/hibernate.png" title="Spring Hibernate" height="80" width="80">
									<img src="resources/icon/j2ee.png" title="Java Enterprise Edition" height="80" width="80">
								</td>
							</tr>
							<tr class="warning">
								<th><div class="contentsubtitle">Application Server</div></th>
								<td>									
									<img src="resources/icon/tomcat.png" title="Apache Tomcat" height="80" width="80">
									<img src="resources/icon/weblogic.png" title="Oracle Weblogic Server" height="80" width="80">
									<img src="resources/icon/jboss.png" title="Red Hat JBoss Server" height="80" width="80">
									<img src="resources/icon/websphere.png" title="IBM Websphere Application Server" height="80" width="80">												
									<img src="resources/icon/ec2.png" title="AWS ec2" height="80" width="80">
								</td>
							</tr>
							<tr class="warning2">
								<th><div class="contentsubtitle">Database Server</div></th>
								<td>
									<img src="resources/icon/oracle.png" title="Oracle Databsae" height="80" width="80">
									<img src="resources/icon/postgresql.png" title="PostgreSQL Databsae" height="80" width="80">
									<img src="resources/icon/mssql.png" title="Microsoft SQL Database" height="80" width="80">
									<img src="resources/icon/mysql.png" title="My SQL Database" height="80" width="80">
								</td>
							</tr>			
							<tr class="warning">
								<th><div class="contentsubtitle">OS Platform</div></th>
								<td>
									<img src="resources/icon/hpunix.png" title="HP Unix" height="80" width="80">
									<img src="resources/icon/winserver.png" title="Windows Server" height="80" width="80">
									<img src="resources/icon/centos.jpg" title="Linux Cent OS" height="80" width="80">
									<img src="resources/icon/unix.png" title="Unix OS" height="80" width="80">
									<img src="resources/icon/aix.png" title="IBM AIX" height="80" width="80">				
								</td>
							</tr>			
							<tr class="warning2">
								<th><div class="contentsubtitle">Development & Testing</div></th>
								<td>
									<img src="resources/icon/sts.png" title="Spring Tool Suite" height="80" width="80">
									<img src="resources/icon/ecllipse.png" title="Ecllipse" height="80" width="80">
									<img src="resources/icon/junit.png" title="Junit" height="80" width="80">
									<img src="resources/icon/soapui.png" title="SoapUI" height="80" width="80">
									<img src="resources/icon/selenium.png" title="Selenium" height="80" width="80">
								</td>
							</tr>
							<tr class="warning">
								<th><div class="contentsubtitle">DevOps Tools</div></th>
								<td>
									<img src="resources/icon/maven.png" title="Apache Maven" height="80" width="80">
									<img src="resources/icon/subversion.png" title="Subversion" height="80" width="80">
									<img src="resources/icon/git.png" title="Git" height="80" width="80">
									<img src="resources/icon/bitbucket.png" title="Bitbucket" height="80" width="80">
									<img src="resources/icon/jenkins.png" title="Jenkins" height="80" width="80">
									<img src="resources/icon/jira.jpg" title="JIRA" height="80" width="80">
								</td>
							</tr>							
							<tr class="warning2">
								<th><div class="contentsubtitle">Enterprise Software</div></th>
								<td>
									<img src="resources/icon/openlayers.png" title="Openlayers 3" height="80" width="80">
									<img src="resources/icon/postgis.png" title="PostGIS" height="80" width="80">
									<img src="resources/icon/googlemap.png" title="Google Map" height="80" width="80">
									<img src="resources/icon/jasperreport.png" title="Jasper Report" height="80" width="80">
									<img src="resources/icon/liferay.png" title="Liferay Portal Server" height="80" width="80">
									<img src="resources/icon/hybris.png" title="Hybris" height="80" width="80">
									<img src="resources/icon/tableau.jpg" title="Tableau" height="80" width="80">
								</td>
							</tr>																														
						</tbody>
					</table>
				</div>
				
				<div id="strength" class="tab-pane fade">
				    <table class="table table-bordered">
					<tbody>
						<tr class="danger">
							<th><div class="contentsubtitle">System Performance Tuning</div></th>
							<td>
								<span class="contentitem">Java application refactoring, database performance tuning</span>
							</td>
						</tr>
						<tr class="danger2">
							<th><div class="contentsubtitle">Problem Solving</div></th>
							<td>
								<span class="contentitem">Incident trouble-shooting, impact analysis, defect fixing</span>
							</td>
						</tr>	
						<tr class="danger">
							<th><div class="contentsubtitle">Project Management</div></th>
							<td>
								<span class="contentitem">Risk management, solid experienced in full SDLC</span>
							</td>
						</tr>
						<tr class="danger2">
							<th><div class="contentsubtitle">Coding Standard</div></th>
							<td>
								<span class="contentitem">Apply best practices in system design and development</span>
							</td>
						</tr>
						<tr class="danger">
							<th><div class="contentsubtitle">Enterprise System</div></th>
							<td>
								<span class="contentitem">Proficiency in n-tier architecture that suits enterprise business need</span>
							</td>
						</tr>						
						<tr class="danger2">
							<th><div class="contentsubtitle">Open Standard</div></th>
							<td>
								<span class="contentitem">Specialized in up-to-date and open source technology </span>
							</td>
						</tr>	
						<tr class="danger">
							<th><div class="contentsubtitle">Web-based Application</div></th>
							<td>
								<span class="contentitem">Mastered web application framework, coding standard and architecture</span>
							</td>
						</tr>																													
					</tbody>
					</table>
				</div>
				<div id="infograph" class="tab-pane in active">
					<div class="menutitlecontainer">
						<div id="container"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<jsp:include page="footer.jsp" />
	</div>
	<script
		src="<spring:url value="/resources/js/highcharts/highcharts_impl.js"/>"
		type="text/javascript"></script>	
	<script>
		$(".nav-tabs a").click(function() {
			$(this).tab('show');
		});
	</script>
</body>
</html>

