package com.autoboys.util;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletResponse;

public class HTMLUtil {
	 public HTMLUtil() {
	  }
	  
	  public static void printWriteHTML(HttpServletResponse response,String html){
			
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
