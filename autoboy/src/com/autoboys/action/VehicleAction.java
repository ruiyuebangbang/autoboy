package com.autoboys.action;

import java.util.List;
import com.autoboys.domain.VehicleBrand;
import com.opensymphony.xwork2.ActionSupport;


public class VehicleAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 3324047803117359078L;
	
	//private HttpServletRequest request;
	
	private List<VehicleBrand> vehicleCategories ;
	private List<String> selCodes;
	
	public List<String> getSelCodes() {
		return selCodes;
	}
	public void setSelCodes(List<String> selCodes) {
		this.selCodes = selCodes;
	}
	
	//public void setServletRequest(HttpServletRequest arg0) {
	//	this.request = arg0;
	//}
	
	
	@Override
	public String execute() throws Exception {
		System.out.println("Action 出来");
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
