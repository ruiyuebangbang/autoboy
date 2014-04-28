package com.autoboys.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.autoboys.dao.MemberDAO;
import com.autoboys.dao.MemberDAOImpl;
import com.autoboys.domain.Member;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.autoboys.util.StringUtil;

public class MemberAction extends ActionSupport implements ServletRequestAware,
		ServletResponseAware, ModelDriven<Member> {

	private static final long serialVersionUID = 6431502492933210365L;

	private HttpServletResponse response;
	private HttpServletRequest request;
	private MemberDAO memberDAO = new MemberDAOImpl();
	private Member member = new Member();

	public Member getModel() {
		return member;
	}

	public void setServletResponse(HttpServletResponse arg0) {
		this.response = arg0;
	}

	public void setServletRequest(HttpServletRequest arg0) {
		this.request = arg0;
	}

	@Override
	public String execute() throws Exception {
		return SUCCESS;

	}

	/**
	 * 检查nick name是否存在.
	 * 
	 * @return String
	 */
	public String validateNickName() throws Exception {
		String nickName = "" + request.getParameter("itemvalue");
		String message;
		if (existNickName(member.getNickName())) {
			message = "var data = {\"msg\":\"该昵称已经存在,请选择其他昵称！\",\"success\":false}";				
		}
		else{
			message = "var data = {\"retval\":\"\",\"success\":true}";
		}
		printMessage(message);
		return null;
	}

	/**
	 * 注册
	 * 
	 * @return String
	 */
	public String doRegister() throws Exception {
		String message;
		try {
			// 检测手机合法性
			if (!validateMobilePhone(member.getMobilePhone())) {
				message = "var data = {\"errorMap\":{},\"success\":false,\"msg\":\"手机号码格式不正确！\"}";
				printMessage(message);
				return null;
			}else {
				Member member2 = memberDAO.queryMemberByMobilePhone(member.getMobilePhone());
				if(member2 != null) {
					message = "var data = {\"errorMap\":{\"mobilePhone\":\"该手机号已注册，<a href='login.action'>立即登录</a>\"},\"success\":false}";
					printMessage(message);
					return null;
				}
			}
			
			// 检测昵称合法性
			if (existNickName(member.getNickName())) {
				message = "var data = {\"errorMap\":{\"password\":\"昵称已经存在，请用其他昵称！\"},\"success\":true}";
				printMessage(message);
				return null;
			}
			
			
			// 检测密码合法性
			message = checkPassword(member.getPassword());
			if (!message.equals("ok")) {
				message = "var data = {\"errorMap\":{\"password\":\""
						+ message + "\"},\"success\":false}";
				printMessage(message);
				return null;

			}
			memberDAO.saveOrUpdateMember(member);
			message = "var data = {\"errorMap\":{\"password\":\"注册成功！\"},\"success\":true}";
			
			
		} catch (Exception e) {
			message = "var data = {\"errorMap\":{\"password\":\" 出现未知错误! \"},\"success\":false}";
		}
		printMessage(message);
		return null;
	}
	
	public String changePassword() {
		request.setAttribute("subMenuName", "修改密码");
		String method = request.getMethod();
		if(method.equals("POST")){
			boolean bRet = false;
			String currpwd = request.getParameter("currpwd");
			String newpwd = request.getParameter("newpwd");
			String renewpwd = request.getParameter("renewpwd");
			if(newpwd==null) {
				addFieldError("newpwd", "密码为空");
				bRet=true;
			}
			if(renewpwd==null) {
				addFieldError("renewpwd", "确认密码为空");
				bRet=true;
			}
			if(!newpwd.equals(renewpwd)) {
				addFieldError("newpwd", "两次密码不一致");
				bRet=true;
			}
			Member mb =  (Member) request.getSession().getAttribute("login_user");
			mb.setPassword(currpwd);
			if(!memberDAO.checkUserPasswordMatch(mb)) {
				addFieldError("currpwd", "密码不正确");
				bRet=true;
			}
			
			if(bRet) {
				return INPUT;
			} else {
				mb.setPassword(newpwd);
				memberDAO.modifyPassword(mb);
				return SUCCESS; 
			}
		}else{
			
			return INPUT;
		}
		
	}
	
	public String updateAvatar(String avatarPath) {
		String avatar = (String)request.getAttribute("imgPath");
		member =  (Member) request.getSession().getAttribute("login_user");
		member.setAvatar(avatarPath);
		memberDAO.updateAvatar(member);
		return SUCCESS;
	}
	
	public String edit()
	{
		String method = request.getMethod();
		request.setAttribute("subMenuName", "个人信息");
		if(method.equals("POST")){
			return SUCCESS; 
		}else{
			member =  (Member) request.getSession().getAttribute("login_user");
			return INPUT;
		}
		
	}

	private void printMessage(String message) {
		response.setCharacterEncoding("utf-8");
		PrintWriter pw = null;
		try {
			pw = response.getWriter();
			pw.write(message);
		} catch (IOException e) {
			// log.error(e.getMessage(),e.fillInStackTrace());
		}
		pw.flush();
		pw.close();

	}

	/**
	 * 
	 * @param mobilePhone
	 * @return String
	 */
	private boolean existNickName(String nickName) {
		
		Member member = memberDAO.queryByNickName(nickName);
		if (member == null)
			return false;
		else
			return true;
		
	}

	private String checkPassword(String password) {
		String message;
		if (password.length() == 0) {
			message = "太懒了吧，登录密码也没输入^_^";
		} else if (!password.equals(member.getRepassword())) {
			message = "喔哦,两次密码不一致哦！";
		} else if (password.length() < 6 || password.length() > 16) {
			message = "登录密码长度为6—16位!";
		} else {
			message = "ok";
		}
		return message;

	}

	/**
	 * 检查手机号
	 * 
	 * @return boolean
	 */
	private boolean validateMobilePhone(String mobilePhone) {
		return StringUtil.validateMobilePhone(mobilePhone);
	}
	
	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}
}
