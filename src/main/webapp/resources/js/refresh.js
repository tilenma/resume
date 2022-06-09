function getLatestRun(){
	//common.jsp
	//currentRunId, wsUrl
	
	$.getJSON(wsUrl, function(json){
		//console.log( "currentRunId: " + currentRunId +" and JSON Data: " + json.id );		
		if(currentRunId != json.id){
			console.log( "Refreshing...");
			location.reload(true);
		}
		else{
			console.log( "getLatestRun() checked.");
		}
	});	
}

setInterval(getLatestRun, refreshInterval);

