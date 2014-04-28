package com.autoboys.util;

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

/**
 * Servlet Filter implementation class AuthFilter
 */
@WebFilter("/AuthFilter")
public class AuthFilter implements Filter {
	String loginUrl = null;
	String userLoginUrl = null;
    /**
     * Default constructor. 
     */
    public AuthFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest httpReq=(HttpServletRequest)request;  
        HttpServletResponse httpRes=(HttpServletResponse)response;  
        String retUrl = httpReq.getRequestURI();
        //retUrl = retUrl.substring(retUrl.indexOf('/',1));
        /**modify by Kevin 没登陆访问个人中心跳转到会员登录页面 **/
        if(retUrl.indexOf("/member/") >=0){
        	loginUrl = userLoginUrl;
        }
        if (retUrl.indexOf("login.action")>0||retUrl.indexOf("register.action")>0) {
        	 chain.doFilter(request, response);  
        } else {
	        HttpSession session=httpReq.getSession();
	        com.autoboys.domain.Member mb = (com.autoboys.domain.Member) session.getAttribute("login_user");
	        if( mb ==null){  
	            httpRes.sendRedirect(httpReq.getContextPath()+loginUrl + "?returnURL=" + retUrl);
	        	//httpReq.getRequestDispatcher("../"+loginUrl).forward(request,response);
	        }else{  
	        	chain.doFilter(request, response);  
	        }  
        }
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
		loginUrl = fConfig.getInitParameter("loginUrl");
		userLoginUrl = fConfig.getInitParameter("userLoginUrl");
	}

}
