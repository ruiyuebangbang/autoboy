package com.autoboys.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

public class RegisterAction extends ActionSupport implements ServletRequestAware{
	private HttpServletRequest request;
    //实现接口中的方法
    public void setServletRequest(HttpServletRequest request){
     this.request = request;
    }
	
	@Override
	public String execute() throws Exception {
		String method = request.getMethod();
		if(! method.equals("POST"))	{
			return SUCCESS;
		}else{
			return "create";
		}
	}
	
}
