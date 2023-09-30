package com.demo.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(filterName = "sessionFilter", urlPatterns = "*.do")
public class SessionFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
	        throws IOException, ServletException {
	    HttpServletRequest httpRequest = (HttpServletRequest) request;
	    HttpServletResponse httpResponse = (HttpServletResponse) response;

	    HttpSession session = httpRequest.getSession(false);

	    // 로그 추가
	    System.out.println("Request URI: " + httpRequest.getRequestURI());

	    // 세션에 로그인 정보가 없으면 로그인 페이지로 리다이렉트
	    if (session == null || session.getAttribute("member") == null) {
	        String requestURI = httpRequest.getRequestURI();

	        // /auth/*에 대한 예외 처리
	        if (!requestURI.startsWith(httpRequest.getContextPath() + "/auth/")) {
	            String contextPath = httpRequest.getContextPath();
	            System.out.println("Redirecting to login page");
	            httpResponse.sendRedirect(contextPath + "/auth/login.do");
	            return;
	        }
	    }

	    System.out.println("Processing request");
	    chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}
}
