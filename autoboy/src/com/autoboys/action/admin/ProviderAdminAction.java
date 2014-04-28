package com.autoboys.action.admin;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.RandomStringUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;

import com.autoboys.dao.MemberDAO;
import com.autoboys.dao.MemberDAOImpl;
import com.autoboys.dao.ProviderDAO;
import com.autoboys.dao.ProviderDAOImpl;
import com.autoboys.dao.ProviderRegionDAO;
import com.autoboys.domain.Member;
import com.autoboys.domain.Pager;
import com.autoboys.domain.Provider;
import com.autoboys.domain.ProviderProduct;
import com.autoboys.domain.ProviderRegion;
import com.opensymphony.xwork2.ActionSupport;
public class ProviderAdminAction  extends ActionSupport implements ServletRequestAware, ServletResponseAware, SessionAware {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 5848973847833251891L;
	private ProviderDAO pdao = new ProviderDAOImpl();
	private ProviderRegionDAO rdao = new ProviderRegionDAO();
	
	
	
	
	private Pager pager ;//保存分页信息
	private List<Provider> providerList;
	private Provider provider;
	
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
	
	public Provider getProvider() {
		return provider;
	}

	public void setProvider(Provider provider) {
		this.provider = provider;
	}

	public Pager getPager() {
		return pager;
	}

	public void setPager(Pager pager) {
		this.pager = pager;
	}

	public List<Provider> getProviderList() {
		return providerList;
	}

	public void setProviderList(List<Provider> providerList) {
		this.providerList = providerList;
	}

	
	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void setServletResponse(HttpServletResponse arg0) {
		// TODO Auto-generated method stub
		
	}
	
	private HttpServletRequest request;
    //实现接口中的方法
    public void setServletRequest(HttpServletRequest request){
    	this.request = request;
    }

	private	List<ProviderRegion> regions1;
	private Long region1;
	private	List<ProviderRegion> regions2;
	private Long region2;
    
	private List<ProviderRegion> regions3;
	
	
	public List<ProviderRegion> getRegions3() {
		return regions3;
	}

	public void setRegions3(List<ProviderRegion> regions3) {
		this.regions3 = regions3;
	}

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

	@Override
	public String execute() throws Exception {
		System.out.println("");
		return SUCCESS;
	}
	
	public String queryProvider() throws Exception {

		if(pager == null) {
			pager = new Pager();
		}
		if(provider == null) {
			provider = new Provider();
		}
		pager.setTotal(pdao.qryProviderCnt(provider.getSHORT_NAME(),region1,region2));
		providerList = pdao.qryProviderList(provider.getSHORT_NAME(),region1,region2, pager.getPageCurr(), pager.getPageSize());
	
		
		regions1 =  rdao.getChildrenByParent(0L);
		if(region1 !=null) {
			regions2 = rdao.getChildrenByParent(region1);
		} else {
			regions2 = new ArrayList<ProviderRegion>();
		}
		
		return SUCCESS;
	}
	
	/**
	 * 待审核服务商列表
	 * @return
	 * @throws Exception
	 */
	public String auditProviderQry() throws Exception {

		if(pager == null) {
			pager = new Pager();
		}
		pager.setTotal(pdao.qryAuditProviderCnt());
		providerList = pdao.qryAuditProviderList( pager.getPageCurr(), pager.getPageSize());		
		return SUCCESS;
	}
	
	/**
	 * 服务商审核
	 * @return
	 * @throws Exception
	 */
	public String auditProvider() throws Exception {
		String 	pid = request.getParameter("pid");
		String  stat = request.getParameter("stat");
		pdao.auditProvider(Long.parseLong(pid), Integer.parseInt(stat));
		return SUCCESS;
	}

	/**
	 * 服务商基本信息维护
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
				pdao.updateMainInfo(provider);
				return "success";
			}
		} 
			
		String providerId = request.getParameter("provid");
		
		if(method.equals("GET")) {
			provider = pdao.listProviderById(new Long(providerId));
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
			//String providerId = request.getParameter("provider.ID");
			provider = pdao.listProviderById(provider.getID());
			return "editForm";

	}


	/**
	 * 上传图片
	 * @return
	 * @throws Exception
	 */
	public String uploadImage() throws Exception {
		//得到工程项目地址
		//String realpath = ServletActionContext.getServletContext().getRealPath("/images");
		String str = request.getParameter("selImage");
		if ("logo".equals(str)) {
			String realpath = ServletActionContext.getServletContext().getRealPath("/uploadimage");
			if (image != null) {
				File savefile = new File(new File(realpath), "logo" + provider.getID() + imageFileName.substring(imageFileName.lastIndexOf('.')));
				if (!savefile.getParentFile().exists())
					savefile.getParentFile().mkdirs();
				FileUtils.copyFile(image, savefile);
				
				provider.setLOGO(savefile.getName());
				pdao.updateLogo(provider);
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
				pdao.updateImage(provider.getID(), savefile.getName(),1);
				picType="normal";
			}
		}
		return SUCCESS;
	}
}
