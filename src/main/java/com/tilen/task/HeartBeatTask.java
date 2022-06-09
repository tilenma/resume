package com.tilen.task;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

public class HeartBeatTask implements Runnable {

	@Autowired
	private ServletContext context;

	private String serverHost;
	private String serverPort;
	
	private static final Logger logger = LoggerFactory.getLogger(HeartBeatTask.class);

	@Override
	public void run() {
		logger.debug("HeartBeatTask is triggered...");
		
		if(serverHost != null && !serverHost.isEmpty()){
			StringBuffer sb = new StringBuffer();
			sb.append("http://");
			sb.append(serverHost);
			
			//with port
			if(serverPort != null && !serverPort.isEmpty()){
				sb.append(":");
				sb.append(serverPort);
			}
			sb.append(context.getContextPath());
			this.readURL(sb.toString());
		}
	}

	public void setServerHost(String serverHost) {
		this.serverHost = serverHost;
	}

	public void setServerPort(String serverPort) {
		this.serverPort = serverPort;
	}

	private void readURL(String url) {
		try {
			logger.info("HeartBeatTask: connecting to "+url);
			URL myUrl = new URL(url);
			URLConnection conn = myUrl.openConnection();
			conn.connect();
			InputStreamReader in = new InputStreamReader(conn.getInputStream());
			BufferedReader buff = new BufferedReader(in);
			//get first line only for ping
			String line = buff.readLine();
			in.close();
			
			logger.info("HeartBeatTask: complete firstline="+line);
			
		} catch (MalformedURLException e) {
			// new URL() failed
			logger.error("HeartBeatTask failed with url="+url,e);
		} catch (IOException e) {
			// openConnection() failed
			logger.error("HeartBeatTask failed 2 with url="+url,e);
		}
	}
}
