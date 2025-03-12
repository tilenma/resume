package com.tilen.resume.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tilen.resume.util.DateUtil;
import jakarta.servlet.http.HttpServletRequest;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = {"/","/home"}, method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest request) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		//Init
		initCommon(locale,model);
		
		return "home";
	}
	
    @GetMapping("/bootstrap-example")
    public String bootstrapExample() {
        return "bootstrap-example";
    }
	
    @GetMapping("/variable")
	public String variable(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		//Init
		initCommon(locale,model);	
		
		Map<String, String> env = System.getenv();
		List<String> valueList = new ArrayList<String>(env.values());
		List<String> keyList = new ArrayList<String>(env.keySet());
		
		
        for (String envName : env.keySet()) {
            System.out.format("%s=%s%n",
                              envName,
                              env.get(envName));
        }
        
        model.addAttribute("keyList", keyList);
        model.addAttribute("valueList", valueList);
		
		return "variable";
	}
	
	private void initCommon(Locale locale, Model model) {
		Date date = new Date();
		String formattedDate = DateUtil.formatDate3(date);
		String formattedDate2 = DateUtil.formatMelbourneTime(date);		
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("serverTime2", formattedDate2 );
		
		Calendar cal = Calendar.getInstance();
		Calendar cal2 = Calendar.getInstance();
		Calendar cal3 = Calendar.getInstance();
		Calendar cal4 = Calendar.getInstance(); //now
		
		//set end date of sunlife
		cal2.set(2022, 3, 24); //
		
		//set start date of nab
		cal3.set(2022, 7, 15);
		
		String now = "";
		try{
			Date startWork = new Date();
			startWork =	DateUtil.parseDate("2007-06-01");			
			cal.setTime(startWork);
			
			now = DateUtil.formatDate5(date);
		}catch(ParseException e){
			e.printStackTrace();
		}
		
		int gapday = DateUtil.daysBetween(cal2.getTime(), cal3.getTime());
		cal4.add(Calendar.DAY_OF_MONTH, -1*gapday); //Now - gap day
		
		int diffYear = DateUtil.yearsBetween(cal.getTime(), cal4.getTime());
		int diffMonth = DateUtil.monthsBetween(cal.getTime(), cal4.getTime());
		int totalDay = DateUtil.daysBetween(cal.getTime(), cal4.getTime());
		
		model.addAttribute("workYear", diffYear );
		model.addAttribute("workMonth", diffMonth );
		model.addAttribute("totalDay", totalDay );
		model.addAttribute("now", now);
		
		//model.addAttribute("message", "My IT Experience: "+diffYear+" years "+ diffMonth+ " months");
		model.addAttribute("message", "My IT Experience: 16+ years");
	}
}
