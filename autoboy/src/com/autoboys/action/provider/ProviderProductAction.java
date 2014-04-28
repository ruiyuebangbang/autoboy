package com.autoboys.action.provider;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.autoboys.dao.*;
import com.autoboys.domain.*;

public class ProviderProductAction extends ActionSupport implements ModelDriven<ProviderProduct> {


	private static final long serialVersionUID = -3284905946989835666L;
	
	private ProviderProduct providerProduct ; //该实体标注选择的条件
	
	private List<ProviderProduct> providerProductList ;
	private Pager pager ;//保存分页信息
	public Pager getPager() {
		return pager;
	}
	public void setPager(Pager pager) {
		this.pager = pager;
	}

	private List<Product> products;//产品列表
	
	private List<ServiceCat> cats;//服务类别
	private List<Service> sevs;   //服务
	private List<ProductBrand> brands;//品牌
	private List<String> distinctprds;//产品名
	
	private String selCategory;
	
	public String getSelCategory() {
		return selCategory;
	}

	public void setSelCategory(String selCategory) {
		this.selCategory = selCategory;
	}

	public List<ServiceCat> getCats() {
		return cats;
	}

	public void setCats(List<ServiceCat> cats) {
		this.cats = cats;
	}

	public List<Service> getSevs() {
		return sevs;
	}

	public void setSevs(List<Service> sevs) {
		this.sevs = sevs;
	}

	public List<ProductBrand> getBrands() {
		return brands;
	}

	public void setBrands(List<ProductBrand> brands) {
		this.brands = brands;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	public List<String> getDistinctprds() {
		return distinctprds;
	}

	public void setDistinctprds(List<String> distinctprds) {
		this.distinctprds = distinctprds;
	}

	private ProviderProductDAO providerProductDAO = new ProviderProductDAOImpl();
	private ServiceCatDAO serviceCatDAO = new ServiceCatDAOImpl();
	private ServiceDAO serviceDAO = new ServiceDAOImpl();
	private ProductBrandDAOImpl productBrandDAO = new ProductBrandDAOImpl();
	
	public ProviderProduct getModel() {
		return providerProduct;
	}
	
	/**
	 * To list all providerProducts.
	 * @return String
	 */
	public String listProviderProduct()
	{
		HttpServletRequest request = ServletActionContext.getRequest();
		//if("POST".equals(request.getMethod().toUpperCase())) {
			//
		//}
		//providerProductList = providerProductDAO.listProviderProduct();
		cats = serviceCatDAO.listServiceCat();
		if(selCategory != null && !selCategory.equals("")) {
			sevs = serviceDAO.listServiceByCatId(selCategory);
		} else {
			sevs = serviceDAO.listService();
		}
		if (providerProduct!=null && providerProduct.getService_id() != null && !providerProduct.getService_id().equals("")) {
			brands = productBrandDAO.listBrandsByservice(providerProduct.getService_id());
		} else {
			brands = productBrandDAO.listBrands();
		}
		
		distinctprds = providerProductDAO.listDistinctProduct();
		
		if(pager == null) {
			pager = new Pager();
		}
		if(providerProduct == null) {
			providerProduct = new ProviderProduct();
		}
		pager.setTotal(providerProductDAO.qryProductsCount(providerProduct));
		providerProductList = providerProductDAO.qryProductsList(providerProduct, pager.getPageCurr(), pager.getPageSize());
		
		return SUCCESS;
	}
	

	/**
	 * To delete a providerProduct.
	 * @return String
	 */
	public String delete()
	{
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		providerProductDAO.deleteProviderProduct(Long.parseLong(request.getParameter("id")));
		return SUCCESS;
	}
	
	/**
	 * To list a single providerProduct by Id.
	 * @return String
	 */
	public String edit()
	{
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		providerProduct = providerProductDAO.listProviderProductById(Long.parseLong(request.getParameter("id")));
		return SUCCESS;
	}
	
	public ProviderProduct getProviderProduct() {
		return providerProduct;
	}

	public void setProviderProduct(ProviderProduct providerProduct) {
		this.providerProduct = providerProduct;
	}

	public List<ProviderProduct> getProviderProductList() {
		return providerProductList;
	}

	public void setProviderProductList(List<ProviderProduct> providerProductList) {
		this.providerProductList = providerProductList;
	}

}
