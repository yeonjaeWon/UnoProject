package com.spring.filter;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class LoginCheckFilter implements Filter {
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException{
		HttpServletRequest httpReq = (HttpServletRequest) request;
		
		String url = httpReq.getRequestURI().replace(httpReq.getContextPath(), "");
		System.out.println("url:"+url);
		if(url.indexOf("/resources")==0) {
			chain.doFilter(request, response);
			return;
		}
		
		HttpSession session = httpReq.getSession();
		String loginUser = (String)session.getServletContext().getContext("/").getAttribute("loginUser");
		
		//String id = httpReq.getParameter("loginUser");
		
		if(loginUser!=null) {
			session.setAttribute("loginUser", loginUser);
			chain.doFilter(request, response);
		}else {
			session.invalidate();
			
			String retUrl = httpReq.getRequestURI();
			
			String queryString = httpReq.getQueryString();
			if (queryString != null) {
				retUrl="?"+ queryString;
			}
			System.out.println(retUrl);
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('권한이 없습니다.');");
			out.println("window.parent.location.href='/loginForm.do?retUrl="+retUrl+"';");
			out.println("</script>");
		}
		
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
