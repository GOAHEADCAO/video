package com.ef.video.listener;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;


public class SessionListener implements HttpSessionListener{

	private int  userNumber,allNumber;
	@Override
	public void sessionCreated(HttpSessionEvent se) {
	userNumber++;
	allNumber++;
	System.out.println("SessionListener sessionCreated userNumber"+userNumber+"总人次："+allNumber);
	se.getSession().getServletContext().setAttribute("userNumber", userNumber);
	se.getSession().getServletContext().setAttribute("allNumber", allNumber);

	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
	userNumber--;
	System.out.println("SessionListener sessionDestroyed userNumber" +userNumber);
	se.getSession().getServletContext().setAttribute("userNumber", userNumber);
	}

}
