<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page session="false"%>
<link rel="icon" href="resources/image/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="resources/image/favicon.ico" type="image/x-icon"> 
<html>
<head>
<title>Gamma Dose Rate at Ping Chau</title>
<style>
</style>
<meta charset="utf-8">
<jsp:include page="acas_common.jsp" />
<script src="<spring:url value="/resources/js/highcharts/highcharts.js"/>" type="text/javascript"></script>

<link rel="stylesheet"
	href="<spring:url value="/resources/css/draw.css"/>" type="text/css">
</head>
<body>
	<div class="container-fluid">
		<ul class="nav nav-pills">
			<li id="homeTab" role="presentation" class="active menuText"><a href="<spring:url value="/"/>">Home</a></li>
			<li id="workTab" role="presentation" class="menuText"><a href="<spring:url value="/acas"/>">About ACAS</a></li>
			<li id="projectTab" role="presentation" class="menuText"><a href="<spring:url value="/gis"/>">Nuclear Accident Consequence Map</a></li>
			<li id="skillTab" role="presentation" class="menuText"><a href="<spring:url value="/chart"/>">Gamma Dose Rate by Locations</a></li>
			<li id="demoTab" role="presentation" class="menuText disabled"><a href="<spring:url value="/chart/detail"/>">Gamma Dose Rate at a Station</a></li>	
		</ul>	
		<div>
			<h4 class="maptitle">Total Potential Thyroid Dose at RMN stations, open area, for adults (mSv) at Tap Mun (TM)</h4>
		</div>
		<div id="container" style="height:80%"></div>	
		<div class="menutitlecontainer">
			<div><h3 class="projectdesc">About the Charts</h3></div>
			<div class="row">
			    <div class="col-md-2 techdesc">Highcharts 4.2.5</div>
			    <div class="col-md-2 techdesc">Bootstrap 3.3.4</div>
			    <div class="col-md-3 techdesc">Spring MVC 4.1.7.RELEASE</div>
			</div>
		</div>		
	</div>
	
	<script type="text/javascript">  	 
	$(function () {
   	 	var minRange = 0.0000001;
   	 	
   	 	var xformatter = function() {
    	    return this.value.substring(5,17); 
    	};
    	
    	var yformatter = function() {
    	    return (this.value).toExponential(1); // 2 digits of precision
    	};    	
    	// mSv with 100mSv line
   	 	var yAxis = {
	        	minRange : minRange,
	        	min: 0,
	            title: {
	            	align: 'high',
	            	offset: 15,
	            	rotation: 0,
	                y: -15,
	                text: 'mSv'
	            },
	            labels:{
	            	formatter: yformatter
	            },
	            plotLines: [{	              
	                color: 'red', // Color value
	                //dashStyle: 'Dash', // Style of the plot line. Default to solid
	                value: 100, // Value of where the line will appear
	                width: 2, // Width of the line    
	                label: { 
	                    text: '100 mSv', // Content of the label. 
	                    align: 'left' // Positioning of the label.	                     
	                  }
	              },
	              {	              
		            color: 'red', // Color value
		            dashStyle: 'Dash', // Style of the plot line. Default to solid
		            value: 80, // Value of where the line will appear
		            width: 2, // Width of the line    
		            label: { 
		               text: '80 mSv', // Content of the label. 
		               align: 'left' // Positioning of the label.	                     
		            }
		         },
	              {	              
		            color: 'red', // Color value
		            dashStyle: 'Dash', // Style of the plot line. Default to solid
		            value: 60, // Value of where the line will appear
		            width: 2, // Width of the line    
		            label: { 
		               text: '60 mSv', // Content of the label. 
		               align: 'left' // Positioning of the label.	                     
		            }
		         },
	              {	              
			            color: 'red', // Color value
			            dashStyle: 'Dash', // Style of the plot line. Default to solid
			            value: 40, // Value of where the line will appear
			            width: 2, // Width of the line    
			            label: { 
			               text: '40 mSv', // Content of the label. 
			               align: 'left' // Positioning of the label.	                     
			            }
			     }	 
		         ,
	              {	              
		            color: 'red', // Color value
		            dashStyle: 'Dash', // Style of the plot line. Default to solid
		            value: 20, // Value of where the line will appear
		            width: 2, // Width of the line    
		            label: { 
		               text: '20 mSv', // Content of the label. 
		               align: 'left' // Positioning of the label.	                     
		            }
		         }		         
              ]	  
	        };
    	
    	// mSv with 50mSv line
   	 	var yAxis2 = {
	        	minRange : minRange,
	        	min: 0,
	            title: {
	            	align: 'high',
	            	offset: 15,
	            	rotation: 0,
	                y: -15,
	                text: 'mSv'
	            },
	            labels:{
	            	formatter: yformatter
	            },
	            plotLines: [{	              
	                color: 'red', // Color value
	                //dashStyle: 'Dash', // Style of the plot line. Default to solid
	                value: 50, // Value of where the line will appear
	                width: 2, // Width of the line    
	                label: { 
	                    text: '50 mSv', // Content of the label. 
	                    align: 'left' // Positioning of the label.	                     
	                  }
	              },
	              {	              
			            color: 'red', // Color value
			            dashStyle: 'Dash', // Style of the plot line. Default to solid
			            value: 40, // Value of where the line will appear
			            width: 2, // Width of the line    
			            label: { 
			               text: '40 mSv', // Content of the label. 
			               align: 'left' // Positioning of the label.	                     
			            }
			      },
	              {	              
			            color: 'red', // Color value
			            dashStyle: 'Dash', // Style of the plot line. Default to solid
			            value: 30, // Value of where the line will appear
			            width: 2, // Width of the line    
			            label: { 
			               text: '30 mSv', // Content of the label. 
			               align: 'left' // Positioning of the label.	                     
			            }
			      },
	              {	              
			            color: 'red', // Color value
			            dashStyle: 'Dash', // Style of the plot line. Default to solid
			            value: 20, // Value of where the line will appear
			            width: 2, // Width of the line    
			            label: { 
			               text: '20 mSv', // Content of the label. 
			               align: 'left' // Positioning of the label.	                     
			            }
			      },
	              {	              
			            color: 'red', // Color value
			            dashStyle: 'Dash', // Style of the plot line. Default to solid
			            value: 10, // Value of where the line will appear
			            width: 2, // Width of the line    
			            label: { 
			               text: '10 mSv', // Content of the label. 
			               align: 'left' // Positioning of the label.	                     
			            }
			      }
              ]	  
	        };    	
   	 	
   	 	var plotOptions = {            	
	            line: {
	            	softThreshold: false,
	                dataLabels: {
	                    enabled: false
	                },
	                enableMouseTracking: true
	            }
	    };   	 	
	    $('#container').highcharts({
	        chart: {
	            type: 'line',
	            borderWidth: 1,
	            zoomType: 'x'
	        },
	        credits: {
	            enabled: false
	        },
	        title: {
	            text: "Tap Mun (TM)"
	        },
	        xAxis: {
	        	title: {
	                text: null
	            },
	            labels: {
	            	formatter: xformatter
		        },	            
	            categories: ['2016-02-03 06:48','2016-02-03 07:48','2016-02-03 08:48','2016-02-03 09:48','2016-02-03 10:48','2016-02-03 11:48','2016-02-03 12:48','2016-02-03 13:48','2016-02-03 14:48','2016-02-03 15:48','2016-02-03 16:48','2016-02-03 17:48','2016-02-03 18:48','2016-02-03 19:48','2016-02-03 20:48','2016-02-03 21:48','2016-02-03 22:48','2016-02-03 23:48','2016-02-04 00:48','2016-02-04 01:48','2016-02-04 02:48','2016-02-04 03:48','2016-02-04 04:48','2016-02-04 05:48','2016-02-04 06:48','2016-02-04 07:48','2016-02-04 08:48','2016-02-04 09:48','2016-02-04 10:48','2016-02-04 11:48','2016-02-04 12:48','2016-02-04 13:48','2016-02-04 14:48','2016-02-04 15:48','2016-02-04 16:48','2016-02-04 17:48','2016-02-04 18:48','2016-02-04 19:48','2016-02-04 20:48','2016-02-04 21:48','2016-02-04 22:48','2016-02-04 23:48','2016-02-05 00:48','2016-02-05 01:48','2016-02-05 02:48','2016-02-05 03:48','2016-02-05 04:48','2016-02-05 05:48','2016-02-05 06:48','2016-02-05 07:48','2016-02-05 08:48','2016-02-05 09:48','2016-02-05 10:48','2016-02-05 11:48','2016-02-05 12:48','2016-02-05 13:48','2016-02-05 14:48','2016-02-05 15:48','2016-02-05 16:48','2016-02-05 17:48','2016-02-05 18:48','2016-02-05 19:48','2016-02-05 20:48','2016-02-05 21:48','2016-02-05 22:48','2016-02-05 23:48','2016-02-06 00:48','2016-02-06 01:48','2016-02-06 02:48','2016-02-06 03:48','2016-02-06 04:48','2016-02-06 05:48','2016-02-06 06:48','2016-02-06 07:48','2016-02-06 08:48','2016-02-06 09:48','2016-02-06 10:48','2016-02-06 11:48','2016-02-06 12:48','2016-02-06 13:48','2016-02-06 14:48','2016-02-06 15:48','2016-02-06 16:48','2016-02-06 17:48','2016-02-06 18:48','2016-02-06 19:48','2016-02-06 20:48','2016-02-06 21:48','2016-02-06 22:48','2016-02-06 23:48','2016-02-07 00:48','2016-02-07 01:48','2016-02-07 02:48','2016-02-07 03:48','2016-02-07 04:48','2016-02-07 05:48','2016-02-07 06:48','2016-02-07 07:48','2016-02-07 08:48','2016-02-07 09:48','2016-02-07 10:48','2016-02-07 11:48','2016-02-07 12:48','2016-02-07 13:48','2016-02-07 14:48','2016-02-07 15:48','2016-02-07 16:48','2016-02-07 17:48','2016-02-07 18:48','2016-02-07 19:48','2016-02-07 20:48','2016-02-07 21:48','2016-02-07 22:48','2016-02-07 23:48','2016-02-08 00:48','2016-02-08 01:48','2016-02-08 02:48','2016-02-08 03:48','2016-02-08 04:48','2016-02-08 05:48','2016-02-08 06:48','2016-02-08 07:48','2016-02-08 08:48','2016-02-08 09:48','2016-02-08 10:48','2016-02-08 11:48','2016-02-08 12:48','2016-02-08 13:48','2016-02-08 14:48','2016-02-08 15:48','2016-02-08 16:48','2016-02-08 17:48','2016-02-08 18:48','2016-02-08 19:48','2016-02-08 20:48','2016-02-08 21:48','2016-02-08 22:48','2016-02-08 23:48','2016-02-09 00:48','2016-02-09 01:48','2016-02-09 02:48','2016-02-09 03:48','2016-02-09 04:48','2016-02-09 05:48','2016-02-09 06:48','2016-02-09 07:48','2016-02-09 08:48','2016-02-09 09:48','2016-02-09 10:48','2016-02-09 11:48','2016-02-09 12:48','2016-02-09 13:48','2016-02-09 14:48','2016-02-09 15:48','2016-02-09 16:48','2016-02-09 17:48','2016-02-09 18:48','2016-02-09 19:48','2016-02-09 20:48','2016-02-09 21:48','2016-02-09 22:48','2016-02-09 23:48','2016-02-10 00:48','2016-02-10 01:48','2016-02-10 02:48','2016-02-10 03:48','2016-02-10 04:48','2016-02-10 05:48']
	        },	        
	        yAxis: yAxis2,
	       plotOptions: plotOptions,
	        series: [{
	        	showInLegend: false,
	            name: 'PC',
	            data: [1.081497,2.1629939,3.2444911,4.3259878,5.4074845,6.4889812,7.570478,8.6519756,9.7334738,10.814972,11.89647,12.977968,14.059466,15.140965,16.222462,17.303959,18.385456,19.466953,20.54845,21.629948,22.711445,23.792942,24.874439,25.955936,27.037434,28.118931,29.200428,30.281925,31.363422,32.444916,33.526409,34.607903,35.689396,36.770889,37.852383,38.933876,40.015369,41.096863,42.178356,43.25985,44.341343,45.422836,46.50433,47.585823,48.667316,49.74881,50.830303,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797,51.911797]
			 }]
	    });	    
	}); <!-- end function -->
	
	</script>

</body>
</html>

