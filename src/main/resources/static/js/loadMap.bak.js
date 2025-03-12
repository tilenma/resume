// format used to parse WFS GetFeature responses
var wfsUrl = 'http://localhost:8080/geoserver/cite/wfs?service=WFS&request=GetFeature&version=2.0.0&typename=Ccite%3Aproduct_view&srsname=EPSG:3857&outputFormat=text/javascript';

var geojsonFormat = new ol.format.GeoJSON();

$.urlParam = function(name,def){
	var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
	if(results!=null && results[1] !=null){
		return results[1] || 0;
	}
	return def;
}
var filter = $.urlParam('cql_filter','sequence=1');

/**
 * JSONP WFS callback function.
 * @param {Object} response The response object.
 */
window.loadFeatures0 = function(response) {
    vectorSource0.addFeatures(geojsonFormat.readFeatures(response));
};

window.loadFeatures1 = function(response) {
    vectorSource1.addFeatures(geojsonFormat.readFeatures(response));
};

window.loadFeatures2 = function(response) {
    vectorSource2.addFeatures(geojsonFormat.readFeatures(response));
};

window.loadFeatures3 = function(response) {
    vectorSource3.addFeatures(geojsonFormat.readFeatures(response));
};

window.loadFeatures4 = function(response) {
    vectorSource4.addFeatures(geojsonFormat.readFeatures(response));
};

window.loadFeatures5 = function(response) {
    vectorSource5.addFeatures(geojsonFormat.readFeatures(response));
};

window.loadFeatures6 = function(response) {
    vectorSource6.addFeatures(geojsonFormat.readFeatures(response));
};

window.loadFeatures7 = function(response) {
    vectorSource7.addFeatures(geojsonFormat.readFeatures(response));
};

window.loadFeatures8 = function(response) {
    vectorSource8.addFeatures(geojsonFormat.readFeatures(response));
};

window.loadFeatures9 = function(response) {
    vectorSource9.addFeatures(geojsonFormat.readFeatures(response));
};

/* Define colors and styles */
var colors = ['rgba(255, 0, 0, 0.5)','rgba(255, 102, 0, 0.5)','rgba(255, 153, 51, 0.5)','rgba(255, 255, 0, 0.5)'
,'rgba(204, 255, 51, 0.5)','rgba(153, 255, 204, 0.5)','rgba(0, 255, 255, 0.5)','rgba(0, 204, 255, 0.5)'
,'rgba(0, 102, 255, 0.5)','rgba(51, 51, 255, 0.5)'];

var styles = [
	new ol.style.Style({
		fill: new ol.style.Fill({
			color: colors[0]
		})
	})
];

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

/* Define vector source */
var legends = [' and value > 10',' and value > 1 and value <=10',' and value > 0.1 and value <=1',' and value > 0.01 and value <=0.1'
,' and value > 0.001 and value <=0.01',' and value > 0.0001 and value <=0.001',' and value > 0.00001 and value <=0.0001'
,' and value > 0.000001 and value <=0.00001',' and value > 0.0000001 and value <=0.000001',' and value > 0.00000001 and value <=0.0000001'
];

var vectorSource0 = new ol.source.Vector({
	  loader: function(extent, resolution, projection) {
		var url = wfsUrl+'&format_options=callback:loadFeatures0;id_policy:false'+'&cql_filter='+filter+legends[0];
	    $.ajax({url: url, dataType: 'jsonp'});
	  },
	  strategy: ol.loadingstrategy.all
});

var vectorSource1 = new ol.source.Vector({
  loader: function(extent, resolution, projection) {
	var url = wfsUrl+'&format_options=callback:loadFeatures1;id_policy:false'+'&cql_filter='+filter+legends[1];
    $.ajax({url: url, dataType: 'jsonp'});
  },
  strategy: ol.loadingstrategy.all
});

var vectorSource2 = new ol.source.Vector({
  loader: function(extent, resolution, projection) {
	var url = wfsUrl+'&format_options=callback:loadFeatures2;id_policy:false'+'&cql_filter='+filter+legends[2];
    $.ajax({url: url, dataType: 'jsonp'});	
  },
  strategy: ol.loadingstrategy.all
});

var vectorSource3 = new ol.source.Vector({
  loader: function(extent, resolution, projection) {
	var url = wfsUrl+'&format_options=callback:loadFeatures3;id_policy:false'+'&cql_filter='+filter+legends[3];
    $.ajax({url: url, dataType: 'jsonp'});	
  },
  strategy: ol.loadingstrategy.all
});

var vectorSource4 = new ol.source.Vector({
  loader: function(extent, resolution, projection) {
	var url = wfsUrl+'&format_options=callback:loadFeatures4;id_policy:false'+'&cql_filter='+filter+legends[4];
    $.ajax({url: url, dataType: 'jsonp'});	
  },
  strategy: ol.loadingstrategy.all
});

var vectorSource5 = new ol.source.Vector({
  loader: function(extent, resolution, projection) {
	var url = wfsUrl+'&format_options=callback:loadFeatures5;id_policy:false'+'&cql_filter='+filter+legends[5];
    $.ajax({url: url, dataType: 'jsonp'});	
  },
  strategy: ol.loadingstrategy.all
});

var vectorSource6 = new ol.source.Vector({
  loader: function(extent, resolution, projection) {
	var url = wfsUrl+'&format_options=callback:loadFeatures6;id_policy:false'+'&cql_filter='+filter+legends[6];
    $.ajax({url: url, dataType: 'jsonp'});	
  },
  strategy: ol.loadingstrategy.all
});

var vectorSource7 = new ol.source.Vector({
  loader: function(extent, resolution, projection) {
	var url = wfsUrl+'&format_options=callback:loadFeatures7;id_policy:false'+'&cql_filter='+filter+legends[7];
    $.ajax({url: url, dataType: 'jsonp'});	
  },
  strategy: ol.loadingstrategy.all
});

var vectorSource8 = new ol.source.Vector({
  loader: function(extent, resolution, projection) {
	var url = wfsUrl+'&format_options=callback:loadFeatures8;id_policy:false'+'&cql_filter='+filter+legends[8];
    $.ajax({url: url, dataType: 'jsonp'});	
  },
  strategy: ol.loadingstrategy.all
});

var vectorSource9 = new ol.source.Vector({
  loader: function(extent, resolution, projection) {
	var url = wfsUrl+'&format_options=callback:loadFeatures9;id_policy:false'+'&cql_filter='+filter+legends[9];
    $.ajax({url: url, dataType: 'jsonp'});	
  },
  strategy: ol.loadingstrategy.all
});
/* Define vectors */
var vector0 = new ol.layer.Vector({
	  source: vectorSource0,
	  style: styles[0]
});

var vector1 = new ol.layer.Vector({
  source: vectorSource1,
  style: styles[1]
});

var vector2 = new ol.layer.Vector({
  source: vectorSource2,
  style: styles[2]
});

var vector3 = new ol.layer.Vector({
  source: vectorSource3,
  style: styles[3]
});

var vector4 = new ol.layer.Vector({
  source: vectorSource4,
  style: styles[4]
});

var vector5 = new ol.layer.Vector({
  source: vectorSource5,
  style: styles[5]
});

var vector6 = new ol.layer.Vector({
  source: vectorSource6,
  style: styles[6]
});

var vector7 = new ol.layer.Vector({
  source: vectorSource7,
  style: styles[7]
});

var vector8 = new ol.layer.Vector({
  source: vectorSource8,
  style: styles[8]
});

var vector9 = new ol.layer.Vector({
  source: vectorSource9,
  style: styles[9]
});

/* Base layer map */
var raster = new ol.layer.Tile({
  source: new ol.source.BingMaps({
    imagerySet: 'Aerial',
    key: 'Ak-dzM4wZjSqTlzveKz5u0d4IQ4bRzVI309GxmkgSVr1ewS6iPSrOvOKhA-CJlm3'
  })
});

/* Create map */
var map = new ol.Map({
  layers: [raster, vector0],
  target: document.getElementById('map'),
  view: new ol.View({
	center: ol.proj.transform([114.1504093400752, 22.400203230428101], 'EPSG:4326', 'EPSG:3857'),	
    maxZoom: 19,
    zoom: 10
  })
});

/* Add more layers */
map.addLayer(vector1);
map.addLayer(vector2);
map.addLayer(vector3);
map.addLayer(vector4);
map.addLayer(vector5);
map.addLayer(vector6);
map.addLayer(vector7);
map.addLayer(vector8);
map.addLayer(vector9);

/* Display feature info */
var displayFeatureInfo = function(pixel) {
  var features = [];
  map.forEachFeatureAtPixel(pixel, function(feature, layer) {
    features.push(feature);
  });
  if (features.length > 0) {
    var info = [];
    var i, ii;
    for (i = 0, ii = features.length; i < ii; ++i) {
      info.push(features[i].get('value'));
    }
    document.getElementById('info').innerHTML = info.join(', ') || '(unknown)';
    map.getTarget().style.cursor = 'pointer';
  } else {
    document.getElementById('info').innerHTML = '&nbsp;';
    map.getTarget().style.cursor = '';
  }
};

map.on('click', function(evt) {
  displayFeatureInfo(evt.pixel);
});

map.on('pointermove', function(evt) {
  if (evt.dragging) {
    return;
  }
  var pixel = map.getEventPixel(evt.originalEvent);
  displayFeatureInfo(pixel);
});

/* Add marker */
var center = new ol.Feature({
	//geometry: new ol.geom.Point(ol.proj.transform([114.441248065475, 22.5163530327241], 'EPSG:4326', 'EPSG:3857'))	//1
	geometry: new ol.geom.Point(ol.proj.transform([113.988786704369, 22.1406261768215], 'EPSG:4326', 'EPSG:3857'))//10
});

var iconStyle = new ol.style.Style({
    image: new ol.style.Icon(({
      anchor: [0.5, 46],
      anchorXUnits: 'fraction',
      anchorYUnits: 'pixels',
      opacity: 0.75,
      src: 'https://maps.google.com/mapfiles/kml/shapes/schools_maps.png'
   }))
});

center.setStyle(iconStyle);

var markerSource = new ol.source.Vector({
  features: [center]
});

var markerLayer = new ol.layer.Vector({
  source: markerSource
});

map.addLayer(markerLayer);