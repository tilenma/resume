var drawSource = new ol.source.Vector();

var drawVector = new ol.layer.Vector({
  source: drawSource,
  style: new ol.style.Style({
    fill: new ol.style.Fill({
      color: 'rgba(255, 255, 255, 0.2)'
    }),
    stroke: new ol.style.Stroke({
      color: '#ff66b2',
      width: 2
    }),
    image: new ol.style.Circle({
      radius: 7,
      fill: new ol.style.Fill({
        color: '#ff66b2'
      })
    })
  })
});

var sourceProj='EPSG:3857';

/**
 * Currently drawn feature.
 * @type {ol.Feature}
 */
var sketch;


/**
 * The help tooltip element.
 * @type {Element}
 */
var helpTooltipElement;


/**
 * Overlay to show the help messages.
 * @type {ol.Overlay}
 */
var helpTooltip;


/**
 * The measure tooltip element.
 * @type {Element}
 */
var measureTooltipElement;


/**
 * Overlay to show the measurement.
 * @type {ol.Overlay}
 */
var measureTooltip;


/**
 * Message to show when the user is drawing a polygon.
 * @type {string}
 */
var continuePolygonMsg = 'Click to continue drawing the polygon';


/**
 * Message to show when the user is drawing a line.
 * @type {string}
 */
var continueLineMsg = 'Click to continue drawing the line';
var endLineMsg = 'Click to finish drawing'


/**
 * Handle pointer move.
 * @param {ol.MapBrowserEvent} evt
 */
var pointerMoveHandler = function(evt) {
  if (evt.dragging) {
    return;
  }
  /** @type {string} */
  var helpMsg = 'Distance Tool: Click to start';
  /** @type {ol.Coordinate|undefined} */
  var tooltipCoord = evt.coordinate;

  if (sketch) {
    var output;
    var geom = (sketch.getGeometry());
    if (geom instanceof ol.geom.Polygon) {
      output = formatArea(/** @type {ol.geom.Polygon} */ (geom));
      helpMsg = continuePolygonMsg;
      tooltipCoord = geom.getInteriorPoint().getCoordinates();
    } else if (geom instanceof ol.geom.LineString) {
      output = formatLength( /** @type {ol.geom.LineString} */ (geom));
      helpMsg = endLineMsg;
      tooltipCoord = geom.getLastCoordinate();
    }
    measureTooltipElement.innerHTML = output;
    measureTooltip.setPosition(tooltipCoord);
  }

  helpTooltipElement.innerHTML = helpMsg;
  helpTooltip.setPosition(evt.coordinate);
};

var wgs84Sphere = new ol.Sphere(6370986);  //PostgreSQL 6370986 //Default 6378137

var draw; // global so we can remove it later

//var typeSelect = document.getElementById('type');
//var geodesicCheckbox = document.getElementById('geodesic');
var geodesicCheckbox = true;

function addInteraction(map) {
  //var type = (typeSelect.value == 'area' ? 'Polygon' : 'LineString');
   var type = 'LineString';
  draw = new ol.interaction.Draw({
    source: drawSource,
    type: /** @type {ol.geom.GeometryType} */ (type),
    maxPoints: 2,
    style: new ol.style.Style({
      fill: new ol.style.Fill({
        color: 'rgba(255, 255, 255, 0.2)'
      }),
      stroke: new ol.style.Stroke({
        color: 'rgba(0, 0, 0, 0.5)',
        lineDash: [10, 10],
        width: 2
      }),
      image: new ol.style.Circle({
        radius: 5,
        stroke: new ol.style.Stroke({
          color: 'rgba(0, 0, 0, 0.7)'
        }),
        fill: new ol.style.Fill({
          color: 'rgba(255, 255, 255, 0.2)'
        })
      })
    })
  });
  map.addInteraction(draw);

  createMeasureTooltip(map);
  createHelpTooltip(map);

  draw.on('drawstart',
      function(evt) {
        // set sketch
        sketch = evt.feature;
      }, this);

  draw.on('drawend',
      function(evt) {
        measureTooltipElement.className = 'tooltip tooltip-static';
        measureTooltip.setOffset([0, -7]);
        // unset sketch
        sketch = null;
        // unset tooltip so that a new one can be created
        measureTooltipElement = null;
        createMeasureTooltip(map);
      }, this);
}


/**
 * Creates a new help tooltip
 */
function createHelpTooltip(map) {
  if (helpTooltipElement) {
    helpTooltipElement.parentNode.removeChild(helpTooltipElement);
  }
  helpTooltipElement = document.createElement('div');
  helpTooltipElement.className = 'tooltip';
  helpTooltip = new ol.Overlay({
	 id: 'helpTooltip',
    element: helpTooltipElement,
    offset: [15, 0],
    positioning: 'center-left'
  });
  map.addOverlay(helpTooltip);
}


/**
 * Creates a new measure tooltip
 */
function createMeasureTooltip(map) {
  if (measureTooltipElement) {
    measureTooltipElement.parentNode.removeChild(measureTooltipElement);
  }
  measureTooltipElement = document.createElement('div');
  measureTooltipElement.className = 'tooltip tooltip-measure';
  measureTooltip = new ol.Overlay({
	  id: 'measureTooltip',
    element: measureTooltipElement,
    offset: [0, -15],
    positioning: 'bottom-center'
  });
  map.addOverlay(measureTooltip);
}


/**
 * format length output
 * @param {ol.geom.LineString} line
 * @return {string}
 */
var formatLength = function(line) {
  var length;
  if (geodesicCheckbox) {
    var coordinates = line.getCoordinates();
    length = 0;
    for (var i = 0, ii = coordinates.length - 1; i < ii; ++i) {
      var c1 = ol.proj.transform(coordinates[i], sourceProj, 'EPSG:4326');
      var c2 = ol.proj.transform(coordinates[i + 1], sourceProj, 'EPSG:4326');
      length += wgs84Sphere.haversineDistance(c1, c2);
      //length += wgs84Sphere.equirectangularDistance(c1, c2);
      //length += c1.distanceTo(c2);
    }
  } else {
    length = Math.round(line.getLength() * 100) / 100;
  }
  var output;
  if (length > 100) {
    output = (Math.round(length / 1000 * 100) / 100) +
        ' ' + 'km';
  } else {
    output = (Math.round(length * 100) / 100) +
        ' ' + 'm';
  }
  return output;
};


/**
 * format length output
 * @param {ol.geom.Polygon} polygon
 * @return {string}
 */
var formatArea = function(polygon) {
  var area;
  if (geodesicCheckbox) {
    var geom = /** @type {ol.geom.Polygon} */(polygon.clone().transform(
        sourceProj, 'EPSG:4326'));
    var coordinates = geom.getLinearRing(0).getCoordinates();
    area = Math.abs(wgs84Sphere.geodesicArea(coordinates));
  } else {
    area = polygon.getArea();
  }
  var output;
  if (area > 10000) {
    output = (Math.round(area / 1000000 * 100) / 100) +
        ' ' + 'km<sup>2</sup>';
  } else {
    output = (Math.round(area * 100) / 100) +
        ' ' + 'm<sup>2</sup>';
  }
  return output;
};



function addDistanceMeasure(map){	
	addInteraction(map);
	map.on('pointermove', pointerMoveHandler);
	map.addLayer(drawVector);
}

function removeDistanceMeasure(map){
	drawSource.clear();
	map.removeInteraction(draw);
	map.removeEventListener('pointermove', pointerMoveHandler);
	
	map.getOverlays().clear();
	map.removeLayer(drawVector);	
}

function createMeasureControl(map){
	var button = document.createElement('button');
	var measureEnabled = false;
	
	button.innerHTML = 'D'; //D for distance
	
	var handleMeasureToggle = function(e) {	
		if(!measureEnabled){
			addDistanceMeasure(map);
			measureEnabled = true;
		}
		else{
			removeDistanceMeasure(map);
			measureEnabled = false;			
		}
	};
	
	button.addEventListener('click', handleMeasureToggle, true);
	
	var element = document.createElement('div');
	element.className = 'rotate-north ol-unselectable ol-control';
	element.appendChild(button);
	
	var measureControl = new ol.control.Control({
	    element: element
	});
	
	//map.addControl(measureControl);
	return measureControl;
}


function createCircleLayer(map, lat, lon) {
	var circleLayerList;
	//GNPS
	if(isGNPS){
		//Create circle vectors from static image
		var circleVector1 = createStaticLayer('10_30km_circle', circleStyle);
		var circleVector2 = createStaticLayer('30_50km_circle', circleStyle);
		var circleVector3 = createStaticLayer('50_70km_circle', circleStyle);
		var circleVector4 = createStaticLayer('70_90km_circle', circleStyle);
		
		circleLayerList = new Array(4);
		circleLayerList[0] = circleVector1;
		circleLayerList[1] = circleVector2;
		circleLayerList[2] = circleVector3;
		circleLayerList[3] = circleVector4;
	}
	else{
		//Create circle vectors from drawing circles 
		circleLayerList = new Array(1);
		circleLayerList[0] = createCircleLayerByDraw(map, lat, lon, 9);
	}
	
	return circleLayerList;
}

function createCircleLayerByDraw(map, lat, lon, number) {
    var view = map.getView();
    var projection = view.getProjection();
    var resolutionAtEquator = view.getResolution();
    //var center = map.getView().getCenter();
    var center = ol.proj.transform([ lon, lat ], 'EPSG:4326', 'EPSG:3857');
    var pointResolution = projection.getPointResolution(resolutionAtEquator, center);
    var resolutionFactor = resolutionAtEquator/pointResolution;
    
    //alert(resolutionFactor);

    // Source and vector layer
    var vectorSource = new ol.source.Vector({
        projection: 'EPSG:4326'
    });
    
    for(i=0; i< number ; i++){		        	
    	var radius = ((10000*(i+1)) / ol.proj.METERS_PER_UNIT.m) * resolutionFactor;
    	
    	
        var circle = new ol.geom.Circle(center, radius);
        var circleFeature = new ol.Feature(circle);
        
    	var circleStyle = new ol.style.Style({
            stroke: new ol.style.Stroke({
                color: 'grey',
                width: 1
              })
  		});
    	
    	circleFeature.setStyle(circleStyle);
    	vectorSource.addFeature(circleFeature);		 
    }       
    
    var circleLayer = new ol.layer.Vector({
        source: vectorSource
    });
	
    return circleLayer;
}

/* method provided by Wendy */
function createCircleLayerByDraw2(map, lat, lon) {
    // Source and vector layer
    var vectorSource = new ol.source.Vector({
        projection: 'EPSG:4326'
    });
    
    var center = ol.proj.transform([ lon, lat ], 'EPSG:4326', 'EPSG:3857');
    var r = 6378137;
    
    var lat2 = lat - 90/(Math.PI * r);
    var lat3 = lat + 90/(Math.PI * r);
    var lonlat1 = ol.proj.transform([ lon,  lat2], 'EPSG:4326', 'EPSG:3857');
    var lonlat2 = ol.proj.transform([ lon,  lat3], 'EPSG:4326', 'EPSG:3857');
    
    var coef = lonlat2[1]-lonlat1[1];    
    var radius2 = 80000 * coef;  // in metres
    
    alert(radius2);
    
    var circle = new ol.geom.Circle(center, radius2);
    var circleFeature = new ol.Feature(circle);
    
	var circleStyle = new ol.style.Style({
        stroke: new ol.style.Stroke({
            color: 'red',
            width: 1
          })
		});
	circleFeature.setStyle(circleStyle);
	vectorSource.addFeature(circleFeature);		
	
    var circleLayer = new ol.layer.Vector({
        source: vectorSource
    });
	
	return circleLayer;
}
