package com.autoboys.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.opensymphony.xwork2.ActionSupport;

public class CheckMemberAction extends ActionSupport implements ServletResponseAware{
	
	private HttpServletResponse response; 
    
    public void setServletResponse(HttpServletResponse arg0) {  
        this.response=arg0;  
          
    }  
    
	@Override
	public String execute() throws Exception {
		
		return SUCCESS;
	}
	
	public String checkNickName() throws Exception{  
		  
        response.setCharacterEncoding("utf-8");  
        PrintWriter pw=null;  
        try {  
            pw = response.getWriter();  
            pw.write("var data = {\"msg\":\"该昵称已经存在!\",\"success\":false}");  
        } catch (IOException e) {  
            //log.error(e.getMessage(),e.fillInStackTrace());  
        }  
          
        pw.flush();  
        pw.close();  
        return null;  
    }  
	
}

