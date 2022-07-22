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

<link rel="stylesheet"
	href="<spring:url value="/resources/css/draw.css"/>" type="text/css">
</head>
<body>
	<div class="container-fluid">				
		<jsp:include page="header.jsp" />
		<div class="menutitlecontainer">
			<div>
				<h3 class="projectdesc">Project Experience Details</h3>
			</div>
			<ul class="nav nav-tabs">
				<li><a data-toggle="tab" href="#fps" class="nav-item nav-link active"><h5>SLF-FPS</h5></a></li>
				<li><a data-toggle="tab" href="#is" class="nav-item nav-link"><h5>SLF-IS</h5></a></li>
				<li><a data-toggle="tab" href="#clots" class="nav-item nav-link"><h5>OFCA-CLOTS</h5></a></li>
				<li><a data-toggle="tab" href="#pmrs" class="nav-item nav-link"><h5>OFCA-PMRS</h5></a></li>
				<li><a data-toggle="tab" href="#ecom" class="nav-item nav-link"><h5>Watsons-eCom</h5></a></li>
				<li><a data-toggle="tab" href="#acas" class="nav-item nav-link"><h5>HKO-ACAS</h5></a></li>
				<li><a data-toggle="tab" href="#ochs" class="nav-item nav-link"><h5>Octopus-OCHS</h5></a></li>
				<li><a data-toggle="tab" href="#rcs" class="nav-item nav-link"><h5>AXA-RCS</h5></a></li>
				<li><a data-toggle="tab" href="#dbs" class="nav-item nav-link"><h5>DBS-2FA</h5></a></li>
				<li><a data-toggle="tab" href="#cxmain" class="nav-item nav-link"><h5>CX-Main</h5></a></li>
				<li><a data-toggle="tab" href="#emp" class="nav-item nav-link"><h5>HKTDC-eMP</h5></a></li>
			</ul>
			
			<div class="tab-content">
				<div id="fps" class="tab-pane in active">
					<h4 class="projectdesc2">Faster Payment Service (FPS) Upgrade in Digital IT
					</h4>
					<div class="contentsubtitle">Organization</div>
					<p><a href="https://www.sunlife.com" target="_blank">Sun Life Hong Kong Limited</a>
					</p>
					
					<div class="contentsubtitle">Project Description</div>
					<p>
					<ul>
						<li>Upgrade Faster Payment Services in related to migration of Payment Gateway to Cloud-based servers</li>
						<li>Develop new payment refund capabilities</li>
					 	<li>Enhance DevSecOps by SonarQube integration in deployment</li>
					</ul>
					</p>

					<div class="contentsubtitle">Roles</div>
					<p>Technical Lead, Solution Architect</p>

					<div class="contentsubtitle">Contribution</div>
					<ul>
						<li>Manage project schedule, service providers and integration risks</li>
						<li>Design the business flow and application architecture for payment refund</li>
						<li>Design new exception handling and error code mapping for new Faster Payment Service API</li>
						<li>Act as one of the developers of a Scrum team with roles of technical lead and solution architect</li>
						<li>Review codes committed by developers</li>
						<li>Act as 3rd line production support to find root cause and provide solutions of production incidents</li>
					</ul>					
					<div class="contentsubtitle">Technical Skills</div>					
					<img src="resources/icon/java.png" title="Java" height="80" width="80">
					<img src="resources/icon/spring.png" title="Spring" height="80" width="80">		
					<img src="resources/icon/oracle.png" title="Oracle Databsae" height="80" width="80">
					<img src="resources/icon/websphere.png" title="IBM WebSphere" height="80" width="80">						
					<img src="resources/icon/git.png" title="Git" height="80" width="80">
					<img src="resources/icon/bitbucket.png" title="BitBucket" height="80" width="80">
					<img src="resources/icon/sonarqube.png" title="SonarQube" height="80" width="80">
					<img src="resources/icon/junit.png" title="Junit" height="80" width="80">
					
					<div class="contentsubtitle">Development Team Size</div>
					<p>7 team members (1 Team Lead+1 Scrum Master+1 Product Owner+3 Developers+1 Tester)</p>
					
					<div class="contentsubtitle">My Participated Duration</div>
					<p>9 months</p>					
				</div>				
				<div id="is" class="tab-pane fade">
					<h4 class="projectdesc2">Integration Service (IS) in Digital IT
					</h4>
					<div class="contentsubtitle">Organization</div>
					<p><a href="https://www.sunlife.com" target="_blank">Sun Life Hong Kong Limited</a>
					</p>
					
					<div class="contentsubtitle">Project Description</div>
					<p>Development of new capabilities in integration service system to support different business operations including policy creation, claims and value withdrawal
					</p>

					<div class="contentsubtitle">Roles</div>
					<p>Technical Lead, Developer</p>

					<div class="contentsubtitle">Contribution</div>
					<ul>
						<li>Monitor and control project schedule and risk</li>
						<li>Deployment and Delivery management</li>
						<li>Acted as third line support to find out root causes of several critical production issues</li>
						<li>Provide architectural solution review according to new business initiatives</li>
						<li>Application design and implementation</li>
						<li>Perform code review and source control</li>						
					</ul>					
					<div class="contentsubtitle">Technical Skills</div>					
					<img src="resources/icon/java.png" title="Java" height="80" width="80">
					<img src="resources/icon/mvc.png" title="Spring MVC" height="80" width="80">
					<img src="resources/icon/spring.png" title="Spring" height="80" width="80">
					<img src="resources/icon/hibernate.png" title="Spring Hibernate" height="80" width="80">			
					<img src="resources/icon/mssql.png" title="MS SQL" height="80" width="80">
					<img src="resources/icon/websphere.png" title="IBM WebSphere" height="80" width="80">	
					<img src="resources/icon/tomcat.png" title="Apache Tomcat" height="80" width="80">
					<img src="resources/icon/ecllipse.png" title="Ecllipse" height="80" width="80">					
					<img src="resources/icon/git.png" title="Git" height="80" width="80">
					<img src="resources/icon/bitbucket.png" title="BitBucket" height="80" width="80">
					<img src="resources/icon/junit.png" title="Junit" height="80" width="80">
					
					<div class="contentsubtitle">Development Team Size</div>
					<p>5 team members (1 Technical Lead, 1 System Analyst, 1 Business Analyst, 1 Programmer, 1 Tester)</p>
					
					<div class="contentsubtitle">My Participated Duration</div>
					<p>14 months</p>					
				</div>				
				<div id="clots" class="tab-pane fade">
					<h4 class="projectdesc2">Class Licence for Offer of Telecommunications Services (CLOTS)
					</h4>
					<div class="contentsubtitle">Organization</div>
					<p><a href="https://www.gov.hk/en" target="_blank">Hong Kong Government</a>, <a href="https://www.ofca.gov.hk" target="_blank">Office of the Communications Authority (OFCA)</a>
					</p>
					
					<div class="contentsubtitle">Project Description</div>
					<p>Redevelopment of existing Foxpro application that supports the workflow of public mobile radio station licensing
					</p>

					<div class="contentsubtitle">Roles</div>
					<p>Project Manager, Team Lead, Developer</p>

					<div class="contentsubtitle">Contribution</div>
					<ul>
						<li>Monitor and control project schedule and risk</li>
						<li>Assign project tasks to team members</li>
						<li>Gather and document user requirement</li>
						<li>Application design, implementation and testing</li>
						<li>Perform code review and performance Tuning</li>						
					</ul>					
					<div class="contentsubtitle">Technical Skills</div>					
					<img src="resources/icon/java.png" title="Java" height="80" width="80">
					<img src="resources/icon/mvc.png" title="Spring MVC" height="80" width="80">
					<img src="resources/icon/jsp.png" title="Java Server Pages" height="80" width="80">
					<img src="resources/icon/spring.png" title="Spring" height="80" width="80">
					<img src="resources/icon/hibernate.png" title="Spring Hibernate" height="80" width="80">				
					<img src="resources/icon/mysql.png" title="My SQL" height="80" width="80">
					<img src="resources/icon/jasperreport.png" title="Jasper Report" height="80" width="80">		
					<img src="resources/icon/xml.png" title="XML" height="80" width="80">				
					<img src="resources/icon/tomcat.png" title="Apache Tomcat" height="80" width="80">
					<img src="resources/icon/ecllipse.png" title="Ecllipse" height="80" width="80">					
					<img src="resources/icon/subversion.png" title="Subversion" height="80" width="80">
					<img src="resources/icon/junit.png" title="Junit" height="80" width="80">
					
					<div class="contentsubtitle">Development Team Size</div>
					<p>6 team members (1 Team Lead+3 Information Technology Officers+2Programmerp)</p>
					
					<div class="contentsubtitle">My Participated Duration</div>
					<p>11 months</p>					
				</div>						
				<div id="pmrs" class="tab-pane fade">
					<h4 class="projectdesc2">Public Mobile Radio Station System (PMRS)
					</h4>
					<div class="contentsubtitle">Organization</div>
					<p><a href="https://www.gov.hk/en" target="_blank">Hong Kong Government</a>, <a href="https://www.ofca.gov.hk" target="_blank">Office of the Communications Authority (OFCA)</a>
					</p>
					
					<div class="contentsubtitle">Project Description</div>
					<p>Redevelopment of existing Foxpro application that supports the workflow of public mobile radio station licensing
					</p>

					<div class="contentsubtitle">Roles</div>
					<p>Project Manager, Team Lead, Developer</p>

					<div class="contentsubtitle">Contribution</div>
					<ul>
						<li>Monitor and control project schedule and risk</li>
						<li>Assign project tasks to team members</li>
						<li>Gather and document user requirement</li>
						<li>Application design, implementation and testing</li>
						<li>Perform code review and performance Tuning</li>						
					</ul>					
					<div class="contentsubtitle">Technical Skills</div>					
					<img src="resources/icon/java.png" title="Java" height="80" width="80">
					<img src="resources/icon/mvc.png" title="Spring MVC" height="80" width="80">
					<img src="resources/icon/jsp.png" title="Java Server Pages" height="80" width="80">
					<img src="resources/icon/spring.png" title="Spring" height="80" width="80">
					<img src="resources/icon/hibernate.png" title="Spring Hibernate" height="80" width="80">				
					<img src="resources/icon/mysql.png" title="My SQL" height="80" width="80">
					<img src="resources/icon/jasperreport.png" title="Jasper Report" height="80" width="80">		
					<img src="resources/icon/xml.png" title="XML" height="80" width="80">				
					<img src="resources/icon/tomcat.png" title="Apache Tomcat" height="80" width="80">
					<img src="resources/icon/ecllipse.png" title="Ecllipse" height="80" width="80">					
					<img src="resources/icon/subversion.png" title="Subversion" height="80" width="80">
					<img src="resources/icon/junit.png" title="Junit" height="80" width="80">
					
					<div class="contentsubtitle">Development Team Size</div>
					<p>3 team members (1 Team Lead+2 Information Technology Officers)</p>
					
					<div class="contentsubtitle">My Participated Duration</div>
					<p>11 months</p>					
				</div>				
				<div id="ecom" class="tab-pane fade">
					<h4 class="projectdesc2">Watsons Online eCommerce System</h4>
					<div class="contentsubtitle">Organization</div>
					<p><a href="http://www.aswatson.com/elab/" target="_blank">A.S. Watson Group, eLab</a>
					</p>
					<div class="contentsubtitle">Project Description</div>
					<p>A.S. Watsons Asia Group has decided to standarize online shop frameworks for all business units in Asia. 
					Hybris, a well-known and leading enterprise eCommerce framework, is used to implement the eCommerce System.
					In this project, the main objective is to customize Hybris software and implement extensions that fulfill the requirements for Watsons Philipphines.
					</p>
					<div class="contentsubtitle">Roles</div>
					<p>Team Lead, System Analyst</p>

					<div class="contentsubtitle">Contribution</div>
					<ul>
						<li>Monitor and control project schedule and risk</li>
						<li>Assign project tasks to team members</li>
						<li>Perform code reivew and version control</li>
						<li>Gather and document user requirement</li>
						<li>Application design, implementation and testing</li>						
					</ul>					
					<div class="contentsubtitle">Technical Skills</div>
					<img src="resources/icon/hybris.png" title="Hybris" height="80" width="80">
					<img src="resources/icon/java.png" title="Java" height="80" width="80">
					<img src="resources/icon/mvc.png" title="Spring MVC" height="80" width="80">
					<img src="resources/icon/jsp.png" title="Java Server Pages" height="80" width="80">
					<img src="resources/icon/spring.png" title="Spring" height="80" width="80">					
					<img src="resources/icon/oracle.png" title="Oracle Databsae" height="80" width="80">
					<img src="resources/icon/ws.png" title="Web Service" height="80" width="80">
					<img src="resources/icon/xml.png" title="XML" height="80" width="80">				
					<img src="resources/icon/tomcat.png" title="Apache Tomcat" height="80" width="80">
					<img src="resources/icon/ecllipse.png" title="Ecllipse" height="80" width="80">					
					<img src="resources/icon/subversion.png" title="Subversion" height="80" width="80">
					<img src="resources/icon/junit.png" title="Junit" height="80" width="80">
					
					<div class="contentsubtitle">Development Team Size</div>
					<p>8 team members (1 Project Manager, 1 System Analyst, 1 Business Analyst, 3 Programmers, 2 Testers)</p>
					
					<div class="contentsubtitle">My Participated Duration</div>
					<p>11 months</p>	
				</div>			
				<div id="acas" class="tab-pane fade">
					<h4 class="projectdesc2">HKO Computer System for Assessment of Accident Consequence
						(ACAS)</h4>
					<div class="contentsubtitle">Organization</div>
					<p><a href="https://www.gov.hk/en" target="_blank">Hong Kong Government</a>, <a href="https://www.hko.gov.hk/en/abouthko/aboutus.htm"	target="_blank">Hong Kong Observatory</a> (HKO)
					</p>
					<div class="contentsubtitle">Project Description</div>
					<p>Hong Kong Observatory (HKO) operates an accident consequence
						assessment system(ACAS) to assess the possible consequences of
						nuclear accidents with release of radioactive material from
						nuclear power stations. The objective of this project is to
						implement a new ACAS so that the simulation process can be
						automated and the results are displayed in a user-friendly manner
						in GIS platform.</p>

					<div class="contentsubtitle">Roles</div>
					<p>System Architect, Infrastructure Architect, Business Analyst</p>

					<div class="contentsubtitle">Contribution</div>
					<ul>
						<li>Manage project budget and provide hardware and software
							procurement list</li>
						<li>System installation and configuration in physical and
							virtual servers</li>
						<li>Gather and document user requirement</li>
						<li>Application design, implementation and testing</li>
						<li>Coding build and deployment</li>
						<li>Application and database performance tuning</li>
					</ul>					
					<div class="contentsubtitle">Technical Skills</div>
					<img src="resources/icon/java.png" title="Java" height="80" width="80">
					<img src="resources/icon/js.png" title="Javascript" height="80" width="80">
					<img src="resources/icon/openlayers.png" title="Openlayers 3" height="80" width="80">
					<img src="resources/icon/postgis.png" title="PostGIS" height="80" width="80">
					<img src="resources/icon/jsp.png" title="Java Server Pages" height="80" width="80">
					<img src="resources/icon/spring.png" title="Spring" height="80" width="80">
					<img src="resources/icon/mvc.png" title="Spring MVC" height="80" width="80">
					<img src="resources/icon/hibernate.png" title="Spring Hibernate" height="80" width="80">
					<img src="resources/icon/spring_security.png" title="Spring Security" height="80" width="80">
					<img src="resources/icon/sts.png" title="Spring Tool Suite" height="80" width="80">
					<img src="resources/icon/sql.png" title="Database SQL" height="80" width="80">
					<img src="resources/icon/postgresql.png" title="PostgreSQL Databsae" height="80" width="80">
					<img src="resources/icon/ws.png" title="Web Service" height="80" width="80">
					<img src="resources/icon/xml.png" title="XML" height="80" width="80">
					<img src="resources/icon/winserver.png" title="Windows Server" height="80" width="80">
					<img src="resources/icon/centos.png" title="Linux Cent OS" height="80" width="80">
					<img src="resources/icon/tomcat.png" title="Apache Tomcat" height="80" width="80">
					<img src="resources/icon/maven.png" title="Apache Maven" height="80" width="80">
					<img src="resources/icon/junit.png" title="Junit" height="80" width="80">

					<div class="contentsubtitle">Project Team Size</div>
					<p>6 team members (1 Project Manager, 1 Scientific Officer, 1 Experimental Officer , 1 System Analyst, 1 Analyst Programmer, 1 Tester)</p>
					
					<div class="contentsubtitle">My Participated Duration</div>
					<p>20 months</p>					
				</div>
				<div id="ochs" class="tab-pane fade">
					<h4 class="projectdesc2">Octopus Smart Card Operation and Clearing House System Support & Maintenance (OCHS)</h4>
					<div class="contentsubtitle">Organization</div>
					<p><a href="https://www.octopus.com.hk/en" target="_blank">Octopus	Holdings Limited</a>
					</p>
					<div class="contentsubtitle">Project Description</div>
					<p>The support and maintenance smart card operation & clearing house system OCHS system provided by Octopus Holdings Limited. The system is delivered to international clients including Unified Automation Fare Collection (UAFC) department of Roads and Transportation Authority (RTA) in Dubai.</p>

					<div class="contentsubtitle">Roles</div>
					<p>System Analyst, Business Analyst</p>

					<div class="contentsubtitle">Contribution</div>
					<ul>
						<li>Manage and implement change requests raised by client (major CRs includes Combi Card, eWallet and mobile top up)</li>
						<li>Follow-up daily incidents and monitor end-of-day tasks</li>
						<li>Provide consultation advice to client</li>
						<li>Design and implement short-term work-around and long-term system patches</li>
						<li>Perform system integration test, regression test and performance test</li>						
					</ul>					
					<div class="contentsubtitle">Technical Skills</div>
					<img src="resources/icon/java.png" title="Java" height="80" width="80">
					<img src="resources/icon/struts.png" title="Struts 2" height="80" width="80">	
					<img src="resources/icon/jsp.png" title="Java Server Pages" height="80" width="80">
					<img src="resources/icon/spring.png" title="Spring" height="80" width="80">					
					<img src="resources/icon/hibernate.png" title="Spring Hibernate" height="80" width="80">
					<img src="resources/icon/ejb.png" title="Enterprise Java Bean" height="80" width="80">					
					<img src="resources/icon/sql.png" title="Database SQL" height="80" width="80">
					<img src="resources/icon/oracle.png" title="Oracle Databsae" height="80" width="80">
					<img src="resources/icon/ws.png" title="Web Service" height="80" width="80">
					<img src="resources/icon/xml.png" title="XML" height="80" width="80">
					<img src="resources/icon/hpunix.png" title="HP Unix" height="80" width="80">
					<img src="resources/icon/winserver.png" title="Windows Server" height="80" width="80">
					<img src="resources/icon/weblogic.png" title="Oracle Weblogic Server" height="80" width="80">					
					<img src="resources/icon/tomcat.png" title="Apache Tomcat" height="80" width="80">
					<img src="resources/icon/cognos.png" title="IBM Cognose" height="80" width="80">
					<img src="resources/icon/synapse.png" title="Apache Synapse" height="80" width="80">
					<img src="resources/icon/tibco.png" title="Tibco" height="80" width="80">
					<img src="resources/icon/ecllipse.png" title="Ecllipse" height="80" width="80">					
					<img src="resources/icon/maven.png" title="Apache Maven" height="80" width="80">
					<img src="resources/icon/subversion.png" title="Subversion" height="80" width="80">
					<img src="resources/icon/junit.png" title="Junit" height="80" width="80">
					<img src="resources/icon/soapui.png" title="SoapUI" height="80" width="80">
					<img src="resources/icon/selenium.png" title="Selenium" height="80" width="80">
					<img src="resources/icon/liferay.png" title="Liferay Portal Server" height="80" width="80">
					
					<div class="contentsubtitle">Project Team Size</div>
					<p>5-7 team members (1 Project Manager, 2 System System Engineers, 1-2 System Engineer, 1-2 Tester)</p>
					
					<div class="contentsubtitle">My Participated Duration</div>
					<p>41 months</p>					
				</div>
				<div id="rcs" class="tab-pane fade">
					<h4 class="projectdesc2">AXA Regional Communication Services (RCS)</h4>
					<div class="contentsubtitle">Organization</div>
					<p><a href="https://www.axa.com.hk/en" target="_blank">AXA Group</a>
					</p>					
					<div class="contentsubtitle">Project Description</div>
					<p>AXA Group aims to standardize and enhance the outgoing correspondences to improve the customer communication, allow the capability to provide a centralised online storage repository of internal reports and also provide flexibility to the Marketing Team to communicate with customers.</p>

					<div class="contentsubtitle">Roles</div>
					<p>System Analyst</p>

					<div class="contentsubtitle">Contribution</div>
					<ul>
						<li>Proof of concepts on the use of Thunderhead software</li>
						<li>Configure Thunderhead software to meet requirements for different countries</li>
						<li>Build the initial templates for letter and email delivery</li>
						<li>Conduct sharing workshops to AXA staff on Thunderhead software</li>
						<li>Perform change requests and defect fixing</li>
						<li>Perform SIT & support UAT</li>			
					</ul>					
					<div class="contentsubtitle">Technical Skills</div>
					<img src="resources/icon/java.png" title="Java" height="80" width="80">					
					<img src="resources/icon/oracle.png" title="Oracle Databsae" height="80" width="80">					
					<img src="resources/icon/xml.png" title="XML" height="80" width="80">					
					<img src="resources/icon/winserver.png" title="Windows Server" height="80" width="80">
					<img src="resources/icon/jboss.png" title="Red Hat JBoss Server" height="80" width="80">
					<img src="resources/icon/thunderhead.png" title="Thunderhead" height="80" width="80">
					<img src="resources/icon/xenos.png" title="Xenos" height="80" width="80">
					
					<div class="contentsubtitle">Project Team Size</div>
					<p>8-9 team members (1 Project Manager, 1 Architect, 3 IT Specialist, 2 Business Analysis, 1-2 Tester)</p>
					
					<div class="contentsubtitle">My Participated Duration</div>
					<p>11 months</p>						
				</div>
				<div id="dbs" class="tab-pane fade">
					<h4 class="projectdesc2">DBS Two Phase Authentication (2FA)</h4>
					<div class="contentsubtitle">Organization</div>
					<p><a href="https://www.dbs.com.hk/en" target="_blank">DBS Hong Kong</a>
					</p>					
					<div class="contentsubtitle">Project Description</div>
					<p>DBS decided to increase the security level on the existing online banking system. Besides the first verification with web users by username and password, one-time password(OTP) is used as the second authentication. OTP is sent to web visitors’ registered mobile phone via SMS and they are required to input during logon to e-Banking.</p>
					<div class="contentsubtitle">Roles</div>
					<p>System Analyst, Test Analyst</p>
					<div class="contentsubtitle">Contribution</div>
					<ul>
						<li>Enhance 7X24 availability of online banking system</li>
						<li>Enhance online banking system to provide new bank products</li>
						<li>Preparing bank account profiles as testing data and perform testing</li>
						<li>Manage and resolve SIT and UAT defects</li>
						<li>Travel to Singapore to perform load testing for 1 month</li>
						<li>Perform unit testing and regression testing</li>
						<li>Coaching testers during test execution</li>				
					</ul>					
					<div class="contentsubtitle">Technical Skills</div>
					<img src="resources/icon/java.png" title="Java" height="80" width="80">					
					<img src="resources/icon/jsp.png" title="Java Server Pages" height="80" width="80">					
					<img src="resources/icon/j2ee.png" title="Java Enterprise Edition" height="80" width="80">
					<img src="resources/icon/ejb.png" title="Enterprise Java Bean" height="80" width="80">					
					<img src="resources/icon/sql.png" title="Database SQL" height="80" width="80">
					<img src="resources/icon/oracle.png" title="Oracle Databsae" height="80" width="80">
					<img src="resources/icon/unix.png" title="Unix OS" height="80" width="80">					
					<img src="resources/icon/weblogic.png" title="Oracle Weblogic Server" height="80" width="80">					
					<img src="resources/icon/test.png" title="IBM Rational Test Manager" height="80" width="80">
					<img src="resources/icon/rad.png" title="IBM Rational Application Developer" height="80" width="80">
					<img src="resources/icon/ecllipse.png" title="Ecllipse" height="80" width="80">
					
					<div class="contentsubtitle">Project Team Size</div>
					<p>6 team members (1 Project Manager, 1 Architect, 2 IT Specialist, 1 Business Analysis, 1 Tester)</p>
					
					<div class="contentsubtitle">My Participated Duration</div>
					<p>12 months</p>	
				</div>					
				<div id="cxmain" class="tab-pane fade">
					<h4 class="projectdesc2">Cathay Pacific Airline (CX) Business System Support</h4>
					<div class="contentsubtitle">Organization</div>
					<p><a href="https://www.cathaypacific.com/" target="_blank">Cathay Pacific Airline</a>
					</p>	
					<div class="contentsubtitle">Project Description</div>
					<p>A 5.5 years outsourcing projects for maintenance and support of over 180 business applications of Cathay Pacific to IBM China/Hong Kong Limited. The applications include the <a href="http://www.cathaypacific.com">
					cx.com</a>, ka.com, <a href="https://www.asiamiles.com">asia miles</a> , CX holidays, logistic related applications and internal applications for operations and crews.</p>

					<div class="contentsubtitle">Roles</div>
					<p>System Analyst, Business Analyst</p>

					<div class="contentsubtitle">Contribution</div>
					<ul>
						<li>Manage incidents and service requests</li>
						<li>Perform change request and system enhancement</li>
						<li>Gather business requirements and perform impact analysis</li>
						<li>Deliver detailed business requirement specification</li>
						<li>Deliver system design and detailed technical specification</li>
						<li>Quality control on offshore delivery team in Shenzhen</li>								
					</ul>	
					<div class="contentsubtitle">Technical Skills</div>
					<img src="resources/icon/java.png" title="Java" height="80" width="80">					
					<img src="resources/icon/js.png" title="Javascript" height="80" width="80">					
					<img src="resources/icon/j2ee.png" title="Java Enterprise Edition" height="80" width="80">
					<img src="resources/icon/ejb.png" title="Enterprise Java Bean" height="80" width="80">					
					<img src="resources/icon/sql.png" title="Database SQL" height="80" width="80">
					<img src="resources/icon/oracle.png" title="Oracle Databsae" height="80" width="80">
					<img src="resources/icon/winserver.png" title="Windows Server" height="80" width="80">
					<img src="resources/icon/aix.png" title="IBM AIX" height="80" width="80">
					<img src="resources/icon/websphere.png" title="IBM Websphere Application Server" height="80" width="80">
					<img src="resources/icon/rad.png" title="IBM Rational Application Developer" height="80" width="80">
					
					<div class="contentsubtitle">Project Team Size</div>
					<p>18-25 team members (1 Project Manager, 1 Architect, 10-15 IT Specialist, 3-4 Business Analysis, 3-4 Tester)</p>
					
					<div class="contentsubtitle">My Participated Duration</div>
					<p>9 months</p>											
				</div>
				<div id="emp" class="tab-pane fade">
					<h4 class="projectdesc2">Hong Kong Trade Development Council (HKTDC) eMarket Place (eMP)</h4>
					<div class="contentsubtitle">Organization</div>
					<p><a href="https://www.hktdc.com/" target="_blank">Hong Kong Trade Development Council (HKTDC)</a>
					</p>						
					<div class="contentsubtitle">Project Description</div>
					<p>HKTDC decided to create a new online marketplace (eMP) that was migrated from an existing marketplace system. eMP provides an online platform for the communication between buyers and suppliers. eMP facilitates trade in Hong Kong by providing business matching on the Internet.</p>

					<div class="contentsubtitle">Roles</div>
					<p>Analyst Programmer, Business Analyst</p>

					<div class="contentsubtitle">Contribution</div>
					<ul>
						<li>Web application framework design and implementation for mobile device</li>
						<li>Develop web application of Buyer Enquiry System</li>
						<li>Integrated with Interwoven TeamSite and Media Bin software to deliver a content management system</li>
						<li>Develop reporting facility by using iReport and Jasper Report software</li>
						<li>Data modeling and database configuration</li>
						<li>Perform unit testing and system integration test</li>		
						<li>Perform change requests and defect fixing</li>
						<li>Conduct workshops to collect user requirement</li>
						<li>Document user requirement specification</li>
									
					</ul>	
					<div class="contentsubtitle">Technical Skills</div>
					<img src="resources/icon/java.png" title="Java" height="80" width="80">					
					<img src="resources/icon/jsp.png" title="Java Server Pages" height="80" width="80">						
					<img src="resources/icon/j2ee.png" title="Java Enterprise Edition" height="80" width="80">
					<img src="resources/icon/ws.png" title="Web Service" height="80" width="80">									
					<img src="resources/icon/mssql.png" title="Microsoft SQL Database" height="80" width="80">
					<img src="resources/icon/sql.png" title="Database SQL" height="80" width="80">
					<img src="resources/icon/websphere.png" title="IBM Websphere Application Server" height="80" width="80">
					<img src="resources/icon/winserver.png" title="Windows Server" height="80" width="80">					
					<img src="resources/icon/teamsite.png" title="Interwowen TeamSite" height="80" width="80">
					<img src="resources/icon/jasperreport.png" title="Jasper Report" height="80" width="80">
					<img src="resources/icon/ireport.png" title="Jasper iReport" height="80" width="80">
					<img src="resources/icon/fast.png" title="FAST Search Engine" height="80" width="80">
					<img src="resources/icon/clearcase.png" title="IBM Rational ClearCase" height="80" width="80">
					<img src="resources/icon/clearquest.png" title="IBM Rational ClearQuest" height="80" width="80">
					<img src="resources/icon/rad.png" title="IBM Rational Application Developer" height="80" width="80">	
					
					<div class="contentsubtitle">Project Team Size</div>
					<p>24-43 team members (1 Project Director, 2 Project Manager, 2 Architect, 15-30 IT Specialist, 2-4 Business Analysis, 2-4 Tester)</p>
					
					<div class="contentsubtitle">My Participated Duration</div>
					<p>16 months</p>							
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<jsp:include page="footer.jsp" />
	</div>
	<script>
		$(".nav-tabs a").click(function() {
			$(this).tab('show');
		});
		
		var hash = $(location).prop('hash');
		if(hash != null && hash != ''){
			//alert(hash);
			$('a[href^="'+hash+'"]').click();
		}		
	</script>
</body>
</html>

