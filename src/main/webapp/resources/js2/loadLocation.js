/* Function to create product layer */
function createLocationLayerById(runid,productid,sequence){
	
	/* Define vector source */
	var loccallbackname0 = 'loccallback'+productid+'0';
	var vectorSource = new ol.source.Vector({
		loader: function(extent, resolution, projection) {			
			var url = wfsLocationUrl+'&format_options=callback:'+loccallbackname0+';id_policy:false'+'&cql_filter=productid='+productid+' and id=\''+runid+'\' and sequence='+sequence;			
			$.ajax({url: url, dataType: 'jsonp', contentType: "application/json",cache: true,  type: 'GET', timeout: 50000});
		},
		strategy: ol.loadingstrategy.all
	});	
	window[loccallbackname0] = function (response) { 
		var features = geojsonFormat.readFeatures(response);
		vectorSource.addFeatures(features);		
	};

	/* Define style */
	var style = new ol.style.Style({
		  fill: new ol.style.Fill({
		    color: 'rgba(255, 255, 255, 0.6)'
		  }),
		  stroke: new ol.style.Stroke({
		    color: '#319FD3',
		    width: 1
		  }),
		  text: new ol.style.Text({
		    font: '12px Calibri,sans-serif',
		    fill: new ol.style.Fill({
		      color: '#aa3300'
		    }),
		    stroke: new ol.style.Stroke({
		      color: '#fff',
		      width: 3
		    })
		  }),
		  image: new ol.style.Circle({
	          radius: 10,
	          fill: new ol.style.Fill({color: 'rgba(255, 0, 0, 0.1)'}),
	          stroke: new ol.style.Stroke({color: 'red', width: 1})
	      })
		});
	
	var styles = [style];
	
	/* Define vector */
	var vectorLayer = new ol.layer.Vector({
		  source: vectorSource,
		  style: function(feature, resolution) {
		    style.getText().setText(resolution < 5000 ? feature.get('value').toPrecision(3) : '');
		    return styles;
		  }
	});
	
	return vectorLayer;
}

/* Display feature info */
function addLocationInfoEventToMap(map,aLayer,featureField,elementIdForDisplay){
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
		    
		    var location;
		    var outputtext;
		    var outputtext2;
		    var hasLocationFeature;
		    
		    for (i = 0, ii = features.length; i < ii; ++i) {		    	
		    	if(features[i].get('code')!=null){ //location feature
				    location = features[i].get('description')+'('+features[i].get('code')+')';
				    outputtext = 'Value at '+location+ ' is '+features[i].get(featureField).toPrecision(3)+'mSv';
				    hasLocationFeature = true;
				    break;
		    	}
		    	else{
		    		info.push(features[i].get(featureField).toPrecision(3)+'mSv');
		    		outputtext2 = 'Value at (' +roundToThree(lonlat[0]) +','+ roundToThree(lonlat[1]) +') is '+info.join(', ') || '(unknown)';				        		
		    	}
		    }
		    if(hasLocationFeature){
		    	document.getElementById(elementIdForDisplay).innerHTML = outputtext;
		    }
		    else{
		    	document.getElementById(elementIdForDisplay).innerHTML = outputtext2;
		    }
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