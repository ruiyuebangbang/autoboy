package com.autoboys.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.autoboys.dao.VehicleCategoryDAO;
import com.autoboys.dao.VehicleCategoryDAOImpl;
import com.autoboys.domain.Member;
import com.autoboys.domain.ProviderVehicleBrand;
import com.autoboys.domain.User;
import com.autoboys.domain.VehicleBrand;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class VehicleAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 3324047803117359078L;
	
	//private HttpServletRequest request;
	//private VehicleCategory vehicleCategory = new VehicleCategory();
	private List<VehicleBrand> vehicleCategories ;
	private List<String> selCodes;
	
	public List<String> getSelCodes() {
		return selCodes;
	}
	public void setSelCodes(List<String> selCodes) {
		this.selCodes = selCodes;
	}
	private VehicleCategoryDAO vehicleCategoryDAO = new VehicleCategoryDAOImpl();
	
	//public void setServletRequest(HttpServletRequest arg0) {
	//	this.request = arg0;
	//}
	
	
	@Override
	public String execute() throws Exception {
		System.out.println("Action 出来");
		return SUCCESS;
	}
	/**
	 * 供应商修改能提供维修的汽车品�?
	 * 
	 * @return String
	 * @throws Exception
	 */
	public String providerChangeBrands() throws Exception {
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		Member member = (Member) request.getSession().getAttribute("login_user");
		long providerId = member.getProvid();
		selCodes = vehicleCategoryDAO.listVehicleCodeByProvider(providerId);
		vehicleCategories = vehicleCategoryDAO.getVehicleBrands(); //vehicleCategoryDAO.listVehicleByProvider(pid);
		
		//request.setAttribute("vehicleCategories", vehicleCategories); 
		//System.out.println("list.size:"+vehicleCategories.size());
		return SUCCESS;
	}
	
	/**
	 * 选择车型
	 * @return
	 * @throws Exception
	 */
	public String chooseVehicle() throws Exception {
		
		return SUCCESS;
	}
	public List<VehicleBrand> getVehicleCategories() {
		return vehicleCategories;
	}
	public void setVehicleCategories(List<VehicleBrand> vehicleCategories) {
		this.vehicleCategories = vehicleCategories;
	}
	

	
}
