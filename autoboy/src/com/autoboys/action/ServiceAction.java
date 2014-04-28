package com.autoboys.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

public class ServiceAction extends ActionSupport implements ServletRequestAware{
	
	private HttpServletRequest request;
	
	public void setServletRequest(HttpServletRequest arg0) {
		this.request = arg0;
	}
	
	@Override
	public String execute() throws Exception {
		System.out.println("Action 出来");
		return SUCCESS;
	}
	
	public String postRequirement() {
		String s = request.getParameter("s");
		return SUCCESS;
	}
	
	/**
	 * 依据商家服务方案，选择服务商家
	 * @return
	 */
	public String chooseService() {
		String s = request.getParameter("s");
		return SUCCESS;
	}
	
}
