package com.tilen.simple;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tilen.util.DateUtil;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AcasController {
	
	private static final Logger logger = LoggerFactory.getLogger(AcasController.class);
	
	@RequestMapping(value = "/gis", method = RequestMethod.GET)
	public String profile1(Locale locale, Model model) {
		logger.info("profile1() start..."); 
				
		this.initCommon(locale, model);
		
		//Set latest runid		
		model.addAttribute("runId", 1 );
		
		model.addAttribute("mindosage1",50);
		model.addAttribute("mindosage2",100);
				
		
		//Product 1 //Sum of ground, cloud and inhalation (committed) dose, effective, normal living
		model.addAttribute("dist112","N/A");
		
		//Product 2 //Sum of ground, cloud and inhalation (committed) dose, effective, open area
		model.addAttribute("dist212","N/A"); //No grid satisfy the criteria
		
		//Product 5 //Inhalation dose, throid, adult, normal living
		model.addAttribute("dist511","35.49"); //No grid satisfy the criteria	
		
		//Product 6 //Inhalation dose, thyroid, for adults (committed), open air[mSv]
		model.addAttribute("dist611","76.62"); //No grid satisfy the criteria
		
		//Product 27 //Inhalation dose, thyroid, for children (committed 70a), normal living[mSv]
		model.addAttribute("dist711","79.69"); //No grid satisfy the criteria

		//Product 28 //Inhalation dose, thyroid, for children (committed 70a), open area[mSv]
		model.addAttribute("dist811","79.69"); //No grid satisfy the criteria

		logger.info("profile1() end.");
		
		return "profile1";
	}
	
	@RequestMapping(value = "/chart", method = RequestMethod.GET)
	public String profile2(Locale locale, Model model) {
		logger.info("profile2() start..."); 
				
		this.initCommon(locale, model);
		
		//Set latest runid		
		model.addAttribute("runId", 1 );

		logger.info("profile2() end.");
		
		return "profile2";
	}
	
	@RequestMapping(value = "/chart/detail", method = RequestMethod.GET)
	public String profile3(Locale locale, Model model) {
		logger.info("profile3() start..."); 
				
		this.initCommon(locale, model);
		
		//Set latest runid		
		model.addAttribute("runId", 1 );

		logger.info("profile3() end.");
		
		return "profile3";
	}
	
	private String getNucleiName(Integer aProductId){
		String name = "";
		switch (aProductId) {
			case 21: name = "Cs-137";
			break;
			case 22: name = "I-131";
			break;
			case 23: name = "Cs-137";
			break;
			case 24: name = "I-131";
			break;
			case 25: name = "Cs-134";
			break;
			case 26: name = "Cs-134";
			break;
		}
		
		return name;			
	}
	
	private void initCommon(Locale locale, Model model){
		logger.info("Welcome map! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		//Set indicator for GNPS
		model.addAttribute("gnpslat", 22.5989);
		model.addAttribute("gnpslon", 114.544);
	}
	
	private String convertToString(BigDecimal aBigDecimal){
		BigDecimal output = aBigDecimal.setScale(2,RoundingMode.HALF_UP);
		
		return output.toString();
	}
	

}