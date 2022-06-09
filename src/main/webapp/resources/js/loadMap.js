// format used to parse WFS GetFeature responses
var geojsonFormat = new ol.format.GeoJSON();

$.urlParam = function(name,def){	
	var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);	
	
	if(results!=null && results[1] !=null){		
		return results[1] || 0;
	}
	
	return def;
}

$.urlParam = function(name){
	var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
	if(results!=null && results[1] !=null){
		return results[1] || 0;
	}
	return null;
}



var filter = $.urlParam('cql_filter','productid=1 and sequence=1');

$.filterParam = function(name,def){
	var results = new RegExp(name + '=([^&#]*)').exec(filter);
	if(results!=null && results[1] !=null){
		return results[1] || 0;
	}
	return def;
}

/* Define styles */
var circleStyle = 
	new ol.style.Style({
		stroke: new ol.style.Stroke({
			  color: colors[2],
			  width: 1
		})
	})
;

var styles = [
	new ol.style.Style({
		fill: new ol.style.Fill({
			color: colors[0]
		})
		,stroke: new ol.style.Stroke({
		  color: colors[0],
		  width: 1
		})		
	}),
	new ol.style.Style({
		fill: new ol.style.Fill({
			color: colors[1]
		})
		,stroke: new ol.style.Stroke({
		  color: colors[1],
		  width: 1
		})			
	}),		
	new ol.style.Style({
		fill: new ol.style.Fill({
			color: colors[2]
		})
		,stroke: new ol.style.Stroke({
		  color: colors[2],
		  width: 1
		})			
	}),		
	new ol.style.Style({
		fill: new ol.style.Fill({
			color: colors[3]
		})
		,stroke: new ol.style.Stroke({
		  color: colors[3],
		  width: 1
		})			
	}),		
	new ol.style.Style({
		fill: new ol.style.Fill({
			color: colors[4]
		})
		,stroke: new ol.style.Stroke({
		  color: colors[4],
		  width: 1
		})			
	}),
	new ol.style.Style({
		fill: new ol.style.Fill({
			color: colors[5]
		})
		,stroke: new ol.style.Stroke({
		  color: colors[5],
		  width: 1
		})			
	}),		
	new ol.style.Style({
		fill: new ol.style.Fill({
			color: colors[6]
		})
		,stroke: new ol.style.Stroke({
		  color: colors[6],
		  width: 1
		})			
	}),		
	new ol.style.Style({
		fill: new ol.style.Fill({
			color: colors[7]
		})
		,stroke: new ol.style.Stroke({
		  color: colors[7],
		  width: 1
		})			
	}),		
	new ol.style.Style({
		fill: new ol.style.Fill({
			color: colors[8]
		})
		,stroke: new ol.style.Stroke({
		  color: colors[8],
		  width: 1
		})			
	}),		
	new ol.style.Style({
		fill: new ol.style.Fill({
			color: colors[9]
		})
		,stroke: new ol.style.Stroke({
		  color: colors[9],
		  width: 1
		})			
	})
];

/* Function to create product layer */
function createProductLayer(project,productid,sequence){
	/* Define vector source 
	 * 2D array of 15X10
	 * Assume max no of products: 15
	 * Assume no of colors: 10
	 * */
	var vectorSourceList = new Array(10);
	
	var callbackname0 = 'callback'+productid+'0';	
	vectorSourceList[0] = new ol.source.Vector({
		loader: function(extent, resolution, projection) {			
			var url = wfsUrl+'&format_options=callback:'+callbackname0+';id_policy:false'+'&cql_filter=productid='+productid+' and project=\''+project+'\' and sequence='+sequence+legends[0];				
			$.ajax({url: url, dataType: 'jsonp', contentType: "application/json",cache: true,  type: 'GET', timeout: 50000});
		},
		strategy: ol.loadingstrategy.all
	});	
	window[callbackname0] = function (response) { vectorSourceList[0].addFeatures(geojsonFormat.readFeatures(response));};
	
	
	var callbackname1 = 'callback'+productid+'1';
	vectorSourceList[1] = new ol.source.Vector({
	  loader: function(extent, resolution, projection) {			
			var url = wfsUrl+'&format_options=callback:'+callbackname1+';id_policy:false'+'&cql_filter=productid='+productid+' and project=\''+project+'\' and sequence='+sequence+legends[1];
			$.ajax({url: url, dataType: 'jsonp', contentType: "application/json",cache: true,  type: 'GET', timeout: 50000});
	  },
	  strategy: ol.loadingstrategy.all
	});
	window[callbackname1] = function (response) { vectorSourceList[1].addFeatures(geojsonFormat.readFeatures(response));};
	
	
	var callbackname2 = 'callback'+productid+'2';
	vectorSourceList[2] = new ol.source.Vector({
	  loader: function(extent, resolution, projection) {			
			var url = wfsUrl+'&format_options=callback:'+callbackname2+';id_policy:false'+'&cql_filter=productid='+productid+' and project=\''+project+'\' and sequence='+sequence+legends[2];
			$.ajax({url: url, dataType: 'jsonp', contentType: "application/json",cache: true,  type: 'GET', timeout: 50000});
	  },
	  strategy: ol.loadingstrategy.all
	});
	window[callbackname2] = function (response) { vectorSourceList[2].addFeatures(geojsonFormat.readFeatures(response));};
	
	var callbackname3 = 'callback'+productid+'3';
	vectorSourceList[3] = new ol.source.Vector({
	  loader: function(extent, resolution, projection) {			
			var url = wfsUrl+'&format_options=callback:'+callbackname3+';id_policy:false'+'&cql_filter=productid='+productid+' and project=\''+project+'\' and sequence='+sequence+legends[3];
			$.ajax({url: url, dataType: 'jsonp', contentType: "application/json",cache: true,  type: 'GET', timeout: 50000});
	  },
	  strategy: ol.loadingstrategy.all
	});
	window[callbackname3] = function (response) { vectorSourceList[3].addFeatures(geojsonFormat.readFeatures(response));};
	
	var callbackname4 = 'callback'+productid+'4';
	vectorSourceList[4] = new ol.source.Vector({
	  loader: function(extent, resolution, projection) {			
			var url = wfsUrl+'&format_options=callback:'+callbackname4+';id_policy:false'+'&cql_filter=productid='+productid+' and project=\''+project+'\' and sequence='+sequence+legends[4];
			$.ajax({url: url, dataType: 'jsonp', contentType: "application/json",cache: true,  type: 'GET', timeout: 50000});
	  },
	  strategy: ol.loadingstrategy.all
	});
	window[callbackname4] = function (response) { vectorSourceList[4].addFeatures(geojsonFormat.readFeatures(response));};
	
	var callbackname5 = 'callback'+productid+'5';
	vectorSourceList[5] = new ol.source.Vector({
	  loader: function(extent, resolution, projection) {			
			var url = wfsUrl+'&format_options=callback:'+callbackname5+';id_policy:false'+'&cql_filter=productid='+productid+' and project=\''+project+'\' and sequence='+sequence+legends[5];
			$.ajax({url: url, dataType: 'jsonp', contentType: "application/json",cache: true,  type: 'GET', timeout: 50000});
	  },
	  strategy: ol.loadingstrategy.all
	});
	window[callbackname5] = function (response) { vectorSourceList[5].addFeatures(geojsonFormat.readFeatures(response));};
	
	var callbackname6 = 'callback'+productid+'6';
	vectorSourceList[6] = new ol.source.Vector({
	  loader: function(extent, resolution, projection) {			
			var url = wfsUrl+'&format_options=callback:'+callbackname6+';id_policy:false'+'&cql_filter=productid='+productid+' and project=\''+project+'\' and sequence='+sequence+legends[6];
			$.ajax({url: url, dataType: 'jsonp', contentType: "application/json",cache: true,  type: 'GET', timeout: 50000});
	  },
	  strategy: ol.loadingstrategy.all
	});
	window[callbackname6] = function (response) { vectorSourceList[6].addFeatures(geojsonFormat.readFeatures(response));};
	
	var callbackname7 = 'callback'+productid+'7';
	vectorSourceList[7] = new ol.source.Vector({
	  loader: function(extent, resolution, projection) {			
			var url = wfsUrl+'&format_options=callback:'+callbackname7+';id_policy:false'+'&cql_filter=productid='+productid+' and project=\''+project+'\' and sequence='+sequence+legends[7];
			$.ajax({url: url, dataType: 'jsonp', contentType: "application/json",cache: true,  type: 'GET', timeout: 50000});
	  },
	  strategy: ol.loadingstrategy.all
	});
	window[callbackname7] = function (response) { vectorSourceList[7].addFeatures(geojsonFormat.readFeatures(response));};
	
	var callbackname8 = 'callback'+productid+'8';
	vectorSourceList[8] = new ol.source.Vector({
	  loader: function(extent, resolution, projection) {			
			var url = wfsUrl+'&format_options=callback:'+callbackname8+';id_policy:false'+'&cql_filter=productid='+productid+' and project=\''+project+'\' and sequence='+sequence+legends[8];
			$.ajax({url: url, dataType: 'jsonp', contentType: "application/json",cache: true,  type: 'GET', timeout: 50000});
	  },
	  strategy: ol.loadingstrategy.all
	});
	window[callbackname8] = function (response) { vectorSourceList[8].addFeatures(geojsonFormat.readFeatures(response));};
	
	var callbackname9 = 'callback'+productid+'9';
	vectorSourceList[9] = new ol.source.Vector({
	  loader: function(extent, resolution, projection) {			
			var url = wfsUrl+'&format_options=callback:'+callbackname9+';id_policy:false'+'&cql_filter=productid='+productid+' and project=\''+project+'\' and sequence='+sequence+legends[9];
			$.ajax({url: url, dataType: 'jsonp', contentType: "application/json",cache: true,  type: 'GET', timeout: 50000});
	  },
	  strategy: ol.loadingstrategy.all
	});
	window[callbackname9] = function (response) { vectorSourceList[9].addFeatures(geojsonFormat.readFeatures(response));};

	/* Define vectors */
	var vectorList = new Array();
	
	vectorList[0] = new ol.layer.Vector({
		  source: vectorSourceList[0],
		  style: styles[0]
	});

	
	vectorList[1] = new ol.layer.Vector({
	  source: vectorSourceList[1],
	  style: styles[1]
	});

	vectorList[2] = new ol.layer.Vector({
	  source: vectorSourceList[2],
	  style: styles[2]
	});

	vectorList[3] = new ol.layer.Vector({
	  source: vectorSourceList[3],
	  style: styles[3]
	});

	vectorList[4] = new ol.layer.Vector({
	  source: vectorSourceList[4],
	  style: styles[4]
	});

	vectorList[5] = new ol.layer.Vector({
	  source: vectorSourceList[5],
	  style: styles[5]
	});

	vectorList[6] = new ol.layer.Vector({
	  source: vectorSourceList[6],
	  style: styles[6]
	});

	vectorList[7] = new ol.layer.Vector({
	  source: vectorSourceList[7],
	  style: styles[7]
	});

	vectorList[8] = new ol.layer.Vector({
	  source: vectorSourceList[8],
	  style: styles[8]
	});

	vectorList[9] = new ol.layer.Vector({
	  source: vectorSourceList[9],
	  style: styles[9]
	});

	return vectorList;
}


/* Function to create summary layer (only one color) */
function createSummaryLayer(runid,productid,sequence,legend,color,name){
	var style = new ol.style.Style({
	          		fill: new ol.style.Fill({
	          			color: color
	          		})
	          		,stroke: new ol.style.Stroke({
	          		  color: color,
	          		  width: 1
	          		})		
	});
	
	//var legend = ' and value >=' + threshold.toString();
	
	var callbackname = 'callback'+productid+sequence+name;	
	var vectorSource = new ol.source.Vector({
		loader: function(extent, resolution, projection) {			
			var url = wfsUrl+'&format_options=callback:'+callbackname+';id_policy:false'+'&cql_filter=productid='+productid+' and id=\''+runid+'\' and sequence='+sequence+legend;			
			$.ajax({url: url, dataType: 'jsonp', contentType: "application/json",cache: true,  type: 'GET', timeout: 50000});
		},
		strategy: ol.loadingstrategy.all
	});
	
	window[callbackname] = function (response) { vectorSource.addFeatures(geojsonFormat.readFeatures(response));};
	
	var vector = new ol.layer.Vector({
		  source: vectorSource,
		  style: style
    });
	
	return vector;
}


/* Function to create product layer */
function createProductLayerById(runid,productid,sequence){
	/* Define vector source 
	 * 2D array of 15X10
	 * Assume max no of products: 15
	 * Assume no of colors: 10
	 * */	
	var vectorSourceList = new Array(10);
	
	var callbackname0 = 'callback'+productid+sequence+'0';	
	vectorSourceList[0] = new ol.source.Vector({
		loader: function(extent, resolution, projection) {			
			var url = wfsUrl+'&format_options=callback:'+callbackname0+';id_policy:false'+'&cql_filter=productid='+productid+' and id=\''+runid+'\' and sequence='+sequence+legends[0];			
			$.ajax({url: url, dataType: 'jsonp', contentType: "application/json",cache: true,  type: 'GET', timeout: 50000});
		},
		strategy: ol.loadingstrategy.all
	});	
	window[callbackname0] = function (response) { vectorSourceList[0].addFeatures(geojsonFormat.readFeatures(response));};
	
	
	var callbackname1 = 'callback'+productid+sequence+'1';
	vectorSourceList[1] = new ol.source.Vector({
	  loader: function(extent, resolution, projection) {			
			var url = wfsUrl+'&format_options=callback:'+callbackname1+';id_policy:false'+'&cql_filter=productid='+productid+' and id=\''+runid+'\' and sequence='+sequence+legends[1];
			$.ajax({url: url, dataType: 'jsonp', contentType: "application/json",cache: true,  type: 'GET', timeout: 50000});
	  },
	  strategy: ol.loadingstrategy.all
	});
	window[callbackname1] = function (response) { vectorSourceList[1].addFeatures(geojsonFormat.readFeatures(response));};
	
	
	var callbackname2 = 'callback'+productid+sequence+'2';
	vectorSourceList[2] = new ol.source.Vector({
	  loader: function(extent, resolution, projection) {			
			var url = wfsUrl+'&format_options=callback:'+callbackname2+';id_policy:false'+'&cql_filter=productid='+productid+' and id=\''+runid+'\' and sequence='+sequence+legends[2];
			$.ajax({url: url, dataType: 'jsonp', contentType: "application/json",cache: true,  type: 'GET', timeout: 50000});
	  },
	  strategy: ol.loadingstrategy.all
	});
	window[callbackname2] = function (response) { vectorSourceList[2].addFeatures(geojsonFormat.readFeatures(response));};
	
	var callbackname3 = 'callback'+productid+sequence+'3';
	vectorSourceList[3] = new ol.source.Vector({
	  loader: function(extent, resolution, projection) {			
			var url = wfsUrl+'&format_options=callback:'+callbackname3+';id_policy:false'+'&cql_filter=productid='+productid+' and id=\''+runid+'\' and sequence='+sequence+legends[3];
			$.ajax({url: url, dataType: 'jsonp', contentType: "application/json",cache: true,  type: 'GET', timeout: 50000});
	  },
	  strategy: ol.loadingstrategy.all
	});
	window[callbackname3] = function (response) { vectorSourceList[3].addFeatures(geojsonFormat.readFeatures(response));};
	
	var callbackname4 = 'callback'+productid+sequence+'4';
	vectorSourceList[4] = new ol.source.Vector({
	  loader: function(extent, resolution, projection) {			
			var url = wfsUrl+'&format_options=callback:'+callbackname4+';id_policy:false'+'&cql_filter=productid='+productid+' and id=\''+runid+'\' and sequence='+sequence+legends[4];
			$.ajax({url: url, dataType: 'jsonp', contentType: "application/json",cache: true,  type: 'GET', timeout: 50000});
	  },
	  strategy: ol.loadingstrategy.all
	});
	window[callbackname4] = function (response) { vectorSourceList[4].addFeatures(geojsonFormat.readFeatures(response));};
	
	var callbackname5 = 'callback'+productid+sequence+'5';
	vectorSourceList[5] = new ol.source.Vector({
	  loader: function(extent, resolution, projection) {			
			var url = wfsUrl+'&format_options=callback:'+callbackname5+';id_policy:false'+'&cql_filter=productid='+productid+' and id=\''+runid+'\' and sequence='+sequence+legends[5];
			$.ajax({url: url, dataType: 'jsonp', contentType: "application/json",cache: true,  type: 'GET', timeout: 50000});
	  },
	  strategy: ol.loadingstrategy.all
	});
	window[callbackname5] = function (response) { vectorSourceList[5].addFeatures(geojsonFormat.readFeatures(response));};
	
	var callbackname6 = 'callback'+productid+sequence+'6';
	vectorSourceList[6] = new ol.source.Vector({
	  loader: function(extent, resolution, projection) {			
			var url = wfsUrl+'&format_options=callback:'+callbackname6+';id_policy:false'+'&cql_filter=productid='+productid+' and id=\''+runid+'\' and sequence='+sequence+legends[6];
			$.ajax({url: url, dataType: 'jsonp', contentType: "application/json",cache: true,  type: 'GET', timeout: 50000});
	  },
	  strategy: ol.loadingstrategy.all
	});
	window[callbackname6] = function (response) { vectorSourceList[6].addFeatures(geojsonFormat.readFeatures(response));};
	
	var callbackname7 = 'callback'+productid+sequence+'7';
	vectorSourceList[7] = new ol.source.Vector({
	  loader: function(extent, resolution, projection) {			
			var url = wfsUrl+'&format_options=callback:'+callbackname7+';id_policy:false'+'&cql_filter=productid='+productid+' and id=\''+runid+'\' and sequence='+sequence+legends[7];
			$.ajax({url: url, dataType: 'jsonp', contentType: "application/json",cache: true,  type: 'GET', timeout: 50000});
	  },
	  strategy: ol.loadingstrategy.all
	});
	window[callbackname7] = function (response) { vectorSourceList[7].addFeatures(geojsonFormat.readFeatures(response));};
	
	var callbackname8 = 'callback'+productid+sequence+'8';
	vectorSourceList[8] = new ol.source.Vector({
	  loader: function(extent, resolution, projection) {			
			var url = wfsUrl+'&format_options=callback:'+callbackname8+';id_policy:false'+'&cql_filter=productid='+productid+' and id=\''+runid+'\' and sequence='+sequence+legends[8];
			$.ajax({url: url, dataType: 'jsonp', contentType: "application/json",cache: true,  type: 'GET', timeout: 50000});
	  },
	  strategy: ol.loadingstrategy.all
	});
	window[callbackname8] = function (response) { vectorSourceList[8].addFeatures(geojsonFormat.readFeatures(response));};
	
	var callbackname9 = 'callback'+productid+sequence+'9';
	vectorSourceList[9] = new ol.source.Vector({
	  loader: function(extent, resolution, projection) {			
			var url = wfsUrl+'&format_options=callback:'+callbackname9+';id_policy:false'+'&cql_filter=productid='+productid+' and id=\''+runid+'\' and sequence='+sequence+legends[9];
			$.ajax({url: url, dataType: 'jsonp', contentType: "application/json",cache: true,  type: 'GET', timeout: 50000});
	  },
	  strategy: ol.loadingstrategy.all
	});
	window[callbackname9] = function (response) { vectorSourceList[9].addFeatures(geojsonFormat.readFeatures(response));};

	/* Define vectors */
	var vectorList = new Array();
	
	vectorList[0] = new ol.layer.Vector({
		  source: vectorSourceList[0],
		  style: styles[0],
		  renderBuffer: 1000
	});

	
	vectorList[1] = new ol.layer.Vector({
	  source: vectorSourceList[1],
	  style: styles[1]
	});

	vectorList[2] = new ol.layer.Vector({
	  source: vectorSourceList[2],
	  style: styles[2]
	});

	vectorList[3] = new ol.layer.Vector({
	  source: vectorSourceList[3],
	  style: styles[3]
	});

	vectorList[4] = new ol.layer.Vector({
	  source: vectorSourceList[4],
	  style: styles[4]
	});

	vectorList[5] = new ol.layer.Vector({
	  source: vectorSourceList[5],
	  style: styles[5]
	});

	vectorList[6] = new ol.layer.Vector({
	  source: vectorSourceList[6],
	  style: styles[6]
	});

	vectorList[7] = new ol.layer.Vector({
	  source: vectorSourceList[7],
	  style: styles[7]
	});

	vectorList[8] = new ol.layer.Vector({
	  source: vectorSourceList[8],
	  style: styles[8]
	});

	vectorList[9] = new ol.layer.Vector({
	  source: vectorSourceList[9],
	  style: styles[9]
	});

	return vectorList;
}

/* Function to create product layer */
function createProductLayerByFilter(){
	alert(filter);
	
	var project = $.filterParam('project','Test');
	
	alert(project);
}


/* 
 * Set Map controls
*/
var toggleLayerList = function(inputEl,layerList){
	layerList.forEach(function(layer){
            layer.setVisible(inputEl.checked);
    });			
};

var toggleLayer = function(inputEl,layer){
    layer.setVisible(inputEl.checked);			
};

var switchLayerList = function(toggleLayerList1,toggleLayerList2){
	toggleLayerList1.forEach(function(layer){
        layer.setVisible(true);
	});
	toggleLayerList2.forEach(function(layer){
        layer.setVisible(false);
	});
};

var hideLayerList = function(layerList){
	layerList.forEach(function(layer){
        layer.setVisible(false);
	});	
};

var showLayerList = function(layerList){
	layerList.forEach(function(layer){
        layer.setVisible(true);
	});	
};

/*
function addLayerListToMap(layerList){
	for(i=0; i < layerList.length;i++ ){
		map.addLayer(layerList[i]);
	}
}
*/
function addLayerListToMap(map,layerList){
	for(i=0; i < layerList.length;i++ ){
		map.addLayer(layerList[i]);
	}
}

function removeLayerListFromMap(map,layerList){
	for(i=0; i < layerList.length;i++ ){
		map.removeLayer(layerList[i]);
	}
}

function createStaticLayer(layerName,aStyle){
	/*//Cross domain not allowed
	var circleVector = new ol.layer.Vector({
		  source: new ol.source.Vector({
			    url: 'http://localhost:8080/geoserver/cite/wfs?service=WFS&request=GetFeature&version=2.0.0&typename=cite:10_30km_circle&srsname=EPSG:4326&outputFormat=kml',
			    format: new ol.format.KML({
			      extractStyles: false
			    })
			  }),
			  style: styleFunction
			});
	

	map.addLayer(circleVector);
	*/
	
	var callbacknameStatic = 'callback'+layerName;	

	var staticVectorSource = new ol.source.Vector({
		loader: function(extent, resolution, projection) {			
			var url = wfsStaticUrl+layerName+'&srsname=EPSG:3857&outputFormat=text/javascript';
			url = url + '&format_options=callback:'+callbacknameStatic+';id_policy:false';
			$.ajax({url: url, dataType: 'jsonp', contentType: "application/json",cache: true,  type: 'GET', timeout: 50000});
		},
		strategy: ol.loadingstrategy.all
	});	

	window[callbacknameStatic] = function (response) { staticVectorSource.addFeatures(geojsonFormat.readFeatures(response));};
	
	/* Define vectors */		
	var staticVector = new ol.layer.Vector({
		  source: staticVectorSource,
		  style: aStyle
	});
	
	return staticVector;
}



function createMarkerLayer(lat, lon, text){
	var center = new ol.Feature({
		geometry : new ol.geom.Point(ol.proj.transform([ lon,lat ], 'EPSG:4326', 'EPSG:3857'))
	});
	
	var iconStyle = new ol.style.Style({
		/*
		image : new ol.style.Icon(({
			anchor : [ 0.5, 46 ],
			anchorXUnits : 'fraction',
			anchorYUnits : 'pixels',
			opacity : 0.75,
			src : 'http://maps.google.com/mapfiles/ms/icons/blue.png'
		})),
		*/
		  image: new ol.style.Circle({
	          radius: 10,
	          fill: new ol.style.Fill({color: 'rgba(255, 0, 0, 0.1)'}),
	          stroke: new ol.style.Stroke({color: 'red', width: 1})
	      }),
		
		text : new ol.style.Text({
		    font: '12px Calibri,sans-serif',
		    fill: new ol.style.Fill({
		      color: '#aa3300'
		    }),
		    stroke: new ol.style.Stroke({
		      color: '#fff',
		      width: 3
		    }),
		    text : text,
	        offsetX : 20,
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
	
	return markerLayer;
}

function checkLayerEmpty(layerList){
	var layer;
	var features;
	var count = 0;
	for(var i=0; i < layerList.length;i++ ){
		layer = layerList[i];
		features = layer.getSource().getFeatures();
		
		if(features == null || features.length == 0){
			count = count+1;
		}
	}
	
	if(count >= emptycount){ //More then half empty
		return true;
	}
	return false;
}

function createLegendLayer(map,image){
	var imageExtent = [];
	var mapExtent = map.getView().calculateExtent(map.getSize());
	imageExtent[0] = mapExtent[2]-30000;
	imageExtent[1] = mapExtent[1]+1000;
	imageExtent[2] = mapExtent[2]-4000;
	imageExtent[3] = mapExtent[1]+31000;
	
	var legendLayer = new ol.layer.Image({
	      source: new ol.source.ImageStatic({
	          url: imageUrl+image,
	          crossOrigin: '',
	          projection: 'EPSG:3857',//'EPSG:27700',
	          imageExtent: imageExtent,
	          imageSize: [183, 232] //[2000, 3696]
	        })
	 });
	
	return legendLayer;
}