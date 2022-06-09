<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<h1><img class="img-responsive img-fluid" src="resources/image/header3.jpg" title="Tilen Ma's Cloud" style="max-height: 200px;"></h1>
<div id="header">
	<!-- for bootstrap v3 only -->
	<!-- 
	<ul class="nav nav-pills">
		<li id="homeTab" role="presentation" class="active menuText"><a href="<spring:url value="/"/>">Home</a></li>
		<li id="workTab" role="presentation" class="menuText"><a href="<spring:url value="/work"/>">Working Experience</a></li>
		<li id="projectTab" role="presentation" class="menuText"><a href="<spring:url value="/project"/>">Projects</a></li>
		<li id="skillTab" role="presentation" class="menuText"><a href="<spring:url value="/skill"/>">Technical Skills</a></li>
		<li id="demoTab" role="presentation" class="menuText"><a href="<spring:url value="/acas"/>">Demo</a></li>	
	</ul>
	-->
	<!-- for bootstrap v4 -->
    <nav class="navbar navbar-expand-md navbar-dark bg-dark">
      <a class="navbar-brand disabled" href="<spring:url value="/"/>">Tilen's Resume</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsHeader" aria-controls="navbarsHeader" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarsHeader">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" href="<spring:url value="/"/>">Home <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<spring:url value="/work"/>">Work Experience</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="/project" id="acasdropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Projects</a>
            <div class="dropdown-menu" aria-labelledby="acasdropdown">
              <a class="dropdown-item" href="<spring:url value="/project#fps"/>">Sunlife - Faster Payment Service</a>
              <a class="dropdown-item" href="<spring:url value="/project#is"/>">Sunlife - Integration Services</a>
              <a class="dropdown-item" href="<spring:url value="/project#clots"/>">OFCA - Class Licence System</a>
              <a class="dropdown-item" href="<spring:url value="/project#pmrs"/>">OFCA - Public Mobile Radio Station System</a>
              <a class="dropdown-item" href="<spring:url value="/project#ecom"/>">A.S. Watsons - Online eCommerce</a>
              <a class="dropdown-item" href="<spring:url value="/project#acas"/>">HK Observatory - Accident Consequence Assessment System</a>
              <a class="dropdown-item" href="<spring:url value="/project#ochs"/>">Octopus Card- Octopus Clearing House System</a>
              <a class="dropdown-item" href="<spring:url value="/project#rcs"/>">AXA Insurance- Regional Communication System</a>
              <a class="dropdown-item" href="<spring:url value="/project#dbs"/>">DBS Bank - Two Factor Authentication</a>
              <a class="dropdown-item" href="<spring:url value="/project#cxmain"/>">Cathay Pacific Airline - Application Maintenance</a>
              <a class="dropdown-item" href="<spring:url value="/project#emp"/>">HK Trade Development Council - eMarketplace</a>
            </div>
          </li> 
          <li class="nav-item">
            <a class="nav-link" href="<spring:url value="/skill"/>">Technical Skills</a>
          </li>                      
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="acasdropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">ACAS Demo</a>
            <div class="dropdown-menu" aria-labelledby="acasdropdown">
              <a class="dropdown-item" href="<spring:url value="/acas"/>">About ACAS Project</a>
              <a class="dropdown-item" href="<spring:url value="/gis"/>">Sample Map of a Nuclear Accident Consequence</a>
              <a class="dropdown-item" href="<spring:url value="/chart"/>">Sample Chart for Gamma Dose Rate by locations</a>
              <a class="dropdown-item" href="<spring:url value="/chart/detail"/>">Detailed Chart for Gamma Dose Rate at a Station</a>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<spring:url value="/admin"/>">Login</a>
          </li>           
        </ul>
      </div>
    </nav>	
</div>