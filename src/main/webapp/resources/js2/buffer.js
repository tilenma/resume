	var productLayerStore = [];
	var productLayerStore2 = [];
	var locationLayerStore = [];	
	
	function buffer(sequence){
		var bufferLayer = getProductLayer(sequence);			
		addLayerListToMap(bmap, bufferLayer);
	}
	
	function buffer2(sequence){
		var bufferLayer = getProductLayer2(sequence);			
		addLayerListToMap(bmap, bufferLayer);
	}
	
	function initBuffer(sequence){
		var bufferLayer;		
		
		for(var i=sequence+1; i < sequence+bufferSize+1; i++){			
			buffer(i);
		}
	}
	
	function initBuffer2(sequence){
		var bufferLayer;		
		
		for(var i=sequence+1; i < sequence+bufferSize+1; i++){			
			buffer(i);
			buffer2(i);
		}
	}
	
	function getProductLayer(sequence){
		var layer = productLayerStore[sequence];
		
		if(layer == null || layer.length < 10){
			layer = createProductLayerById(runId,productId,sequence);
			productLayerStore[sequence] = layer; //store
		}
		else if(checkLayerEmpty(layer)){
			layer = createProductLayerById(runId,productId,sequence);
			productLayerStore[sequence] = layer; //store
		}
		
		return layer;
	}
	
	function getProductLayer2(sequence){
		var layer = productLayerStore2[sequence];
		
		if(layer == null || layer.length < 10){
			layer = createProductLayerById(runId,productId2,sequence);
			productLayerStore2[sequence] = layer; //store
		}
		else if(checkLayerEmpty(layer)){
			layer = createProductLayerById(runId,productId2,sequence);
			productLayerStore2[sequence] = layer; //store
		}
		
		return layer;
	}

	function getLocationLayer(sequence){
		var layer = locationLayerStore[sequence];
		
		if(layer == null){
			layer = createLocationLayerById(runId, productId, sequence);
			locationLayerStore[sequence] = layer; //store
		}
		
		return layer;			
	}
	
	var airLayerStore = [];
	var groundLayerStore = [];	
	
	function getAirProductLayer(sequence){
		var layer = airLayerStore[sequence];
		
		if(layer == null || layer.length < 10){
			layer = createProductLayerById(runId,productId,sequence);
			airLayerStore[sequence] = layer; //store
		}
		else if(checkLayerEmpty(layer)){
			layer = createProductLayerById(runId,productId,sequence);
			airLayerStore[sequence] = layer; //store
		}
		
		return layer;			
	}
	
	function getGroundProductLayer(sequence){
		var layer = groundLayerStore[sequence];
		
		if(layer == null || layer.length < 10){
			layer = createProductLayerById(runId, productId2, sequence);
			groundLayerStore[sequence] = layer; //store
		}
		else if(checkLayerEmpty(layer)){
			layer = createProductLayerById(runId, productId2, sequence);
			groundLayerStore[sequence] = layer; //store
		}
		
		return layer;			
	}	
	
	function createBufferMap(elementId){
		var map = new ol.Map({
			layers : [ ],
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