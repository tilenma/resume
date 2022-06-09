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
		    }),
		    offsetY : 10
		  }),
		  image: new ol.style.Circle({
	          radius: 3,
	          fill: new ol.style.Fill({color: 'rgba(255, 0, 0, 0.1)'}),
	          stroke: new ol.style.Stroke({color: 'black', width: 1})
	      })
		});
	
	var styles = [style];
	
	/* Define vector */
	var vectorLayer = new ol.layer.Vector({
		  source: vectorSource,
		  style: function(feature, resolution) {
		    style.getText().setText(resolution < 5000 ? (feature.get('value')*1000).toPrecision(3) : '');
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
				    outputtext = 'Value at '+location+ ' is '+(features[i].get(featureField)*1000).toPrecision(3)+'µSv';
				    hasLocationFeature = true;
				    break;
		    	}
		    	else{
		    		info.push((features[i].get(featureField)*1000).toPrecision(3)+'µSv');
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

function addLocationInfoEventToMapWithUnit(map,aLayer,featureField,elementIdForDisplay,unit){
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
				    outputtext = 'Value at '+location+ ' is '+(features[i].get(featureField)*1000).toPrecision(3)+unit;
				    hasLocationFeature = true;
				    break;
		    	}
		    	else{
		    		info.push((features[i].get(featureField)*1000).toPrecision(3)+unit);
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

function createMCLayer(){
	var yl = new ol.Feature({
		geometry : new ol.geom.Point(ol.proj.transform([ 114.0216, 22.44154 ], 'EPSG:4326', 'EPSG:3857'))
	});
	
	var fl = new ol.Feature({
		geometry : new ol.geom.Point(ol.proj.transform([ 114.1359, 22.49509 ], 'EPSG:4326', 'EPSG:3857'))
	});
	
	var tp = new ol.Feature({
		geometry : new ol.geom.Point(ol.proj.transform([ 114.1635, 22.4556 ], 'EPSG:4326', 'EPSG:3857'))
	});
	
	var sk = new ol.Feature({
		geometry : new ol.geom.Point(ol.proj.transform([ 114.275, 22.38365 ], 'EPSG:4326', 'EPSG:3857'))
	});
	
	var stj = new ol.Feature({
		geometry : new ol.geom.Point(ol.proj.transform([ 114.1934, 22.38367 ], 'EPSG:4326', 'EPSG:3857'))
	});
	
	var tws = new ol.Feature({
		geometry : new ol.geom.Point(ol.proj.transform([ 114.1925, 22.30502 ], 'EPSG:4326', 'EPSG:3857'))
	});	
	
	var cw = new ol.Feature({
		geometry : new ol.geom.Point(ol.proj.transform([ 114.2496, 22.26354 ], 'EPSG:4326', 'EPSG:3857'))
	});	
	
	var pyk = new ol.Feature({
		geometry : new ol.geom.Point(ol.proj.transform([ 114.1656, 22.24569 ], 'EPSG:4326', 'EPSG:3857'))
	});	
	
	var kt = new ol.Feature({
		geometry : new ol.geom.Point(ol.proj.transform([ 114.23, 22.31101 ], 'EPSG:4326', 'EPSG:3857'))
	});	
	
	var tc = new ol.Feature({
		geometry : new ol.geom.Point(ol.proj.transform([ 113.9384, 22.28898 ], 'EPSG:4326', 'EPSG:3857'))
	});	
	
	var lck = new ol.Feature({
		geometry : new ol.geom.Point(ol.proj.transform([ 114.1372, 22.3402 ], 'EPSG:4326', 'EPSG:3857'))
	});	
	
	var ssp = new ol.Feature({
		geometry : new ol.geom.Point(ol.proj.transform([ 114.1558, 22.33177 ], 'EPSG:4326', 'EPSG:3857'))
	});	
	
	var tstkp = new ol.Feature({
		geometry : new ol.geom.Point(ol.proj.transform([ 114.1705, 22.30276 ], 'EPSG:4326', 'EPSG:3857'))
	});	
	
	var mh = new ol.Feature({
		geometry : new ol.geom.Point(ol.proj.transform([ 114.1787, 22.27635 ], 'EPSG:4326', 'EPSG:3857'))
	});	
	
	//var mcColor = '#CD9543';
	var mcColor = '#800080';
	var mcColor2 = '#DDA0DD';
	
	var image = new ol.style.RegularShape({
	      fill: new ol.style.Fill({color: mcColor2}),
	      stroke: new ol.style.Stroke({color: 'black', width: 1}),
	      points: 4,
	      radius: 8,
	      //rotation: Math.PI / 4,
	      angle: Math.PI / 4
	    });
		
	var ylStyle = new ol.style.Style({
		  image: image,		
		text : new ol.style.Text({
		    font: '14px Calibri,sans-serif',
		    fill: new ol.style.Fill({
		      color: mcColor
		    }),
		    stroke: new ol.style.Stroke({
		      color: '#fff',
		      width: 3
		    }),
		    text : 'Yuen Long',
	        offsetX : 0,
	        offsetY : 15
		})
	});
	
	var flStyle = new ol.style.Style({
		  image: image,		
		text : new ol.style.Text({
		    font: '14px Calibri,sans-serif',
		    fill: new ol.style.Fill({
		      color: mcColor
		    }),
		    stroke: new ol.style.Stroke({
		      color: '#fff',
		      width: 3
		    }),
		    text : 'Fanling',
	        offsetX : 0,
	        offsetY : 15
		})
	});
	
	var tpStyle = new ol.style.Style({
		  image: image,		
		text : new ol.style.Text({
		    font: '14px Calibri,sans-serif',
		    fill: new ol.style.Fill({
		      color: mcColor
		    }),
		    stroke: new ol.style.Stroke({
		      color: '#fff',
		      width: 3
		    }),
		    text : 'Tai Po',
	        offsetX : 0,
	        offsetY : 15
		})
	});
	
	var skStyle = new ol.style.Style({
		  image: image,		
		text : new ol.style.Text({
		    font: '14px Calibri,sans-serif',
		    fill: new ol.style.Fill({
		      color: mcColor
		    }),
		    stroke: new ol.style.Stroke({
		      color: '#fff',
		      width: 3
		    }),
		    text : 'Sai Kung',
	        offsetX : 0,
	        offsetY : 15
		})
	});
	
	var stjStyle = new ol.style.Style({
		  image: image,		
		text : new ol.style.Text({
		    font: '14px Calibri,sans-serif',
		    fill: new ol.style.Fill({
		      color: mcColor
		    }),
		    stroke: new ol.style.Stroke({
		      color: '#fff',
		      width: 3
		    }),
		    text : 'Shatin Jockey Club',
	        offsetX : 0,
	        offsetY : 15
		})
	});
	
	var twsStyle = new ol.style.Style({
		  image: image,		
		text : new ol.style.Text({
		    font: '14px Calibri,sans-serif',
		    fill: new ol.style.Fill({
		      color: mcColor
		    }),
		    stroke: new ol.style.Stroke({
		      color: '#fff',
		      width: 3
		    }),
		    text : 'Tai Wan Shan',
	        offsetX : 0,
	        offsetY : 15
		})
	});
	
	var cwStyle = new ol.style.Style({
		  image: image,		
		text : new ol.style.Text({
		    font: '14px Calibri,sans-serif',
		    fill: new ol.style.Fill({
		      color: mcColor
		    }),
		    stroke: new ol.style.Stroke({
		      color: '#fff',
		      width: 3
		    }),
		    text : 'Chai Wan',
	        offsetX : 0,
	        offsetY : 15
		})
	});
	
	var pykStyle = new ol.style.Style({
		  image: image,		
		text : new ol.style.Text({
		    font: '14px Calibri,sans-serif',
		    fill: new ol.style.Fill({
		      color: mcColor
		    }),
		    stroke: new ol.style.Stroke({
		      color: '#fff',
		      width: 3
		    }),
		    text : 'Pao Yue Kong',
	        offsetX : 0,
	        offsetY : 15
		})
	});
	
	var ktStyle = new ol.style.Style({
		  image: image,		
		text : new ol.style.Text({
		    font: '14px Calibri,sans-serif',
		    fill: new ol.style.Fill({
		      color: mcColor
		    }),
		    stroke: new ol.style.Stroke({
		      color: '#fff',
		      width: 3
		    }),
		    text : 'Kwun Tong',
	        offsetX : 0,
	        offsetY : 15
		})
	});
	
	var tcStyle = new ol.style.Style({
		  image: image,		
		text : new ol.style.Text({
		    font: '14px Calibri,sans-serif',
		    fill: new ol.style.Fill({
		      color: mcColor
		    }),
		    stroke: new ol.style.Stroke({
		      color: '#fff',
		      width: 3
		    }),
		    text : 'Tung Chung',
	        offsetX : 0,
	        offsetY : 15
		})
	});
	
	var lckStyle = new ol.style.Style({
		  image: image,		
		text : new ol.style.Text({
		    font: '14px Calibri,sans-serif',
		    fill: new ol.style.Fill({
		      color: mcColor
		    }),
		    stroke: new ol.style.Stroke({
		      color: '#fff',
		      width: 3
		    }),
		    text : 'Lai Chi Kok Park',
	        offsetX : 0,
	        offsetY : 15
		})
	});
	
	var sspStyle = new ol.style.Style({
		  image: image,		
		text : new ol.style.Text({
		    font: '14px Calibri,sans-serif',
		    fill: new ol.style.Fill({
		      color: mcColor
		    }),
		    stroke: new ol.style.Stroke({
		      color: '#fff',
		      width: 3
		    }),
		    text : 'Sham Shui Po',
	        offsetX : 0,
	        offsetY : 15
		})
	});	
	
	var tstkpStyle = new ol.style.Style({
		  image: image,		
		text : new ol.style.Text({
		    font: '14px Calibri,sans-serif',
		    fill: new ol.style.Fill({
		      color: mcColor
		    }),
		    stroke: new ol.style.Stroke({
		      color: '#fff',
		      width: 3
		    }),
		    text : 'Kowloon Park',
	        offsetX : 0,
	        offsetY : 15
		})
	});
	
	var mhStyle = new ol.style.Style({
		  image: image,		
		text : new ol.style.Text({
		    font: '14px Calibri,sans-serif',
		    fill: new ol.style.Fill({
		      color: mcColor
		    }),
		    stroke: new ol.style.Stroke({
		      color: '#fff',
		      width: 3
		    }),
		    text : 'Morrison Hill',
	        offsetX : 0,
	        offsetY : 15
		})
	});		
		
	
	yl.setStyle(ylStyle);
	fl.setStyle(flStyle);
	tp.setStyle(tpStyle);
	sk.setStyle(skStyle);
	stj.setStyle(stjStyle);
	tws.setStyle(twsStyle);
	cw.setStyle(cwStyle);
	pyk.setStyle(pykStyle);
	kt.setStyle(ktStyle);
	tc.setStyle(tcStyle);
	lck.setStyle(lckStyle);
	ssp.setStyle(sspStyle);
	tstkp.setStyle(tstkpStyle);
	mh.setStyle(mhStyle);	
	
	var mcSource = new ol.source.Vector({
		features : [ yl,fl,tp,sk,stj,tws,cw,pyk,kt,tc,lck,ssp,tstkp,mh ]
	});
	
	var mcLayer = new ol.layer.Vector({
		source : mcSource
	});
	
	return mcLayer;
}

function createNPPLayer(){
	var gnps = new ol.Feature({
		geometry : new ol.geom.Point(ol.proj.transform([ 114.544, 22.5989 ], 'EPSG:4326', 'EPSG:3857'))
	});
	
	var lnps = new ol.Feature({
		geometry : new ol.geom.Point(ol.proj.transform([ 114.55, 22.6058 ], 'EPSG:4326', 'EPSG:3857'))
	});
	
	var tnps = new ol.Feature({
		geometry : new ol.geom.Point(ol.proj.transform([ 112.978, 21.913 ], 'EPSG:4326', 'EPSG:3857'))
	});
	
	var ynps = new ol.Feature({
		geometry : new ol.geom.Point(ol.proj.transform([ 112.259, 21.708 ], 'EPSG:4326', 'EPSG:3857'))
	});
	
	var image = new ol.style.RegularShape({
	      fill: new ol.style.Fill({color: 'pink'}),
	      stroke: new ol.style.Stroke({color: 'black', width: 1}),
	      points: 3,
	      radius: 6,
	      //rotation: Math.PI / 4,
	      angle: 0
	    });
	
	var image2 = new ol.style.Icon(({
		anchor: [0.5, 0.5],
	    anchorXUnits: 'fraction',
	    anchorYUnits: 'fraction',
	    opacity: 0.7,
	    src: 'resources/image/npp.png',
	    scale: 0.1
	    
	}));
	
	var gnpsStyle = new ol.style.Style({
		  image: image2,		
		text : new ol.style.Text({
		    font: '14px Calibri,sans-serif',
		    fill: new ol.style.Fill({
		      color: '#aa3300'
		    }),
		    stroke: new ol.style.Stroke({
		      color: '#fff',
		      width: 3
		    }),
		    text : 'GNPS',
	        offsetX : 20,
	        offsetY : 5
		})
	});
	
	var lnpsStyle = new ol.style.Style({
		  image: image2,		
		text : new ol.style.Text({
		    font: '14px Calibri,sans-serif',
		    fill: new ol.style.Fill({
		      color: '#aa3300'
		    }),
		    stroke: new ol.style.Stroke({
		      color: '#fff',
		      width: 3
		    }),
		    text : 'LNPS',
	        offsetX : 20,
	        offsetY : 0
		})
	});
	
	var tnpsStyle = new ol.style.Style({
		  image: image2,		
		text : new ol.style.Text({
		    font: '14px Calibri,sans-serif',
		    fill: new ol.style.Fill({
		      color: '#aa3300'
		    }),
		    stroke: new ol.style.Stroke({
		      color: '#fff',
		      width: 3
		    }),
		    text : 'TNPS',
	        offsetX : 20,
	        offsetY : 0
		})
	});
	
	var ynpsStyle = new ol.style.Style({
		  image: image2,		
		text : new ol.style.Text({
		    font: '14px Calibri,sans-serif',
		    fill: new ol.style.Fill({
		      color: '#aa3300'
		    }),
		    stroke: new ol.style.Stroke({
		      color: '#fff',
		      width: 3
		    }),
		    text : 'YNPS',
	        offsetX : 20,
	        offsetY : 0
		})
	});
	
	gnps.setStyle(gnpsStyle);
	lnps.setStyle(lnpsStyle);
	tnps.setStyle(tnpsStyle);
	ynps.setStyle(ynpsStyle);
	
	var nppSource = new ol.source.Vector({
		features : [ gnps,lnps,tnps,ynps ]
	});
	
	var nppLayer = new ol.layer.Vector({
		source : nppSource
	});
	
	return nppLayer;
}



function createRMNLayer(){
	var pc = new ol.Feature({
		geometry : new ol.geom.Point(ol.proj.transform([ 114.4283, 22.5467 ], 'EPSG:4326', 'EPSG:3857'))
	});
	
	var tm = new ol.Feature({
		geometry : new ol.geom.Point(ol.proj.transform([ 114.3607, 22.47129 ], 'EPSG:4326', 'EPSG:3857'))
	});
	
	var ko = new ol.Feature({
		geometry : new ol.geom.Point(ol.proj.transform([ 114.3019, 22.53636 ], 'EPSG:4326', 'EPSG:3857'))
	});
	
	var ynf = new ol.Feature({
		geometry : new ol.geom.Point(ol.proj.transform([ 114.3361, 22.37947 ], 'EPSG:4326', 'EPSG:3857'))
	});
	
	var stk = new ol.Feature({
		geometry : new ol.geom.Point(ol.proj.transform([ 114.2087, 22.53903 ], 'EPSG:4326', 'EPSG:3857'))
	});
	
	var tmt = new ol.Feature({
		geometry : new ol.geom.Point(ol.proj.transform([ 114.2375, 22.47532 ], 'EPSG:4326', 'EPSG:3857'))
	});
	
	var kt = new ol.Feature({
		geometry : new ol.geom.Point(ol.proj.transform([ 114.2289, 22.311 ], 'EPSG:4326', 'EPSG:3857'))
	});
	
	var swh = new ol.Feature({
		geometry : new ol.geom.Point(ol.proj.transform([ 114.2259, 22.28567 ], 'EPSG:4326', 'EPSG:3857'))
	});
	
	var kp = new ol.Feature({
		geometry : new ol.geom.Point(ol.proj.transform([ 114.17, 22.31308 ], 'EPSG:4326', 'EPSG:3857'))
	});
	
	var cd = new ol.Feature({
		geometry : new ol.geom.Point(ol.proj.transform([ 114.2579, 22.20971 ], 'EPSG:4326', 'EPSG:3857'))
	});
	
	var tbt = new ol.Feature({
		geometry : new ol.geom.Point(ol.proj.transform([ 114.0076, 22.48753 ], 'EPSG:4326', 'EPSG:3857'))
	});
	
	var clk = new ol.Feature({
		geometry : new ol.geom.Point(ol.proj.transform([ 113.9012, 22.29608 ], 'EPSG:4326', 'EPSG:3857'))
	});
	
	var image = new ol.style.RegularShape({
	      fill: new ol.style.Fill({color: 'pink'}),
	      stroke: new ol.style.Stroke({color: 'black', width: 1}),
	      points: 3,
	      radius: 6,
	      //rotation: Math.PI / 4,
	      angle: 0
	    });
	
	var pcStyle = new ol.style.Style({
		  image: image,		
		text : new ol.style.Text({
		    font: '14px Calibri,sans-serif',
		    fill: new ol.style.Fill({
		      color: '#aa3300'
		    }),
		    stroke: new ol.style.Stroke({
		      color: '#fff',
		      width: 3
		    }),
		    text : 'Ping Chau',
	        offsetX : 0,
	        offsetY : 10
		})
	});
	
	var tmStyle = new ol.style.Style({
		  image: image,		
		text : new ol.style.Text({
		    font: '14px Calibri,sans-serif',
		    fill: new ol.style.Fill({
		      color: '#aa3300'
		    }),
		    stroke: new ol.style.Stroke({
		      color: '#fff',
		      width: 3
		    }),
		    text : 'Tap Mun',
	        offsetX : 0,
	        offsetY : 10
		})
	});
	
	var koStyle = new ol.style.Style({
		  image: image,		
		text : new ol.style.Text({
		    font: '14px Calibri,sans-serif',
		    fill: new ol.style.Fill({
		      color: '#aa3300'
		    }),
		    stroke: new ol.style.Stroke({
		      color: '#fff',
		      width: 3
		    }),
		    text : 'Kat O',
	        offsetX : 0,
	        offsetY : 10
		})
	});
	
	var ynfStyle = new ol.style.Style({
		  image: image,		
		text : new ol.style.Text({
		    font: '14px Calibri,sans-serif',
		    fill: new ol.style.Fill({
		      color: '#aa3300'
		    }),
		    stroke: new ol.style.Stroke({
		      color: '#fff',
		      width: 3
		    }),
		    text : 'Yuen Ng Fan',
	        offsetX : 0,
	        offsetY : 10
		})
	});
	
	var stkStyle = new ol.style.Style({
		  image: image,		
		text : new ol.style.Text({
		    font: '14px Calibri,sans-serif',
		    fill: new ol.style.Fill({
		      color: '#aa3300'
		    }),
		    stroke: new ol.style.Stroke({
		      color: '#fff',
		      width: 3
		    }),
		    text : 'Sha Tau Kok',
	        offsetX : 0,
	        offsetY : 10
		})
	});
	
	var tmtStyle = new ol.style.Style({
		  image: image,		
		text : new ol.style.Text({
		    font: '14px Calibri,sans-serif',
		    fill: new ol.style.Fill({
		      color: '#aa3300'
		    }),
		    stroke: new ol.style.Stroke({
		      color: '#fff',
		      width: 3
		    }),
		    text : 'Tai Mei Tuk',
	        offsetX : 0,
	        offsetY : 10
		})
	});
	
	var ktStyle = new ol.style.Style({
		  image: image,		
		text : new ol.style.Text({
		    font: '14px Calibri,sans-serif',
		    fill: new ol.style.Fill({
		      color: '#aa3300'
		    }),
		    stroke: new ol.style.Stroke({
		      color: '#fff',
		      width: 3
		    }),
		    text : 'Kwun Tong',
	        offsetX : 0,
	        offsetY : 10
		})
	});
	
	var swhStyle = new ol.style.Style({
		  image: image,		
		text : new ol.style.Text({
		    font: '14px Calibri,sans-serif',
		    fill: new ol.style.Fill({
		      color: '#aa3300'
		    }),
		    stroke: new ol.style.Stroke({
		      color: '#fff',
		      width: 3
		    }),
		    text : 'Sai Wan Ho',
	        offsetX : 0,
	        offsetY : 10
		})
	});
	
	var kpStyle = new ol.style.Style({
		  image: image,		
		text : new ol.style.Text({
		    font: '14px Calibri,sans-serif',
		    fill: new ol.style.Fill({
		      color: '#aa3300'
		    }),
		    stroke: new ol.style.Stroke({
		      color: '#fff',
		      width: 3
		    }),
		    text : 'King\'s Park',
	        offsetX : 0,
	        offsetY : 10
		})
	});
	
	var cdStyle = new ol.style.Style({
		  image: image,		
		text : new ol.style.Text({
		    font: '14px Calibri,sans-serif',
		    fill: new ol.style.Fill({
		      color: '#aa3300'
		    }),
		    stroke: new ol.style.Stroke({
		      color: '#fff',
		      width: 3
		    }),
		    text : 'Cape D\' Aguilar',
	        offsetX : 0,
	        offsetY : 10
		})
	});
	
	var tbtStyle = new ol.style.Style({
		  image: image,		
		text : new ol.style.Text({
		    font: '14px Calibri,sans-serif',
		    fill: new ol.style.Fill({
		      color: '#aa3300'
		    }),
		    stroke: new ol.style.Stroke({
		      color: '#fff',
		      width: 3
		    }),
		    text : 'Tsim Bei Tsui',
	        offsetX : 0,
	        offsetY : 10
		})
	});
	
	var clkStyle = new ol.style.Style({
		  image: image,		
		text : new ol.style.Text({
		    font: '14px Calibri,sans-serif',
		    fill: new ol.style.Fill({
		      color: '#aa3300'
		    }),
		    stroke: new ol.style.Stroke({
		      color: '#fff',
		      width: 3
		    }),
		    text : 'Chek Lap Kok',
	        offsetX : 0,
	        offsetY : 10
		})
	});
			
	pc.setStyle(pcStyle);
	tm.setStyle(tmStyle);
	ko.setStyle(koStyle);
	ynf.setStyle(ynfStyle);
	stk.setStyle(stkStyle);
	tmt.setStyle(tmtStyle);
	kt.setStyle(ktStyle);
	swh.setStyle(swhStyle);
	kp.setStyle(kpStyle);
	cd.setStyle(cdStyle);
	tbt.setStyle(tbtStyle);
	clk.setStyle(clkStyle);
	
	var rmnSource = new ol.source.Vector({
		features : [ pc, tm, ko, ynf, stk, tmt, kt, swh, kp, cd, tbt, clk ]
	});
	
	var rmnLayer = new ol.layer.Vector({
		source : rmnSource
	});
	
	return rmnLayer;
}