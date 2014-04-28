package com.autoboys.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.apache.log4j.Logger;


public class ProxoolConnection {
	private static Logger logger = Logger.getLogger(ProxoolConnection.class);
	static {
	    //1：注册驱动类，这次这个驱动已经不是Oracle的驱动了，是Proxool专用的驱动 
		try {
			Class.forName("org.logicalcobwebs.proxool.ProxoolDriver"); 
		} catch(Exception e) {
			logger.error("****",e);
		}
	}

	public static Connection getConnection() throws SQLException {
		//2：创建数据库连接，这个参数是一个字符串，是数据源的别名，在配置文件中配置的timalias，参数格式为：proxool.数据源的别名 
        return DriverManager.getConnection("proxool.yangcheke"); 
        
	}
}
