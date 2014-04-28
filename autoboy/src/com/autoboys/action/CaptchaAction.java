package com.autoboys.action;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



//对应commons-lang包
import org.apache.commons.lang.RandomStringUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class CaptchaAction extends ActionSupport implements
		ServletRequestAware, ServletResponseAware, SessionAware {

	private HttpServletResponse response;
	private HttpServletRequest request;
	private Map<String, Object> session;

	public void setServletResponse(HttpServletResponse arg0) {
		this.response = arg0;
	}

	public void setServletRequest(HttpServletRequest arg0) {
		this.request = arg0;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	
	public String getCaptcha() throws Exception{
		int codeLength = 4;// 验证码长度
		Random r = new Random();
		StringBuffer sb = new StringBuffer();
		char[] ch = "abcdefghijkmnpqrstuvwxyz123456789".toCharArray();
		int index, len = ch.length;
		String sRand = "";
		for (int i = 0; i < codeLength; i++) {
			index = r.nextInt(len);
			String rand = String.valueOf(ch[index]);
			sRand += rand;
		}
		// 将认证码存入SESSION
		//ServletActionContext.getRequest().getSession().setAttribute("rand", sRand);
		session.put("captcha", sRand);
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		printWriteHTML("var data = {\"retval\":\"ciifyXvFW4swA74j88b57550\",\"success\":true}");
		return null;
	}
	
	@Override
	public String execute()  throws Exception {
		return SUCCESS;
	}
	public String captcha()  throws Exception {
		
		int codeLength = 4;// 验证码长度
		int mixTimes = 1;// 模糊程度参数
		//Color bgColor = getRandColor(200, 250);// 背景颜色
		Color bgcolor = java.awt.Color.white;
		Color bfColor = java.awt.Color.blue;// 字体颜色
		boolean ifRandomColor = false;// 单个字符是否颜色随机
		boolean ifMixColor = false;// 模糊线是否颜色随机

		// 设置页面不缓存
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		// 在内存中创建图象
		int width = 13 * codeLength + 6, height = 20;
		BufferedImage image = new BufferedImage(width, height,
				BufferedImage.TYPE_INT_RGB);
		// 获取图形上下文
		Graphics g = image.getGraphics();
		// 设定背景色
		g.setColor(bgcolor);
		g.fillRect(0, 0, width, height);
		// 设定字体
		g.setFont(new Font("Arail", Font.BOLD, 18));
		// 画边框
		//g.setColor(new Color(33, 66, 99));
		//g.drawRect(0, 0, width - 1, height - 1);
		// 随机产生干扰线，使图象中的认证码不易被其它程序探测到
		g.setColor(getRandColor(160, 200));
		for (int i = 0; i < mixTimes * codeLength / 10; i++) {
			if (ifMixColor) {
				g.setColor(getRandColor(160, 200));
			}
			int x = random.nextInt(width);
			int y = random.nextInt(height);
			int xl = random.nextInt(12);
			int yl = random.nextInt(12);
			g.drawLine(x, y, x + xl, y + yl);
		}
		// 取随机产生的认证码(4位数字)

		// 向图片中输出数字和字母
        Random  r=new Random();
	   StringBuffer sb = new StringBuffer();

       char[] ch = "abcdefghijkmnpqrstuvwxyz123456789".toCharArray();

       int index, len = ch.length;
       String sRand = "";
		
		for (int i = 0; i < codeLength; i++) {

			 index = r.nextInt(len);
			 
			    String rand =String.valueOf(ch[index]);
			    sRand += rand;
			// 将认证码显示到图象中
			if (ifRandomColor)
				g.setColor(getRandColor(20, 110, 0));
			else
				g.setColor(bfColor);
			// 调用函数出来的颜色相同，可能是因为种子太接近，所以只能直接生成
			//g.drawString(captcha.substring(i, i+1), 13 * i + 6, 16);
			g.drawString(rand, 13 * i + 6, 16);
			
		}
		// 将认证码存入SESSION
		session.put("captcha",sRand);
		// 图象生效
		g.dispose();
		// 输出图象到页面
		ImageIO.write(image, "PNG", response.getOutputStream());
		return null;

	}

	private static Random random = new Random();

	private Color getRandColor(int fc, int bc) {
		return getRandColor(fc, bc, fc);
	}

	private Color getRandColor(int fc, int bc, int interval) {
		if (fc > 255) {
			fc = 255;
		}
		if (bc > 255) {
			bc = 255;
		}
		int r = fc + random.nextInt(bc - interval);
		int g = fc + random.nextInt(bc - interval);
		int b = fc + random.nextInt(bc - interval);
		return new Color(r, g, b);
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
}
