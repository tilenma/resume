<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page session="false"%>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<!-- 
<link rel="stylesheet" href="<spring:url value="/resources/css/bootstrap.min.css"/>" type="text/css">
 -->
<link rel="stylesheet" href="<spring:url value="/resources/css/ol.css"/>" type="text/css">
<link rel="stylesheet" href="<spring:url value="/resources/css/prism.css"/>" type="text/css">
<link rel="stylesheet" href="<spring:url value="/resources/css/custom.css"/>" type="text/css">

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
	
<!-- 
<script src="<spring:url value="/resources/js/jquery.min.js"/>" type="text/javascript"></script>
<script src="<spring:url value="/resources/js/bootstrap.min.js"/>" type="text/javascript"></script>	
 -->
<script src="<spring:url value="/resources/js/ol.js"/>" type="text/javascript"></script>

<script type="text/javascript">
	/* Map server WFS link */
	var wfsUrl = 'http://${pageContext.request.serverName}:8090/geoserver/cite/wfs?service=WFS&request=GetFeature&version=2.0.0&typename=Ccite%3Aproduct_view&srsname=EPSG:3857&outputFormat=text/javascript';
	var wfsLocationUrl = 'http://${pageContext.request.serverName}:8090/geoserver/cite/wfs?service=WFS&request=GetFeature&version=2.0.0&typename=Ccite%3Alocation_rmn_view&srsname=EPSG:3857&outputFormat=text/javascript';
	var wfsStaticUrl = 'http://${pageContext.request.serverName}/geoserver/cite/wfs?service=WFS&request=GetFeature&version=2.0.0&typename=cite:';

	/* Define colors */
	var colors = ['rgba(112, 48, 160, 0.5)','rgba(239, 95, 242, 0.5)','rgba(146, 115, 80, 0.5)','rgba(255, 0, 0, 0.5)','rgba(255, 255, 0, 0.5)','rgba(50, 255, 35, 0.5)','rgba(0, 255, 255, 0.5)','rgba(0, 204, 255, 0.5)','rgba(0, 102, 255, 0.5)','rgba(51, 51, 255, 0.5)'];

	
	/* Define legends */
	var legends = [' and value >= 10000',' and value >= 1000 and value < 10000',' and value >= 500 and value < 1000',' and value >= 100 and value < 500',' and value >= 50 and value < 100',' and value >= 1 and value < 50',' and value >= 0.1 and value < 1',' and value >= 0.01 and value < 0.1',' and value >= 0.001 and value < 0.01',' and value >= 0.0001 and value < 0.001'];

	
	/* Define play interval */
	var interval = 1000; //2s 
	var emptycount = 9; //Empty layer treated as empty out of 10
	var bufferSize = 5; //5 subsequence layers are bufferred for animation
	
	var isGNPS = true;	
</script>
