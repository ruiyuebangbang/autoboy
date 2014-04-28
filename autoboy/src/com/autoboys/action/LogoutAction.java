package com.autoboys.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.autoboys.dao.*;
import com.autoboys.domain.Member;

public class LogoutAction extends ActionSupport implements ServletResponseAware, ServletRequestAware,SessionAware{
	
	
	String returnURL;
	
	public String getReturnURL() {
		return returnURL;
	}

	public void setReturnURL(String returnURL) {
		this.returnURL = returnURL;
	}

	/**
	 * 
	 */

	private MemberDAO memberDAO = new MemberDAOImpl();
	private Member member = new Member();
	private HttpServletRequest request;
	private HttpServletResponse response;
	private Map<String, Object> session;
    //实现接口中的方法
    public void setServletRequest(HttpServletRequest request){
     this.request = request;
    }
    public void setServletResponse(HttpServletResponse response){
        this.response = response;
       }
    @Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	
	@Override
	public String execute() throws Exception {
		if(request.getSession().getAttribute("login_user") != null) request.getSession().setAttribute("login_user",null);
		printWriteText("success logout");
		return null;
	}
	
	private void printWriteText(String html){
		
		response.setCharacterEncoding("utf-8");
		PrintWriter pw = null;
		try {
			pw = response.getWriter();
			pw.write(html);
		} catch (IOException e) {
			// log.error(e.getMessage(),e.fillInStackTrace());
		}
		pw.flush();
		pw.close();
	}

}
