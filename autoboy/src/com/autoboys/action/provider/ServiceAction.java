package com.autoboys.action.provider;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.autoboys.dao.ProviderBrandDAO;
import com.autoboys.dao.ProviderBrandDAOImpl;
import com.autoboys.dao.ProviderServiceDAO;
import com.autoboys.dao.ProviderServiceDAOImpl;
import com.autoboys.dao.ServiceCatDAO;
import com.autoboys.dao.ServiceCatDAOImpl;
import com.autoboys.dao.ServiceDAO;
import com.autoboys.dao.ServiceDAOImpl;
import com.autoboys.dao.VehicleBrandDAO;
import com.autoboys.dao.VehicleBrandDAOImpl;
import com.autoboys.domain.Member;
import com.autoboys.domain.ProviderBrand;
import com.autoboys.domain.ProviderService;
import com.autoboys.domain.Service;
import com.autoboys.domain.ServiceCat;
import com.autoboys.domain.VehicleBrand;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ServiceAction extends ActionSupport implements ServletRequestAware {

	private static final long serialVersionUID = -7934678560516553269L;

	private static Logger log = Logger.getLogger(ServiceAction.class);
	private HttpServletRequest request;
	private ServiceCatDAO serviceCatDAO = new ServiceCatDAOImpl();
	private ProviderServiceDAO psDAO = new ProviderServiceDAOImpl();
	private ProviderBrandDAO providerBrandDAO = new ProviderBrandDAOImpl();
	private VehicleBrandDAO vehicleBrandDAO = new VehicleBrandDAOImpl();
	private List<ServiceCat> serviceCats;
	private List<ProviderService> providerServiceList;
	private List<ProviderBrand> providerBrandList;
	private List<VehicleBrand> brandList;
	// 服务商提供服务的汽车品牌代码List
	private List<String> pbCodeList;
	// 服务商提供的服务代码List
	private List<String> providerServices = new ArrayList<String>();

	public void setServletRequest(HttpServletRequest arg0) {
		this.request = arg0;
	}

	@Override
	public String execute() throws Exception {
		return SUCCESS;
	}

	/**
	 * 商家配置服务项目
	 * 
	 * @return
	 */
	public String serviceConfig() {
		if (request.getMethod().equals("POST")) {
			if (providerServices != null) {
				Member member = (Member) request.getSession().getAttribute(
						"login_user");
				Long providerId = member.getProvid();
				psDAO.update(providerId, providerServices);
			}			
			return SUCCESS;
		} else {
			serviceCats = serviceCatDAO.listServiceCat();
			Member member = (Member) request.getSession().getAttribute(
					"login_user");
			long providerId = member.getProvid();
			List<ProviderService> list = psDAO.listProviderService(providerId);
			if (list != null) {
				for (ProviderService ps : list) {
					providerServices.add(ps.getServiceCode());
				}
			}
			return "init";
		}
		
	}

	/**
	 * 商家修改提供维修的汽车品牌
	 * 
	 * @return String
	 * @throws Exception
	 */
	public String providerChangeBrands() throws Exception {

		if (request.getMethod().equals("POST")) {
			if (pbCodeList != null) {
				Member member = (Member) request.getSession().getAttribute(
						"login_user");
				Long providerId = member.getProvid();
				providerBrandDAO.insert(providerId, pbCodeList);
			}
			return SUCCESS;
		} else {
			Member member = (Member) request.getSession().getAttribute(
					"login_user");
			long providerId = member.getProvid();
			// selCodes =
			// vehicleCategoryDAO.listVehicleCodeByProvider(providerId);
			// vehicleCategories = vehicleCategoryDAO.getVehicleBrands();
			// //vehicleCategoryDAO.listVehicleByProvider(pid);
			brandList = vehicleBrandDAO.listVehicleBrand();
			pbCodeList = providerBrandDAO.listProviderBrandCode(providerId);
			return "init";
		}

	}

	public List<ServiceCat> getServiceCats() {
		return serviceCats;
	}

	public void setServiceCats(List<ServiceCat> serviceCats) {
		this.serviceCats = serviceCats;
	}

	public List<ProviderService> getProviderServiceList() {
		return providerServiceList;
	}

	public void setProviderServiceList(List<ProviderService> providerServiceList) {
		this.providerServiceList = providerServiceList;
	}

	public List<ProviderBrand> getProviderBrandList() {
		return providerBrandList;
	}

	public void setProviderBrandList(List<ProviderBrand> providerBrandList) {
		this.providerBrandList = providerBrandList;
	}

	public List<VehicleBrand> getBrandList() {
		return brandList;
	}

	public void setBrandList(List<VehicleBrand> brandList) {
		this.brandList = brandList;
	}

	public List<String> getPbCodeList() {
		return pbCodeList;
	}

	public void setPbCodeList(List<String> pbCodeList) {
		this.pbCodeList = pbCodeList;
	}

	public List<String> getProviderServices() {
		return providerServices;
	}

	public void setProviderServices(List<String> providerServices) {
		this.providerServices = providerServices;
	}

}
