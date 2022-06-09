package com.tilen.simple;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tilen.task.HeartBeatTask;
import com.tilen.util.DateUtil;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Resource
	private HeartBeatTask heartBeatTask;
	
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
	
	@RequestMapping(value = {"/skill"}, method = RequestMethod.GET)
	public String skill(Locale locale, Model model, HttpServletRequest request) {
		logger.info("Welcome to skill! The client locale is {}.", locale);
		
		//Init
		initCommon(locale,model);	
		
		return "skill";
	}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = {"/project"}, method = RequestMethod.GET)
	public String project(Locale locale, Model model, HttpServletRequest request) {
		logger.info("Welcome to my project! The client locale is {}.", locale);
		
		//Init
		initCommon(locale,model);	
		
		return "project";
	}
	
	@RequestMapping(value = {"/work"}, method = RequestMethod.GET)
	public String work(Locale locale, Model model, HttpServletRequest request) {
		logger.info("Welcome to my work! The client locale is {}.", locale);
		
		//Init
		initCommon(locale,model);	
		
		return "work";
	}
	
	@RequestMapping(value = {"/acas"}, method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("acas() start...");
		
		//Init
		initCommon(locale,model);	
		
		//Set runid		
		model.addAttribute("runId", 777 );
		model.addAttribute("project", "S3" );
		model.addAttribute("description", "LSMC+EMERSIM");
		
		return "acas";
	}
	
	
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
		
		String now = "";
		try{
			Date startWork = new Date();
			startWork =	DateUtil.parseDate("2007-06-01");			
			cal.setTime(startWork);
			
			Date startProject =	DateUtil.parseDate("2016-12-12");			
			cal3.setTime(startProject);
			
			now = DateUtil.formatDate5(date);
		}catch(ParseException e){
			e.printStackTrace();
		}
		int diffYear = DateUtil.yearsBetween(cal.getTime(), cal2.getTime());
		int diffMonth = DateUtil.monthsBetween(cal.getTime(), cal2.getTime()) - diffYear * 12;
		int totalDay = DateUtil.daysBetween(cal.getTime(), cal2.getTime());
		
		model.addAttribute("workYear", diffYear );
		model.addAttribute("workMonth", diffMonth );
		model.addAttribute("totalDay", totalDay );
		
		diffMonth = DateUtil.monthsBetween(cal3.getTime(), cal2.getTime());
		model.addAttribute("projectMonth", diffMonth );
		
		model.addAttribute("now", now);
	}
}
