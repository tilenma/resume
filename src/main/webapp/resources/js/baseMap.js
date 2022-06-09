/* Base layer map */
var raster = new ol.layer.Tile(
		{
			/*//Bing Map
			source : new ol.source.BingMaps(
					{
						imagerySet : 'Aerial',
						key : 'Ak-dzM4wZjSqTlzveKz5u0d4IQ4bRzVI309GxmkgSVr1ewS6iPSrOvOKhA-CJlm3'
					})
			*/
			//Open street map
			source: new ol.source.OSM()
			
		/*
			source: new ol.source.XYZ({
				url: 'http://bmetis1.hko.gov.hk/~f4prog/eric/regionalWeather/f4/osm-tiles/detail/{z}/{x}/{y}.png'
			})
*/
		});

/* Add marker */
function addCenterMarkerToMap(map){
	var center = new ol.Feature({
		geometry : new ol.geom.Point(ol.proj.transform([ 114.174353,22.302156 ], 'EPSG:4326', 'EPSG:3857'))
	});
	
	var iconStyle = new ol.style.Style({
		image : new ol.style.Icon(({
			anchor : [ 0.5, 46 ],
			anchorXUnits : 'fraction',
			anchorYUnits : 'pixels',
			opacity : 0.75,
			src : 'https://maps.google.com/mapfiles/kml/shapes/schools_maps.png'
		}))
	});
	
	center.setStyle(iconStyle);
	
	var markerSource = new ol.source.Vector({
		features : [ center ]
	});
	
	var markerLayer = new ol.layer.Vector({
		source : markerSource
	});
	
	map.addLayer(markerLayer);
}

function addMarkerToMap(map, lat, lon,text){
	var center = new ol.Feature({
		geometry : new ol.geom.Point(ol.proj.transform([ lon,lat ], 'EPSG:4326', 'EPSG:3857'))
	});
	
	var iconStyle = new ol.style.Style({
		image : new ol.style.Icon(({
			anchor : [ 32, 32 ],
			anchorXUnits : 'pixels',
			anchorYUnits : 'pixels',
			opacity : 0.75,
			src : 'http://maps.google.com/mapfiles/ms/icons/blue.png'
		})),
		
		text : new ol.style.Text({
		      fill : new ol.style.Fill({
		          color : '#330'
		        }),
		        stroke : new ol.style.Stroke({
		          color : '#fff',
		          width : 4
		        }),
		        text : text,
		        font : '12px Verdana',
		        offsetX : 30,
		        offsetY : 0
		      })
	});
	
	center.setStyle(iconStyle);
	
	var markerSource = new ol.source.Vector({
		features : [ center ]
	});
	
	var markerLayer = new ol.layer.Vector({
		source : markerSource
	});
	
	map.addLayer(markerLayer);
}

/* Display feature info */
function addDisplayInfoEventToMap(map,aLayer,featureField,elementIdForDisplay){
	var displayFeatureInfo = function(lonlat,pixel,featureField,elementIdForDisplay) {
		  var features = [];
		  map.forEachFeatureAtPixel(pixel, function(feature, layer) {
			  if(feature.get(featureField) != null){
				  features.push(feature);
			  }			 
		  });
		  if (features.length > 0) {
		    var info = [];
		    var i, ii;
		    for (i = 0, ii = features.length; i < ii; ++i) {
		    	var num = Number(features[i].get(featureField));
		        info.push(num.toPrecision(3)+'mSv');
		    }
		    var outputtext = 'Value at (' +roundToThree(lonlat[0]) +','+ roundToThree(lonlat[1]) +') is ';
		    document.getElementById(elementIdForDisplay).innerHTML = outputtext +info.join(', ') || '(unknown)';
		    map.getTarget().style.cursor = 'pointer';
		  } else {
		    document.getElementById(elementIdForDisplay).innerHTML = '&nbsp;';
		    map.getTarget().style.cursor = '';
		  }
		};
		
	map.on('click', function(evt) {
		 var lonlat = ol.proj.transform(evt.coordinate, 'EPSG:3857', 'EPSG:4326');		 
		  displayFeatureInfo(lonlat,evt.pixel,featureField,elementIdForDisplay);
	});
	
	map.on('pointermove', function(evt) {
		  if (evt.dragging) {
		    return;
		  }
		  var pixel = map.getEventPixel(evt.originalEvent);
		  var lonlat = ol.proj.transform(evt.coordinate, 'EPSG:3857', 'EPSG:4326');
		  displayFeatureInfo(lonlat,pixel,featureField,elementIdForDisplay);
	});
}

/* Display feature info */
function addDisplayInfoEventToMapWithUnit(map,aLayer,featureField,elementIdForDisplay,unit,mulitiplier){
	var displayFeatureInfo = function(lonlat,pixel,featureField,elementIdForDisplay) {
		  var features = [];
		  map.forEachFeatureAtPixel(pixel, function(feature, layer) {
			  if(feature.get(featureField) != null){
				  features.push(feature);
			  }			 
		  });
		  if (features.length > 0) {
		    var info = [];
		    var i, ii;
		    for (i = 0, ii = features.length; i < ii; ++i) {
		      info.push((features[i].get(featureField)*mulitiplier).toPrecision(3)+unit);
		    }
		    var outputtext = 'Value at (' +roundToThree(lonlat[0]) +','+ roundToThree(lonlat[1]) +') is ';
		    document.getElementById(elementIdForDisplay).innerHTML = outputtext +info.join(', ') || '(unknown)';
		    map.getTarget().style.cursor = 'pointer';
		  } else {
		    document.getElementById(elementIdForDisplay).innerHTML = '&nbsp;';
		    map.getTarget().style.cursor = '';
		  }
		};
		
	map.on('click', function(evt) {
		 var lonlat = ol.proj.transform(evt.coordinate, 'EPSG:3857', 'EPSG:4326');		 
		  displayFeatureInfo(lonlat,evt.pixel,featureField,elementIdForDisplay);
	});
	
	map.on('pointermove', function(evt) {
		  if (evt.dragging) {
		    return;
		  }
		  var pixel = map.getEventPixel(evt.originalEvent);
		  var lonlat = ol.proj.transform(evt.coordinate, 'EPSG:3857', 'EPSG:4326');
		  displayFeatureInfo(lonlat,pixel,featureField,elementIdForDisplay);
	});
}

/* Display feature info */
function addDisplayInfoEventToMapWithPrecision(map,aLayer,featureField,elementIdForDisplay,unit,mulitiplier,precision){
	var displayFeatureInfo = function(lonlat,pixel,featureField,elementIdForDisplay) {
		  var features = [];
		  map.forEachFeatureAtPixel(pixel, function(feature, layer) {
			  if(feature.get(featureField) != null){
				  features.push(feature);
			  }			 
		  });
		  if (features.length > 0) {
		    var info = [];
		    var i, ii;
		    for (i = 0, ii = features.length; i < ii; ++i) {
		      info.push((features[i].get(featureField)*mulitiplier).toPrecision(precision)+unit);
		    }
		    var outputtext = 'Value at (' +roundToThree(lonlat[0]) +','+ roundToThree(lonlat[1]) +') is ';
		    document.getElementById(elementIdForDisplay).innerHTML = outputtext +info.join(', ') || '(unknown)';
		    map.getTarget().style.cursor = 'pointer';
		  } else {
		    document.getElementById(elementIdForDisplay).innerHTML = '&nbsp;';
		    map.getTarget().style.cursor = '';
		  }
		};
		
	map.on('click', function(evt) {
		 var lonlat = ol.proj.transform(evt.coordinate, 'EPSG:3857', 'EPSG:4326');		 
		  displayFeatureInfo(lonlat,evt.pixel,featureField,elementIdForDisplay);
	});
	
	map.on('pointermove', function(evt) {
		  if (evt.dragging) {
		    return;
		  }
		  var pixel = map.getEventPixel(evt.originalEvent);
		  var lonlat = ol.proj.transform(evt.coordinate, 'EPSG:3857', 'EPSG:4326');
		  displayFeatureInfo(lonlat,pixel,featureField,elementIdForDisplay);
	});
}

function roundToThree(value){
	return(Math.round(value*1000)/1000);
}



function createDefaultMap(elementId){
	var map = new ol.Map({
		layers : [ raster ],
		target : document.getElementById(elementId),
		view : new ol.View({
			center : ol.proj.transform([ 114.1504093400752, 22.400203230428101 ],
					'EPSG:4326', 'EPSG:3857'),
			maxZoom : 19,
			zoom : 10
		})
	});
	
	return map;
}




/* Create map */
var map = new ol.Map({
/*
	controls: ol.control.defaults().extend([
	     new ol.control.FullScreen()
    ]),
    interactions: ol.interaction.defaults().extend([
                                                    new ol.interaction.DragRotateAndZoom()
                                                  ]),
 
	  controls: ol.control.defaults().extend([
	                                          new ol.control.OverviewMap()
	                                        ]),
*/                   	
	layers : [ raster ],
	target : document.getElementById('map'),
	view : new ol.View({
		center : ol.proj.transform([ 114.1504093400752, 22.400203230428101 ],
				'EPSG:4326', 'EPSG:3857'),
		maxZoom : 19,
		zoom : 10
	})
});

//Add display
//addDisplayInfoEventToMap(map,'value','info');