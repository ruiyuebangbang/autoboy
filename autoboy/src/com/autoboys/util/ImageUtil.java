package com.autoboys.util;

import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.imageio.ImageIO;

public class ImageUtil {
	public ImageUtil() {
	}

	/**
	 * 将imageFullPath指定的图片进行等比缩放，最长的边为<t>maxEdgeLength</t>
	 * 
	 * @param imageFullPath
	 *            ：需要裁剪的图片绝对路径
	 * @param size
	 *            : 新图片宽
	 * @return
	 */
	public static boolean resizeImage(String imageFullPath, int size)
			throws Exception {
		File file = new File(imageFullPath);
		if (!file.exists()) {
			return false;
		}
		Image img = ImageIO.read(file);
		// 判断图片格式是否正确
		if (img == null || img.getWidth(null) <= 0 || img.getHeight(null) <= 0) {
			return false;
		}
		int width = img.getWidth(null);
		int height = img.getHeight(null);

		if (width > size) {
			double percent = size / width;
			width = (int) (width * percent);
			height = (int) (height * percent);
		} else {
			return true;
		}
		FileOutputStream out = null;
		try {
			BufferedImage tag = new BufferedImage((int) width, (int) height,BufferedImage.TYPE_INT_RGB);
			tag.getGraphics().drawImage(img.getScaledInstance(width, height, Image.SCALE_SMOOTH),0, 0, null);
			out = new FileOutputStream(imageFullPath);
			ImageIO.write(tag, "jpg", out);
		} catch (Exception e) {
			throw new RuntimeException("resize image error, img="	+ imageFullPath, e);
		} finally {
			if (out != null) {
				out.close();
			}
		}
		return true;
	}
	
	/**
	 * 
	 * @param file 图片文件
	 * @param nwidth	新图片宽度
	 * @param nheight	新图片高度
	 * @param format	图片格式
	 * @param savePath	图片保存地址
	 * @return
	 * @throws Exception
	 */
	public static boolean resizeImage(File file,int nwidth,int nheight,String format,String savePath) throws Exception {
		
		Image img = ImageIO.read(file);
		// 判断图片格式是否正确
		if(!checkImageFile(format)){
			return false;
		}
		if(nwidth ==0 && nheight == 0) {
			return false;
		}
		int width = img.getWidth(null);
		int height = img.getHeight(null);
		
		if(nwidth == 0) nwidth =  (int)((double) width * ((double)nheight / height));
		
		if(nheight == 0) nheight = (int)((double) height * ((double)nwidth / width));
		
		FileOutputStream out = null;
		try {
			BufferedImage tag = new BufferedImage((int) nwidth, (int) nheight,BufferedImage.TYPE_INT_RGB);
			tag.getGraphics().drawImage(img.getScaledInstance(nwidth, nheight, Image.SCALE_SMOOTH),0, 0, null);
			out = new FileOutputStream(savePath);
			ImageIO.write(tag, format, out);
		} catch (Exception e) {
			throw new RuntimeException("resize image error,", e);
		} finally {
			if (out != null) {
				out.close();
			}
		}
		return true;
	}
	
	
	/**
	 * 改变图片的大小到宽为size，然后高随着宽等比例变化
	 * 
	 * @param is
	 *            上传的图片的输入流
	 * @param os
	 *            改变了图片的大小后，把图片的流输出到目标OutputStream
	 * @param size
	 *            新图片的宽
	 * @param format
	 *            新图片的格式
	 * @throws IOException
	 */
	public static void resizeImage(InputStream is, OutputStream os, int size,	String format) throws IOException {
		BufferedImage prevImage = ImageIO.read(is);
		double width = prevImage.getWidth();
		double height = prevImage.getHeight();
		double percent = size / width;
		int newWidth = (int) (width * percent);
		int newHeight = (int) (height * percent);
		BufferedImage image = new BufferedImage(newWidth, newHeight,BufferedImage.TYPE_INT_BGR);
		Graphics graphics = image.createGraphics();
		graphics.drawImage(prevImage, 0, 0, newWidth, newHeight, null);
		ImageIO.write(image, format, os);
		os.flush();
		is.close();
		os.close();
	}

	/**
	 * 检查是否是合法图片
	 * 
	 * @param extName
	 *            图片扩展名
	 * @return
	 */
	public static boolean checkImageFile(String extName) {

		if ("jpg".equalsIgnoreCase(extName))
			return true;
		if ("gif".equalsIgnoreCase(extName))
			return true;
		if ("bmp".equalsIgnoreCase(extName))
			return true;
		if ("jpeg".equalsIgnoreCase(extName))
			return true;
		if ("png".equalsIgnoreCase(extName))
			return true;
		return false;
	}
}
