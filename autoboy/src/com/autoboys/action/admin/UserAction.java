package com.autoboys.action.admin;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.autoboys.dao.*;
import com.autoboys.domain.*;

public class UserAction extends ActionSupport {

	private static final long serialVersionUID = -6659925652584240539L;

	private Member member ;
	private List<Member> memberList ;
	private MemberDAO memberDAO = new MemberDAOImpl();
		
	private int typeId;
	private Pager pager;
	private String keyword;
	
	
	public int getTypeId() {
		return typeId;
	}

	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}

	public Pager getPager() {
		return pager;
	}

	public void setPager(Pager pager) {
		this.pager = pager;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	/**
	 * To save or update user.
	 * @return String
	 */
	public String saveOrUpdate()
	{	
		memberDAO.saveOrUpdateMember(member);
		return SUCCESS;
	}
	
	/**
	 * To list all users.
	 * @return String
	 */
	public String list()
	{
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		//Integer typeId = Integer.valueOf(request.getParameter("typeId").toString());
		
		
		if(pager == null) {
			pager = new Pager();
		}
		pager.setTotal(memberDAO.qryMemberByKeywordCnt(typeId,keyword));
		memberList = memberDAO.qryMemberByKeywordList(typeId,keyword,pager.getPageCurr(),pager.getPageSize());
		
		return SUCCESS;
	}
	
	public String editPassword()
	{
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		if (!request.getMethod().equals("POST")) {
			return "editForm";
		}
		
		Member member = (Member) request.getSession().getAttribute("login_user");
		long id = member.getId();
		member.setId(id);
		memberDAO.modifyPassword(member);
		return SUCCESS;
	}
	
	/**
	 * To delete a user.
	 * @return String
	 */
	public String delete()
	{
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		memberDAO.deleteMember(Long.parseLong(request.getParameter("id")));
		
		return SUCCESS;
	}
	
	/**
	 * To list a single user by Id.
	 * @return String
	 */
	public String edit()
	{
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		member = memberDAO.queryMemberById(Long.parseLong(request.getParameter("id")));
		
		//request.getSession().getAttribute("xxx");
		Member member = (Member) request.getSession().getAttribute("login_user");
		long providerId = member.getProvid();
		memberList = memberDAO.listMemberByPro(providerId);
		return SUCCESS;
	}

	
	
	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public List<Member> getMemberList() {
		return memberList;
	}

	public void setMemberList(List<Member> memberList) {
		this.memberList = memberList;
	}
	

	public String disableUser() throws Exception {
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		
		String 	id = request.getParameter("pid");
		String  stat = request.getParameter("stat");
		
		memberDAO.disableUser(Long.parseLong(id), Integer.parseInt(stat));
		
		return SUCCESS;
	}
}
