package com.autoboys.action;

import java.io.BufferedReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.autoboys.util.*;
import com.autoboys.dao.*;
import com.autoboys.domain.*;

public class AjaxAction extends ActionSupport implements ServletRequestAware,ServletResponseAware,SessionAware {
	/**
	 * 
	 */
	private static final long serialVersionUID = 781068284193885361L;
	
	private HttpServletResponse response;
	private HttpServletRequest request;
	private Map<String, Object> session;
	private List<VehicleBrand> brandList = new ArrayList<VehicleBrand>();
	private List<VehicleSeries> seriesList = new ArrayList<VehicleSeries>();
	private List<VehicleEmission> emissionList = new ArrayList<VehicleEmission>();
	private List<VehicleYear> yearList = new ArrayList<VehicleYear>();
	private List<Vehicle> vehicleList = new ArrayList<Vehicle>();
	private VehicleBrandDAO vehicleBrandDAO = new VehicleBrandDAOImpl();
	private VehicleSeriesDAO vehicleSeriesDAO = new VehicleSeriesDAOImpl();
	private VehicleDAO vehicleDAO = new VehicleDAOImpl();
	private ProviderRegionDAO prdao = new ProviderRegionDAO();
	private ProviderProductDAO ppdao = new ProviderProductDAOImpl();	
	private ServiceDAO serviceDAO = new ServiceDAOImpl();
	
	public void setServletResponse(HttpServletResponse arg0) {
		this.response = arg0;
	}
	public void setServletRequest(HttpServletRequest arg0) {
		this.request = arg0;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;;
		
	}
	
	@Override
	public String execute() throws Exception {
		
		return SUCCESS;
	}
	
	/**
	 * 异步获取头部快捷菜单信息
	 * @return
	 * @throws Exception
	 */
	public String loadHeader() throws Exception {
		//根据Cookie获取所选车辆信息
		String currentModel = (String)session.get("currentModel");
		Vehicle vehicle = null;
		if(currentModel == null){
			Cookie autoBoysVM = CookieUtil.getCookie(request, "AutoboysVM");
			if(autoBoysVM != null){
				vehicle = vehicleDAO.getVehicleByPrimaryKey(new Integer(autoBoysVM.getValue()));
				if(vehicle != null){
					currentModel = vehicle.getShortName();
					session.put("currentModel", currentModel);
				}
			}
		}
		return SUCCESS;
	}
	
	public String upload() {
		
		return SUCCESS;
	}
	
	/**
	 * 根据父类Code获取车型列表
	 * @return
	 * @throws Exception
	 */
	public String confirmVechicle() throws Exception {
		String vehicleId = request.getParameter("vehicle_id");
		String currentModel = vehicleDAO.getVehicleByPrimaryKey(new Integer(vehicleId)).getShortName();
				
		//设置选定车系
		CookieUtil.setCookie(request, response, "AutoboysVM", vehicleId, 31536000);
		if(currentModel != null) 
		{
			//CookieUtil.setCookie(request, response, "CurrentVM", URLEncoder.encode(currentModel,"utf-8"), 31536000);
			HttpSession session = request.getSession(); 
			session.setAttribute("currentModel",currentModel);
			//System.out.println("current model set to session:"+currentModel);
			
		}
		printWriteHTML("var data = {\"success\":true}");
		return null;
	}
	/**
	 * 根据首字母查询汽车品牌
	 * 
	 * @return String
	 * @throws Exception
	 */
	public String getBrands() throws Exception {
		
		String firstCharacter = request.getParameter("fc");
		if(firstCharacter == null || firstCharacter.length()==0 || firstCharacter.equals("1")){
			brandList = vehicleBrandDAO.listHotVehicleBrand();
		}else{
			brandList = vehicleBrandDAO.listVehicleBrandByFC(firstCharacter);
		}
		session.put("firstCharacter", firstCharacter);
		return SUCCESS;
	}
	/**
	 * 根据父类Code获取车系列表
	 * @return
	 * @throws Exception
	 */
	public String getVehicleSeries() throws Exception {
		String pcode = request.getParameter("pcode");
		System.out.println("get series ,brand_code:"+pcode);
		//设置选定品牌cookie
		//CookieUtil.setCookie(request, response, "AutoboysVB", pcode, 31536000);
		VehicleBrand brand = vehicleBrandDAO.getVehicleBrand(pcode);
		session.put("curBrandCode", pcode);
		if(brand != null) session.put("curBrandName", brand.getCname());
		seriesList = vehicleSeriesDAO.listByBrandCode(pcode);
		//request.setAttribute("seriesList", seriesList);
		return SUCCESS;
	}
	/**
	 * 根据父类Code获取排量信息
	 * @return
	 * @throws Exception
	 */
	public String getVehicleEmission() throws Exception {
		String pcode = request.getParameter("pcode");
		//System.out.println("get emission,series_code:"+pcode);
		//设置选定车系
		//CookieUtil.setCookie(request, response, "AutoboysVS", pcode, 31536000);
		
		VehicleSeries series = vehicleSeriesDAO.getVehicleSeries(pcode);
		session.put("curSeriesCode", pcode);
		session.put("curSeriesName",series.getCname());
		//emissionList = vehicleEmissionDAO.listBySeriesCode(pcode);
		//modify by Kevin 2014.4.7 排量改为直接从vehicle表获取
		emissionList = vehicleDAO.getEmissionsBySeries(pcode);
		return SUCCESS;
	}
	
	/**
	 * 根据车系和排量获取车型列表
	 * @return
	 * @throws Exception
	 */
	public String getVehicleModel() throws Exception {
		String scode = request.getParameter("scode");
		String ecode = request.getParameter("ecode");
		//VehicleEmission emission = vehicleEmissionDAO.getVehicleEmission(code);
		session.put("curEmissionCode", ecode);
		session.put("curEmissionName", ecode);
		vehicleList = vehicleDAO.getVehiclesBySE(scode,ecode);		
		return SUCCESS;
	}
	
	/**
	 * 
	 * 
	 * @return String
	 * @throws Exception
	 */
	
	public String getVehicleYear() throws Exception {
		/*
		String code = request.getParameter("pcode");
		yearList = vehicleYearDAO.listByEmissionCode(code);
		VehicleEmission emission = vehicleEmissionDAO.getVehicleEmission(code);
		session.put("curEmissionCode", code);
		session.put("curEmissionName", emission.getCname());
		*/
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
	
	
	
	public String updateEmission() throws Exception{
		List<Vehicle> list =  vehicleDAO.listVehicle();
		Iterator<Vehicle> iter = list.iterator(); 
		Vehicle vehicle = null;
		PrintWriter pw = new PrintWriter("E:\\Users\\workspace\\data\\Vehicle.txt"); 
		while(iter.hasNext())  
        {  
			vehicle = iter.next();
			String url ="http://www.autohome.com.cn/spec/"+vehicle.getId()+"/"; 
            URL getUrl = new URL(url);
    		//HttpURLConnection connection = (HttpURLConnection) getUrl.openConnection();
    		//connection.connect();
    		BufferedReader reader = new BufferedReader(new InputStreamReader(getUrl.openStream(),"gb2312"));
			// 取得输入流，并使用Reader读取
			String line;
			
			boolean beg = false;
			StringBuffer sb = new StringBuffer();
			while ((line = reader.readLine()) != null) {
				if(line.indexOf("<li><span>发")>=0){
					beg = true;
				}
				if(beg){
					sb.append(line);
				}	
				if(line.indexOf("</li>")>=0){
					beg = false;
				}
							
			}
			String regx = ("</span>(.*?) (.*?)</li>");
			Pattern p= Pattern.compile(regx);
			Matcher  macher =p.matcher(sb.toString());
			String sql =null;
			while(macher.find()){ 
				sql = "insert into vehicle (id,series_code,emission_code,full_name,year_code) values ('"+vehicle.getId()+"','"+vehicle.getSeriesCode()+"','"+macher.group(1)+"','"+vehicle.getFullName()+"','"+vehicle.getYearCode()+"');";
				System.out.println(sql);
				pw.println(sql); 
			}
            
        }  
		
		return null;
	}
	
	
	private void printWriteHTML(String html){
		
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
	
	public List<VehicleBrand> getBrandList() {
		return brandList;
	}

	public void setBrandList(List<VehicleBrand> brandList) {
		this.brandList = brandList;
	}
	
	public List<VehicleSeries> getSeriesList() {
		return seriesList;
	}

	public void setSeriesList(List<VehicleSeries> seriesList) {
		this.seriesList = seriesList;
	}
	
	public List<VehicleEmission> getEmissionList() {
		return emissionList;
	}

	public void setEmissionList(List<VehicleEmission> emissionList) {
		this.emissionList = emissionList;
	}
	
	public List<Vehicle> getVehicleList() {
		return vehicleList;
	}

	public void setVehicleList(List<Vehicle> vehicleList) {
		this.vehicleList = vehicleList;
	}
	
	public List<VehicleYear> getYearList() {
		return yearList;
	}

	public void setYearList(List<VehicleYear> yearList) {
		this.yearList = yearList;
	}
	
	/**
	 * 鏍规嵁鍖哄煙1寰楀埌鍖哄煙2鍒楄〃
	 * add zhux 2014-03-28
	 * @return
	 * @throws Exception
	 */
	public String getRegionsByReg1() throws Exception {
		StringBuilder sb = new StringBuilder(); 
		String reg = request.getParameter("regId");
		if( reg!=null && !"".equals(reg)) {
			List<ProviderRegion> ls = prdao.getChildrenByParent(Long.valueOf(reg));
			for(ProviderRegion p: ls ) {
				sb.append("<option value=\"").append(p.getId()).append("\">").append(p.getName()).append("</option>");
			}
			printWriteHTML(sb.toString());
		} 
		return null;
	}	
	
	/** 处理服务商价格录入
	 * ajax request zhux
	 * To save or update providerProduct.
	 * @return String
	 */
	public String updatePrice()
	{	
		HttpServletRequest request = ServletActionContext.getRequest();
		String id = request.getParameter("id");
		String product = request.getParameter("product_id");
		String discountPrice = request.getParameter("discount_price");
		String labourPrice =request.getParameter("labour_price");
		Member user = (Member) request.getSession().getAttribute("login_user");
		//Member user = new Member(); user.setProvid(1L);
		if(id !=null &&!"".equals(id)) {
				ppdao.updatePrice(id,discountPrice,labourPrice);
		} else {
			ppdao.save(user.getProvid(),product,discountPrice,labourPrice);
		}
		if(discountPrice==null||"".equals(discountPrice)
				||labourPrice==null||"".equals(labourPrice)) {
			printWriteHTML("");
		} else {
			printWriteHTML(String.valueOf(Double.parseDouble(discountPrice)+Double.parseDouble(labourPrice)));
		}
		return null;
	}	
	
	/**
	 * 得到某分类下对应的服务
	 * add zhux 2014-04-15
	 * @return
	 * @throws Exception
	 */
	public String getServiceByCat() throws Exception {
		StringBuilder sb = new StringBuilder(); 
		List<Service> ls = new ArrayList<Service>();
		String selCategory = request.getParameter("selCategory");
		if( selCategory!=null && !"".equals(selCategory)) {

			ls = serviceDAO.listServiceByCatId(selCategory);

			for(Service p: ls ) {
				sb.append("<option value=\"").append(p.getCODE()).append("\">").append(p.getNAME()).append("</option>");
			}
			printWriteHTML(sb.toString());
		} 
		return null;
	}	
	
	/**
	 * 得到某品牌下 对应的系列
	 * add zhux 2014-04-15
	 * @return
	 * @throws Exception
	 */
	public String getVehicleSeries1() throws Exception {
		StringBuilder sb = new StringBuilder(); 
		List<VehicleSeries> ls = new ArrayList<VehicleSeries>();
		String selBrand = request.getParameter("selVehicleBrand");
		if( selBrand!=null && !"".equals(selBrand)) {
			ls =  vehicleSeriesDAO.listByBrandCode(selBrand);
			for(VehicleSeries p: ls ) {
				sb.append("<option value=\"").append(p.getCode()).append("\">").append(p.getCname()).append("</option>");
			}
			printWriteHTML(sb.toString());
		} 
		return null;
	}	
}
