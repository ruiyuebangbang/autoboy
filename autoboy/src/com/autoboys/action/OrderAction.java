package com.autoboys.action;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.log4j.*;

public class OrderAction extends ActionSupport implements ServletRequestAware{
	
	private static Logger logger = Logger.getLogger(OrderAction.class); 
	private HttpServletRequest request;
    //实现接口中的方法
    public void setServletRequest(HttpServletRequest request){
     this.request = request;
    }
    
	@Override
	public String execute() throws Exception {
		String status = request.getParameter("status");
		logger.info("order status is " + status);
		return SUCCESS;
	}

	public String orderQuery() throws Exception {
		String status = request.getParameter("status");
		logger.info("order status is " + status);
		return SUCCESS;
	}
	
}
