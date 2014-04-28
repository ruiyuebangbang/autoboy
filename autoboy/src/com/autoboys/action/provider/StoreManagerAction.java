package com.autoboys.action.provider;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import java.io.File;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.autoboys.dao.ProviderDAO;
import com.autoboys.dao.ProviderDAOImpl;
import com.autoboys.dao.ProviderRegionDAO;
import com.autoboys.domain.Member;
import com.autoboys.domain.Provider;
import com.autoboys.domain.ProviderRegion;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.*;

public class StoreManagerAction extends ActionSupport implements ServletRequestAware{
	/**
	 * 
	 */
	private static final long serialVersionUID = -3180845369910755178L;

	private static Logger logger = Logger.getLogger(StoreManagerAction.class); 
	

	private File image; //上传的文件   
    private String imageFileName; //文件名称    
    private String imageContentType; //文件类型

    private String picType ;//= "logo";
    
    public String getPicType() {
		return picType;
	}
	public void setPicType(String imageType) {
		this.picType = imageType;
	}
	public File getImage() {
		return image;
	}
	public void setImage(File image) {
		this.image = image;
	}
	public String getImageFileName() {
		return imageFileName;
	}
	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}
	public String getImageContentType() {
		return imageContentType;
	}
	public void setImageContentType(String imageContentType) {
		this.imageContentType = imageContentType;
	}

	private Provider provider;
	private	List<ProviderRegion> regions1;
	Long region1;
	private	List<ProviderRegion> regions2;
	Long region2;
	private	List<ProviderRegion> regions3;
		
	public List<ProviderRegion> getRegions1() {
		return regions1;
	}

	public void setRegions1(List<ProviderRegion> regions1) {
		this.regions1 = regions1;
	}

	public Long getRegion1() {
		return region1;
	}

	public void setRegion1(Long region1) {
		this.region1 = region1;
	}

	public List<ProviderRegion> getRegions2() {
		return regions2;
	}

	public void setRegions2(List<ProviderRegion> regions2) {
		this.regions2 = regions2;
	}

	public Long getRegion2() {
		return region2;
	}

	public void setRegion2(Long region2) {
		this.region2 = region2;
	}

	public List<ProviderRegion> getRegions3() {
		return regions3;
	}

	public void setRegions3(List<ProviderRegion> regions3) {
		this.regions3 = regions3;
	}


	private ProviderDAO dao = new ProviderDAOImpl();
	private ProviderRegionDAO rdao = new ProviderRegionDAO();
	public Provider getProvider() {
		return provider;
	}

	public void setProvider(Provider provider) {
		this.provider = provider;
	}
	
	
	private HttpServletRequest request;
    //实现接口中的方法
    public void setServletRequest(HttpServletRequest request){
     this.request = request;
    }
    
	@Override
	public String execute() throws Exception {
		String status = request.getParameter("status");
		logger.info("order status is " + status);
		return SUCCESS;
	}

	/**
	 * 基本信息处理
	 * @return
	 * @throws Exception
	 */
	public String editBasicInfo() throws Exception {
		boolean bRet = false;
		String method = request.getMethod();
		if(method.equals("POST")) {
			if(provider.getSHORT_NAME()==null ||"".equals(provider.getSHORT_NAME().trim())) {
				this.addFieldError("provoider.SHORT_NAME", "简称不能为空");
				bRet = true;
			}
			if(provider.getFULL_NAME()==null ||"".equals(provider.getFULL_NAME().trim())) {
				this.addFieldError("provoider.FULL_NAME", "全称不能为空");
				bRet = true;
			}
			if(provider.getAGENT()==null ||"".equals(provider.getAGENT().trim())) {
				this.addFieldError("provoider.AGENT", "负责人不能为空");
				bRet = true;
			}
			if(provider.getTELEPHONE()==null ||"".equals(provider.getTELEPHONE().trim())) {
				this.addFieldError("provoider.TELEPHONE", "负责人电话不能为空");
				bRet = true;
			}
			if(provider.getADDRESS()==null ||"".equals(provider.getADDRESS().trim())) {
				this.addFieldError("provoider.ADDRESS", "地址不能为空");
				bRet = true;
			}
			if(!bRet) {
				dao.updateMainInfo(provider);
				return "success";
			}
		} 
			
		Member member = (Member) request.getSession().getAttribute("login_user");
		long providerId = member.getProvid();
		if(method.equals("GET")) {
			provider = dao.listProviderById(new Long(providerId));
		}
		if(provider.getREGION_ID()!=null && provider.getREGION_ID()!=0) {
			ProviderRegion tmp = rdao.getObjectById(provider.getREGION_ID());
			if(tmp !=null ) {
				regions3 = rdao.getChildrenByParent(tmp.getParent());
				tmp = rdao.getObjectById(tmp.getParent());
			}
			if(tmp !=null ) {
				region2 = tmp.getId();
				regions2 = rdao.getChildrenByParent(tmp.getParent());
				tmp = rdao.getObjectById(tmp.getParent());
			}
			if(tmp !=null ) {
				region1 = tmp.getId();
				regions1 = rdao.getChildrenByParent(tmp.getParent());
			}
		} else {
			regions1 =  rdao.getChildrenByParent(0L);
			regions2 = rdao.getChildrenByParent(regions1.get(0).getId());
			regions3 = rdao.getChildrenByParent(regions2.get(0).getId());
		}
		return "editForm";

	}
	
	/**
	 * 处理店招等图片
	 * @return
	 * @throws Exception
	 */
	public String editStoreInfo() throws Exception {
		String method = request.getMethod();
		if(!method.equals("POST")) {
			
			Member member = (Member) request.getSession().getAttribute("login_user");
			long providerId = member.getProvid();
			provider = dao.listProviderById(providerId);
			return "editForm";
		}
		
		
		return "submitForm";
	}


	/**
	 * 上传图片
	 * @return
	 * @throws Exception
	 */
	public String uploadImage() throws Exception {
		
		
		//得到工程项目地址
		//String realpath = ServletActionContext.getServletContext().getRealPath("/images");
		//System.out.println("realpath: " + realpath);
		//ServletContext sc = ServletActionContext.getServletContext();
		//System.out.println(sc.getContextPath());
		//System.out.println(sc.getRealPath("/"));
		//取web.xml中配置的<context-param>参数 
		//String realpath = ServletActionContext.getServletContext().getInitParameter("imagepath");
		//System.out.println("realpath: " + realpath);
		String str = request.getParameter("selImage");
		if ("logo".equals(str)) {
			String realpath = ServletActionContext.getServletContext().getRealPath("/uploadimage");
			if (image != null) {
				File savefile = new File(new File(realpath), "logo" + provider.getID() + imageFileName.substring(imageFileName.lastIndexOf('.')));
				if (!savefile.getParentFile().exists())
					savefile.getParentFile().mkdirs();
				FileUtils.copyFile(image, savefile);
				
				provider.setLOGO(savefile.getName());
				dao.updateLogo(provider);
				picType = "logo";
			}
		} else {
			String realpath = ServletActionContext.getServletContext().getRealPath("/uploadimage");
			if (image != null) {
				File savefile = new File(new File(realpath), imageFileName);
				if (!savefile.getParentFile().exists())
					savefile.getParentFile().mkdirs();
				FileUtils.copyFile(image, savefile);
				
				//index属性暂不用，图片直接填空位
				dao.updateImage(provider.getID(), savefile.getName(),1);
				picType="normal";
			}
		}
		return SUCCESS;
	}

	
	
	public String manageEmployee() throws Exception {
		String method = request.getMethod();
		//if(!method.equals("POST"))	return "manageEmployee";
		
		return "submitForm";
	}
	
}
