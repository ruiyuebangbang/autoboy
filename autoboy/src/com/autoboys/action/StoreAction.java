package com.autoboys.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.autoboys.dao.*;
import com.autoboys.domain.*;

public class StoreAction extends ActionSupport implements ModelDriven<Provider> {

	private ProviderDAO pdao = new ProviderDAOImpl();
	private VehicleBrandDAO vbdao = new VehicleBrandDAOImpl();
	
	private Provider provider; //服务商信息
	private List<VehicleBrand> brands; //对应品牌
	
	
	
	public List<VehicleBrand> getBrands() {
		return brands;
	}

	public void setBrands(List<VehicleBrand> brands) {
		this.brands = brands;
	}

	public Provider getProvider() {
		return provider;
	}

	public void setProvider(Provider provider) {
		this.provider = provider;
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 2427437062687643199L;
	
	@Override
	public String execute() throws Exception {
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		
		String providerId = request.getParameter("providerId");
		//provider = pdao.listProviderById(Long.parseLong(providerId));
		//brands = vbdao.listBrandByProduct(Long.parseLong(providerId));
		
		return SUCCESS;
	}

	@Override
	public Provider getModel() {
		// TODO Auto-generated method stub
		return null;
	}
	
	public String queryProvider() {
		return SUCCESS;
	}
	
}
