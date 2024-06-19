package com.spring.listener;

import java.util.Date;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;


@WebListener
public class LoginSessionListener implements HttpSessionListener {

    public void sessionCreated(HttpSessionEvent se)  { 
        System.out.println("Session create at : "+new Date());
    }

	
    public void sessionDestroyed(HttpSessionEvent se)  { 
         System.out.println("Session destroyed at : "+new Date());
         se.getSession().getServletContext().removeAttribute("loginUser");
    }
	
}
