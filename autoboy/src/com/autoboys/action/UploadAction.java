package com.autoboys.action;

import java.awt.Image;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.opensymphony.xwork2.ActionSupport;

import org.apache.commons.io.FileUtils;

import com.autoboys.domain.Member;
import com.autoboys.util.ImageUtil;
import com.autoboys.util.HTMLUtil;
import com.autoboys.util.StringUtil;
import com.autoboys.dao.*;
import com.autoboys.domain.Provider;
public class UploadAction extends ActionSupport implements ServletResponseAware,ServletRequestAware{

	private File Filedata;
	
	private String FiledataContentType;
	
	private String FiledataFileName;
	
	private HttpServletResponse response;
	private HttpServletRequest request;
	private MemberDAO memberDAO = new MemberDAOImpl();
	private ProviderDAO providerDAO = new ProviderDAOImpl();
	private Member member = new Member();
	
	public void setServletResponse(HttpServletResponse arg0) {
		this.response = arg0;
	}
	public void setServletRequest(HttpServletRequest arg0) {
		this.request = arg0;
	}
		
	public String execute() throws Exception
	{
		String realpath = ServletActionContext.getServletContext().getRealPath("/uploadimage/passport/");
		String imageType = FiledataFileName.substring(FiledataFileName.lastIndexOf('.'));
		//InputStream is = new FileInputStream(Filedata);
		//OutputStream os = null;
		//System.out.println("image type :"+imageType.substring(1, imageType.length()));
		if(imageType !=null && ImageUtil.checkImageFile(imageType.substring(1, imageType.length()))){
			if (Filedata != null) {
				Member member =  (Member) request.getSession().getAttribute("login_user");
				String fileName = "avatar_"+member.getId()+imageType;
				File savefile = new File(new File(realpath), fileName);
				if (!savefile.getParentFile().exists())
					savefile.getParentFile().mkdirs();
				ImageUtil.resizeImage(Filedata, 120, 120,imageType.substring(1, imageType.length()), savefile.getAbsolutePath());
				//FileUtils.copyFile( Filedata, savefile);
				member.setAvatar("/uploadimage/passport/"+fileName);
				memberDAO.updateAvatar(member);
				request.getSession(true).setAttribute("login_user", member);
				HTMLUtil.printWriteHTML(response, "{\"status\":\"1\",\"name\":\""+FiledataFileName+"\",\"hash\":\""+fileName+"\",\"mime\":\"jpg\"}");
			}
		}
		return null;
	}
	
	public String uploadDZ() throws Exception
	{
		String realpath = ServletActionContext.getServletContext().getRealPath("/uploadimage/provider/");
		String imageType = FiledataFileName.substring(FiledataFileName.lastIndexOf('.'));
		//InputStream is = new FileInputStream(Filedata);
		//OutputStream os = null;
		//System.out.println("image type :"+imageType.substring(1, imageType.length()));
		if(imageType !=null && ImageUtil.checkImageFile(imageType.substring(1, imageType.length()))){
			if (Filedata != null) {
				Member member =  (Member) request.getSession().getAttribute("login_user");
				//Random rd1 = new Random();
				String fileName = "logo_"+member.getProvid() + imageType;
				File savefile = new File(new File(realpath), fileName);
				if (!savefile.getParentFile().exists())
					savefile.getParentFile().mkdirs();
				ImageUtil.resizeImage(Filedata, 230, 123,imageType.substring(1, imageType.length()), savefile.getAbsolutePath());
				
				providerDAO.updateLogo(member.getProvid(),savefile.getName());
				HTMLUtil.printWriteHTML(response, "{\"status\":\"1\",\"name\":\""+FiledataFileName+"\",\"hash\":\""+savefile.getName()+"\",\"mime\":\"jpg\"}");
			}
		}
		return null;
	}
	
	public String uploadProviderImgs() throws Exception
	{
		String realpath = ServletActionContext.getServletContext().getRealPath("/uploadimage/provider/");
		String imageType = FiledataFileName.substring(FiledataFileName.lastIndexOf('.')+1,FiledataFileName.length());
		String imageName = FiledataFileName.substring(0, FiledataFileName.indexOf("."));
		imageName = StringUtil.MD5(imageName);
		//InputStream is = new FileInputStream(Filedata);
		//OutputStream os = null;
		if(imageType !=null && ImageUtil.checkImageFile(imageType)){
			if (Filedata != null) {
				Member member =  (Member) request.getSession().getAttribute("login_user");
				//Random rd1 = new Random();
				//String fileName = "store_"+member.getProvid() + imageType;
				String fileName = imageName + "." + imageType;
				File savefile = new File(new File(realpath), fileName);
				if (!savefile.getParentFile().exists())
					savefile.getParentFile().mkdirs();
				ImageUtil.resizeImage(Filedata, 660, 0,imageType, savefile.getAbsolutePath());
				
				providerDAO.updateImage(member.getProvid(),imageName+"."+imageType,0);
				HTMLUtil.printWriteHTML(response, "{\"status\":\"1\",\"name\":\""+FiledataFileName+"\",\"hash\":\""+savefile.getName()+"\",\"mime\":\"img\\/jpg\"}");
			}
		}else {
			HTMLUtil.printWriteHTML(response, "{\"status\":\"0\",\"name\":\""+FiledataFileName+"\",\"hash\":\""+FiledataFileName+"\",\"mime\":\"img\\/jpg\"}");
		}
		return null;
	}


	public File getFiledata() {
		return Filedata;
	}

	public void setFiledata(File Filedata) {
		this.Filedata = Filedata;
	}

	public String getFiledataContentType() {
		return FiledataContentType;
	}

	public void setFiledataContentType(String FiledataContentType) {
		this.FiledataContentType = FiledataContentType;
	}

	public String getFiledataFileName() {
		return FiledataFileName;
	}

	public void setFiledataFileName(String FiledataFileName) {
		this.FiledataFileName = FiledataFileName;
	}
	
}
