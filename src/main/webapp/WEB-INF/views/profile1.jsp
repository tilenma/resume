<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page session="false"%>
<link rel="icon" href="resources/image/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="resources/image/favicon.ico" type="image/x-icon"> 
<html>
<head>
<title>Effective & Thyroid Dose</title>
<style>
</style>
<meta charset="utf-8">
<jsp:include page="acas_common.jsp" />

<link rel="stylesheet"
	href="<spring:url value="/resources/css/draw.css"/>" type="text/css">
</head>
<body>
	<script>
		function backAcas(){
			var url = 'acas';
			$(location).attr('href',url);
		}	
	</script>
	<div class="container-fluid">
		<ul class="nav nav-pills">
			<li id="homeTab" role="presentation" class="active menuText"><a href="<spring:url value="/"/>">Home</a></li>
			<li id="workTab" role="presentation" class="menuText"><a href="<spring:url value="/acas"/>">About ACAS</a></li>
			<li id="projectTab" role="presentation" class="menuText disabled"><a href="<spring:url value="/gis"/>">Nuclear Accident Consequence Map</a></li>
			<li id="skillTab" role="presentation" class="menuText"><a href="<spring:url value="/chart"/>">Gamma Dose Rate by Locations</a></li>
			<li id="demoTab" role="presentation" class="menuText"><a href="<spring:url value="/chart/detail"/>">Gamma Dose Rate at a Station</a></li>	
		</ul>
		<div class="row">
			<div class="col-md-10 menutitlecontainer">
				<div>
					<h4 class="maptitle"><span id="title">Effective dose (sum of ground, cloud and inhalation (committed)) </span><span id="agetype"></span>&nbsp; (mSv)</h4>
				</div>			
				<div class="row">
						<div class="col-md-3 narrow"><h4><label class="label label-default">Project Name: </label>&nbsp;<span class="mapdesc">S3 (5.0/050/D/0.0)</span></h4></div>
						<div class="col-md-4 narrow"><h4><label class="label label-default">Release start time: </label>&nbsp;<span class="mapdesc">2016-05-11 05:48 (UTC)</span></h4></div>
						<div class="col-md-5 narrow"><h4><label class="label label-default">Release amount: </label>&nbsp;<span class="mapdesc">I-131:8.0E16,Cs-137:2.5E15,Xe-133:5.0E18</span></h4></div>
				</div>						
				<ul class="nav nav-tabs">
					<li class="active"><a href="#effectivedose" data-toggle="tab"><b>Effective dose</b></a></li>
					<li><a href="#thyroiddose" data-toggle="tab"><b>Thyroid dose</b></a></li>
				</ul>

				<div class="tab-content">
					<!-- Effective dose tab -->
					<div id="effectivedose" class="tab-pane fade in active">
						<div class="row">
							<div class="col-md-3 narrow">
							    <label class="btn-inline btn-primary btn-sm"><input type="radio" name="optradio" value="normal" onClick="changeEffectiveDoseLayer()" checked>Normal living</label>
							    <label class="btn-inline btn-primary btn-sm"><input type="radio" name="optradio" value="open" onClick="changeEffectiveDoseLayer()">Open area</label>
							</div>
						</div>
						<div id="distance" class="mapdesc">
							<c:choose>
								<c:when test="${dist112 == 'N/A'}">
									    No area in Hong Kong with dosage greater than ${mindosage2}mSv.
									</c:when>
								<c:otherwise>
										Distance from NPP with dose greater than ${mindosage2}mSv is <mark1>${dist112}km</mark1>.
									</c:otherwise>
							</c:choose>
						</div>
						<div id="distance2" class="mapdesc" style="display:none">
							<c:choose>
								<c:when test="${dist212 == 'N/A'}">
									    No area in Hong Kong with dosage greater than ${mindosage2}mSv.
									</c:when>
								<c:otherwise>
										Distance from NPP with dose greater than ${mindosage2}mSv is <mark1>${dist212}km</mark1>.
									</c:otherwise>
							</c:choose>
						</div>

						<!-- Maps -->
						<div>
							<div id="map" class="map2"></div>
							<div id="info" class="">&nbsp;</div>
						</div>

					</div>
					<!--end effective-->

					<!-- Thyroid dose tab -->
					<div id="thyroiddose" class="tab-pane fade">
						<div class="row">
							<div class="col-md-3 narrow">
							    <label class="btn-inline btn-primary btn-sm"><input type="radio" name="optradio3" value="normal" onClick="changeThyroidDoseLayer()" checked>Normal living</label>
							    <label class="btn-inline btn-primary btn-sm"><input type="radio" name="optradio3" value="open" onClick="changeThyroidDoseLayer()">Open area</label>
							</div>
							<div class="col-md-3 narrow">
								    <label class="btn-inline btn-success btn-sm"><input type="radio" name="optradio4" value="adults" onClick="changeThyroidDoseLayer()" checked>Adults</label>
								    <label class="btn-inline btn-success btn-sm"><input type="radio" name="optradio4" value="children" onClick="changeThyroidDoseLayer()">Children</label>
							</div>
						</div>
						<div id="distance5" class="mapdesc">
							<c:choose>
								<c:when test="${dist511 == 'N/A'}">
							    No area in Hong Kong with dosage greater than ${mindosage1}mSv.
							</c:when>
								<c:otherwise>
								Distance from NPP with dose greater than ${mindosage1}mSv is <mark1>${dist511}km</mark1>.
							</c:otherwise>
							</c:choose>
						</div>
						<div id="distance6" class="mapdesc" style="display:none">
							<c:choose>
								<c:when test="${dist611 == 'N/A'}">
							    No area in Hong Kong with dosage greater than ${mindosage1}mSv.
							</c:when>
								<c:otherwise>
								Distance from NPP with dose greater than ${mindosage1}mSv is <mark1>${dist611}km</mark1>.
							</c:otherwise>
							</c:choose>
						</div>		
						<div id="distance7" class="mapdesc" style="display:none">
							<c:choose>
								<c:when test="${dist711 == 'N/A'}">
							    No area in Hong Kong with dosage greater than ${mindosage1}mSv.
							</c:when>
								<c:otherwise>
								Distance from NPP with dose greater than ${mindosage1}mSv is <mark1>${dist711}km</mark1>.
							</c:otherwise>
							</c:choose>
						</div>			
						<div id="distance8" class="mapdesc" style="display:none">
							<c:choose>
								<c:when test="${dist811 == 'N/A'}">
							    No area in Hong Kong with dosage greater than ${mindosage1}mSv.
							</c:when>
								<c:otherwise>
								Distance from NPP with dose greater than ${mindosage1}mSv is <mark1>${dist811}km</mark1>.
							</c:otherwise>
							</c:choose>
						</div>						

						<!-- Maps 2 -->
						<div>
							<div id="map2" class="map2"></div>
							<div id="info2" class="">&nbsp;</div>
						</div>
					</div>
					<!-- end thyroid tab -->

				</div>
				<!-- end tab-content -->

			</div>
			<!-- end span10 column -->

			<div class="col-md-2">
				<div class="menutitlecontainer">
					<div class="menutitle">Layers</div>
				</div>
				<div class="menulistcontainer">
					<div>
						<input type="checkbox" onClick="toggleLayer(this,raster)"
							id="base" checked class="menucheckbox"></input> Base Map
					</div>
					<div>
						<input type="checkbox"
							onClick="toggleLayerList(this,circleLayerList)" id="checkCircle"
							checked class="menucheckbox"></input> Distance Circle
					</div>
					<div>
						<input type="checkbox"
							onClick="toggleLayer(this,gnps)" id="checkCircle"
							checked class="menucheckbox"></input> GNPS
					</div>		
					<div>
						<input type="checkbox"
							onClick="toggleLayer(this,hkboundary)" id="checkCircle"
							checked class="menucheckbox"></input> Hong Kong Boundary
					</div>	
					<div>
						<input type="checkbox"
							onClick="toggleLayer(this,mc)" id="checkCircle"
							class="menucheckbox"></input> Monitoring Centres
					</div>							
					<div>
						<input type="checkbox"
							onClick="toggleLayer(this,rmn)" id="checkCircle"
							class="menucheckbox"></input> RMN Stations
					</div>						
					<div>
						<input type="checkbox"
							onClick="togglePlumeLayer()" id="checkPlume"
							checked class="menucheckbox"></input> Radiation Plume
					</div>				
				</div>
				
				<br />			
								
				<div class="menutitlecontainer">
					<div class="menutitle">Legend (mSv)</div>
				</div>

				<div class="menulistcontainer">
					<table>
							<tr>
								<td bgcolor="#7030a0">
									<div class="span1">&nbsp;&nbsp;&nbsp;&nbsp;</div>
								</td>
								<td class="menuitem">>=10000</td>
							</tr>
						
							<tr>
								<td bgcolor="#ef5ff2">
									<div class="span1">&nbsp;&nbsp;&nbsp;&nbsp;</div>
								</td>
								<td class="menuitem">1000 - 10000</td>
							</tr>
						
							<tr>
								<td bgcolor="#927350">
									<div class="span1">&nbsp;&nbsp;&nbsp;&nbsp;</div>
								</td>
								<td class="menuitem">500 - 1000</td>
							</tr>
						
							<tr>
								<td bgcolor="#ff0000">
									<div class="span1">&nbsp;&nbsp;&nbsp;&nbsp;</div>
								</td>
								<td class="menuitem">100 - 500</td>
							</tr>
						
							<tr>
								<td bgcolor="#ffff00">
									<div class="span1">&nbsp;&nbsp;&nbsp;&nbsp;</div>
								</td>
								<td class="menuitem">50 - 100</td>
							</tr>
						
							<tr>
								<td bgcolor="#32ff23">
									<div class="span1">&nbsp;&nbsp;&nbsp;&nbsp;</div>
								</td>
								<td class="menuitem">1 - 50</td>
							</tr>
						
							<tr>
								<td bgcolor="#00ffff">
									<div class="span1">&nbsp;&nbsp;&nbsp;&nbsp;</div>
								</td>
								<td class="menuitem">0.1 - 1</td>
							</tr>
						
							<tr>
								<td bgcolor="#00ccff">
									<div class="span1">&nbsp;&nbsp;&nbsp;&nbsp;</div>
								</td>
								<td class="menuitem">0.01 - 0.1</td>
							</tr>
						
							<tr>
								<td bgcolor="#0066ff">
									<div class="span1">&nbsp;&nbsp;&nbsp;&nbsp;</div>
								</td>
								<td class="menuitem">0.001 - 0.01</td>
							</tr>
						
							<tr>
								<td bgcolor="#3333ff">
									<div class="span1">&nbsp;&nbsp;&nbsp;&nbsp;</div>
								</td>
								<td class="menuitem">0.0001 - 0.001</td>
							</tr>
						
					</table>
				</div>
			</div>
		</div>
		<!-- end row-fluid -->
		<div class="menutitlecontainer">
			<div><h3 class="projectdesc">About this GIS platform</h3></div>
			<div class="row">
			    <div class="col-md-2 techdesc">Openlayers 3.6.0</div>
			    <div class="col-md-2 techdesc">Jquery 1.11.3</div>
			    <div class="col-md-2 techdesc">Bootstrap 3.3.4</div>
			    <div class="col-md-3 techdesc">Spring MVC 4.1.7.RELEASE</div>
			    <div class="col-md-3"></div>
			</div>
		</div>
	</div>
	<!-- end container-fluid -->

	<script src="<spring:url value="/resources/js/baseMap.js"/>"
		type="text/javascript"></script>
	<script src="<spring:url value="/resources/js/loadMap.js"/>"
		type="text/javascript"></script>
	<script src="<spring:url value="/resources/js/draw.js"/>" type="text/javascript"></script>
	<script src="<spring:url value="/resources/js/loadLocation.js"/>" type="text/javascript"></script>

	<script>
		//Create circle vectors
		var circleLayerList = createCircleLayer(map, 22.5989,114.544);
		
		//Create HK boundary
		var hkboundary = createStaticLayer('hk_boundary',circleStyle);
		
		//createMarkerLayer for GNPS
		//var lat = ${gnpslat};
		//var lon = ${gnpslon};
		//var gnps = createMarkerLayer(lat,lon,'GNPS')
		
		//createMarkerLayer for NPPs
		var gnps = createNPPLayer();
		
		//createMarkerLayer for RMNs
		var rmn = createRMNLayer();
		rmn.setVisible(false);
		
		//createMarkerLayer for MCs
		var mc = createMCLayer();
		mc.setVisible(false);
	
		//First map for effective dose
		var runId = ${runId};
		var productId = 1; //Sum of ground, cloud and inhalation (committed) dose, effective, normal living
		var sequence = 1;
		
		map.addLayer(gnps);
		map.addLayer(mc);
		map.addLayer(rmn);		
		map.addLayer(hkboundary);
		addLayerListToMap(map, circleLayerList);
		
		//Second map for thyroid dose
		var map2 = createDefaultMap('map2');
		
		map2.addLayer(gnps);
		
		map2.addLayer(hkboundary);
		
		function getVector(productid,sequence,legendid){
			var url = 'resources/data/profile1_pid' +productid+'_seq'+sequence+'_leg'+legendid+'.kml';
			
			var vector = new ol.layer.Vector({
				  source: new ol.source.Vector({
				      url: url,
				      format: new ol.format.KML({
				        extractStyles: false
				      })
				    }),
				  style: styles[legendid-1]
			});
			
			return vector;
		}
		
		function getLayer(productid, sequence){
			var vector1 = getVector(productid,sequence,1);
			var vector2 = getVector(productid,sequence,2);		
			var vector3 = getVector(productid,sequence,3);
			var vector4 = getVector(productid,sequence,4);
			var vector5 = getVector(productid,sequence,5);
			var vector6 = getVector(productid,sequence,6);
			var vector7 = getVector(productid,sequence,7);
			var vector8 = getVector(productid,sequence,8);
			var vector9 = getVector(productid,sequence,9);
			var vector10 = getVector(productid,sequence,10);
			
			var productLayers = new Array();
			productLayers[0] = vector1;
			productLayers[1] = vector2;
			productLayers[2] = vector3;
			productLayers[3] = vector4;
			productLayers[4] = vector5;
			productLayers[5] = vector6;
			productLayers[6] = vector7;
			productLayers[7] = vector8;
			productLayers[8] = vector9;
			productLayers[9] = vector10;
			
			return productLayers;
		}
		
		var product1Layers = getLayer(1,1);		
		addLayerListToMap(map,product1Layers);
		
		var product5Layers = getLayer(5,1);
		addLayerListToMap(map2,product5Layers);
		
		addDisplayInfoEventToMap(map,product1Layers,'value','info');		
		addDisplayInfoEventToMap(map2,product5Layers,'value','info2');
		
		//Other layers
		var product2Layers = getLayer(2,1);
		hideLayerList(product2Layers);
		addLayerListToMap(map, product2Layers);
		
		var product27Layers = getLayer(27,1);
		hideLayerList(product27Layers);
		addLayerListToMap(map2, product27Layers);
		
		var product6Layers = getLayer(6,1);
		hideLayerList(product6Layers);
		addLayerListToMap(map2, product6Layers);
		
		var product28Layers = getLayer(28,1);
		hideLayerList(product28Layers);
		addLayerListToMap(map2, product28Layers);
		
		
		//Set tab animation
		function updateMapSize(){
			setTimeout( function() { map.updateSize();}, 200);
			setTimeout( function() { map2.updateSize();}, 200);
		}		

		/*
		$(document).ready(function(){
		    $(".nav-tabs a").click(function(e){
		        //$(this).tab('show');
		        updateMapSize();
		        updateCheckBoxLayer(e);
		    });
		});
		
		function updateCheckBoxLayer(e){
			var target = $(e.target).attr("href");
			alert(target);
		}
		*/
		$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
			  var target = $(e.target).attr("href") // activated tab
			  
			  updateMapSize();			  
			  if(target=='#effectivedose'){				  
				  changeEffectiveDoseLayer();
			  }
			  else{
				  changeThyroidDoseLayer();
			  }
		});

		var currentPlumeLayer = product1Layers;
		
		function changeEffectiveDoseLayer(){
			var $normal = $('input[name=optradio]:checked').val();
			
			if($normal == 'normal'){
				switchLayerList(product1Layers,product2Layers);
				$("#distance2").attr("style","display:none");
				$("#distance").attr("style","display");
				currentPlumeLayer = product1Layers;
			}
			else{
				switchLayerList(product2Layers,product1Layers);
				$("#distance").attr("style","display:none");
				$("#distance2").attr("style","display");
				currentPlumeLayer = product2Layers;
			}
			
			$("#checkPlume").prop("checked",true);
		}
		
		function changeThyroidDoseLayer(){
			var $normal = $('input[name=optradio3]:checked').val();
			var $adults = $('input[name=optradio4]:checked').val();
			
			if($normal == 'normal' && $adults == 'adults'){			
				hideLayerList(product6Layers);
				hideLayerList(product27Layers);
				hideLayerList(product28Layers);				
				showLayerList(product5Layers);
				
				$("#distance6").attr("style","display:none");
				$("#distance7").attr("style","display:none");
				$("#distance8").attr("style","display:none");
				$("#distance5").attr("style","display");
				
				$("#agetype").text("adults");
				
				currentPlumeLayer = product5Layers;
			}
			else if($normal == 'open' && $adults == 'adults'){				
				hideLayerList(product5Layers);
				hideLayerList(product27Layers);
				hideLayerList(product28Layers);				
				showLayerList(product6Layers);
				
				$("#distance5").attr("style","display:none");
				$("#distance7").attr("style","display:none");
				$("#distance8").attr("style","display:none");
				$("#distance6").attr("style","display");
				
				$("#agetype").text("adults");
				
				currentPlumeLayer = product6Layers;
			}	
			else if($normal == 'normal' && $adults == 'children'){				
				hideLayerList(product5Layers);
				hideLayerList(product6Layers);
				hideLayerList(product28Layers);				
				showLayerList(product27Layers);
				
				$("#distance5").attr("style","display:none");
				$("#distance6").attr("style","display:none");
				$("#distance8").attr("style","display:none");
				$("#distance7").attr("style","display");
				
				$("#agetype").text("children");
				
				currentPlumeLayer = product27Layers;
			}
			else{
				hideLayerList(product5Layers);
				hideLayerList(product6Layers);
				hideLayerList(product27Layers);
				showLayerList(product28Layers);
				
				$("#distance5").attr("style","display:none");
				$("#distance6").attr("style","display:none");
				$("#distance7").attr("style","display:none");
				$("#distance8").attr("style","display");	
				
				$("#agetype").text("children");
				
				currentPlumeLayer = product28Layers;
			}
			
			$("#checkPlume").prop("checked",true);
		}
		
		//Add control for distance measure
		var mcontrol = createMeasureControl(map);
		map.addControl(mcontrol);
		
		//Full screen control
		map.addControl(new ol.control.FullScreen());
		map2.addControl(new ol.control.FullScreen());
		
		function togglePlumeLayer(){
			var isChecked = $("#checkPlume").is(':checked');
			
			currentPlumeLayer.forEach(function(layer){
	            layer.setVisible(isChecked);
	    	});	
		}
		
	</script>
</body>
</html>

