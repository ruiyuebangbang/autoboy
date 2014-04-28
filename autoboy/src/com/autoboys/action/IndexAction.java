package com.autoboys.action;


import java.security.MessageDigest;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;
public class IndexAction extends ActionSupport implements ServletRequestAware{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 5751759534484690707L;
	private HttpServletRequest request;
    //实现接口中的方法
    public void setServletRequest(HttpServletRequest request){
     this.request = request;
    }
	@Override
	public String execute() throws Exception {
		
		return SUCCESS;
	}
	
	
	
}
