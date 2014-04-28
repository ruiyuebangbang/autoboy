package com.autoboys.util;

import java.security.MessageDigest;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

public class StringUtil {
	 public StringUtil() {
	  }
	  public static boolean validateMobilePhone(String str) {
		  Pattern p = Pattern.compile("^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$");  
		  Matcher m = p.matcher(str);  
		  return m.matches(); 
	    }
	  public static boolean validateNickName(String str) {
		  //昵称只能是数字、字母、下划线或中文
		  Pattern p = Pattern.compile("^[a-zA-Z0-9_\u4e00-\u9fa5]+$");  
		  Matcher m = p.matcher(str);  
		  return m.matches(); 
	    }
	  
	  public static String fiterSQLParam(String str) {
		  return str.replace("'", "''");
	  }
	  
	  /**
		 * MD5加码。32位
		 * @param inStr
		 * @return
		 */
		public static String MD5(String inStr) {
			MessageDigest md5 = null;
			try {
				md5 = MessageDigest.getInstance("MD5");
			} catch (Exception e) {
				System.out.println(e.toString());
				e.printStackTrace();
				return "";
			}
			char[] charArray = inStr.toCharArray();
			byte[] byteArray = new byte[charArray.length];

			for (int i = 0; i < charArray.length; i++)
				byteArray[i] = (byte) charArray[i];

			byte[] md5Bytes = md5.digest(byteArray);

			StringBuffer hexValue = new StringBuffer();

			for (int i = 0; i < md5Bytes.length; i++) {
				int val = ((int) md5Bytes[i]) & 0xff;
				if (val < 16)
					hexValue.append("0");
				hexValue.append(Integer.toHexString(val));
			}

			return hexValue.toString();
		}

}
