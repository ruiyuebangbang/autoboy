package tst;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.autoboys.domain.Provider;
import com.autoboys.util.ProxoolConnection;

public class DBUtilTst {
    public static void main(String[] args) throws SQLException {  
        //insert_test();  
        //del_test(); 
    	select_test();
    }  
      
    static void insert_test() throws SQLException{  
        Connection conn = ProxoolConnection.getConnection();  
          
        //创建SQL执行工具   
        QueryRunner qRunner = new QueryRunner();   
          
        //执行SQL插入   
        int n = qRunner.update(conn, "insert into user(name,age) values('xxx',22)"); 
        
        System.out.println("成功插入" + n + "条数据！");   
          
        //关闭数据库连接   
        DbUtils.closeQuietly(conn);       
    }   
      
    static void select_test() throws SQLException{  
        Connection conn = ProxoolConnection.getConnection();  
          
        //创建SQL执行工具   
        QueryRunner qRunner = new QueryRunner();   
        List<Provider> list = (List<Provider>) qRunner.query(conn, "select id,short_name,address from provider", new BeanListHandler(Provider.class));   
        //输出查询结果   
        for (Provider user : list) {   
                System.out.println(user.getADDRESS());   
        }   
          
        //关闭数据库连接   
        DbUtils.closeQuietly(conn);   
    }   
  
    static void update_test() throws SQLException{  
        Connection conn =  ProxoolConnection.getConnection();  
          
        //创建SQL执行工具   
        QueryRunner qRunner = new QueryRunner();   
        //执行SQL插入   
        int n = qRunner.update(conn, "update user set name = 'xxx',age=28");   
        System.out.println("成功更新" + n + "条数据！");   
          
        //关闭数据库连接   
        DbUtils.closeQuietly(conn);   
    }   
      
    static void del_test() throws SQLException{  
        Connection conn =  ProxoolConnection.getConnection();    
          
        //创建SQL执行工具   
        QueryRunner qRunner = new QueryRunner();   
        //执行SQL插入   
        int n = qRunner.update(conn, "DELETE from user WHERE name='xxx';");   
        System.out.println("删除成功" + n + "条数据！");   
          
        //关闭数据库连接   
        DbUtils.closeQuietly(conn);   
    } 
}
