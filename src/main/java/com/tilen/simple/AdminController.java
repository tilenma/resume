package com.tilen.simple;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.security.core.userdetails.UserDetails;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@RequestMapping(value = {"/accessDenied"}, method = RequestMethod.POST)
	public String accessDenied(Locale locale, Model model) {
		return "accessDenied";
	}
	
    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String adminPage(Locale locale,Model model) {
    	logger.info("User: " +getPrincipal()+" login successfully.");
    	Thread.currentThread().setPriority(Thread.MAX_PRIORITY);
    	
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
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
        
        return "/admin/admin";
    }    
    
    @RequestMapping(value = "/admin/refresh", method = RequestMethod.POST)
    public String refreshPage(Model model) {    	
    	logger.info("User: " +getPrincipal()+" refresh admin page");
    	Thread.currentThread().setPriority(Thread.MAX_PRIORITY);
    	
        return "redirect:/admin";
    }

    @RequestMapping(value="/login", method = RequestMethod.GET)
    public String loginPage (HttpServletRequest request, HttpServletResponse response) {
       logger.info("Login page is loaded.");
       
       return "/admin/login";
    }
 
    @RequestMapping(value="/logout", method = RequestMethod.GET)
       public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
    	logger.info("User: " +getPrincipal()+" logout.");
    	
         Authentication auth = SecurityContextHolder.getContext().getAuthentication();
         if (auth != null){    
            new SecurityContextLogoutHandler().logout(request, response, auth);
         }
          
          return "redirect:/login?logout";
       }
 
    private String getPrincipal(){
        String userName = null;
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
 
        if (principal instanceof UserDetails) {
            userName = ((UserDetails)principal).getUsername();
        } else {
            userName = principal.toString();
        }
        return userName;
    }

    
}
