package com.autoboys.action.provider;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.autoboys.dao.ProviderServiceDAO;
import com.autoboys.dao.ProviderServiceDAOImpl;
import com.autoboys.dao.ServiceCatDAO;
import com.autoboys.dao.ServiceCatDAOImpl;
import com.autoboys.dao.ServiceDAO;
import com.autoboys.dao.ServiceDAOImpl;
import com.autoboys.domain.Member;
import com.autoboys.domain.ProviderService;
import com.autoboys.domain.Service;
import com.autoboys.domain.ServiceCat;
import com.opensymphony.xwork2.ActionSupport;

public class ServiceAction extends ActionSupport implements ServletRequestAware{
	
	private static final long serialVersionUID = -7934678560516553269L;

	private static Logger log = Logger.getLogger(ServiceAction.class);
	private HttpServletRequest request;
	private ServiceCatDAO serviceCatDAO = new ServiceCatDAOImpl();
	private ProviderServiceDAO psDAO = new ProviderServiceDAOImpl();
	private List<ServiceCat> serviceCats ;
	private List<ProviderService> providerServiceList;
	
	public void setServletRequest(HttpServletRequest arg0) {
		this.request = arg0;
	}
	
	@Override
	public String execute() throws Exception {
		return SUCCESS;
	}
	
	/**
	 * 商家配置服务项目
	 * @return
	 */
	public String serviceConfig() {
		serviceCats = serviceCatDAO.listServiceCat();
		Member member = (Member) request.getSession().getAttribute("login_user");
		long providerId = member.getProvid();
		setProviderServiceList(psDAO.listProviderService(providerId));
		return SUCCESS;
	}
	
	public List<ServiceCat> getServiceCats(){
		return serviceCats;
	}
	
	public void setServiceCats(List<ServiceCat> serviceCats){
		this.serviceCats = serviceCats;
	}

	public List<ProviderService> getProviderServiceList() {
		return providerServiceList;
	}

	public void setProviderServiceList(List<ProviderService> providerServiceList) {
		this.providerServiceList = providerServiceList;
	}
	
}
