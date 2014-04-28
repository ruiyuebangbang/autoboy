package com.autoboys.dao;

import java.sql.Connection;
import java.util.List;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.googlecode.s2hibernate.struts2.plugin.annotations.SessionTarget;
import com.googlecode.s2hibernate.struts2.plugin.annotations.TransactionTarget;
import com.autoboys.domain.*;
import com.autoboys.util.ProxoolConnection;

public class VehicleBrandDAOImpl implements VehicleBrandDAO {
	
	@SessionTarget
	Session session;
	
	@TransactionTarget
	Transaction transaction;

	@SuppressWarnings("unchecked")
	public List<VehicleBrand> listVehicleBrand() {
		List<VehicleBrand> courses = null;
		try {
			courses = session.createQuery("from VehicleBrand").list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return courses;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<VehicleBrand> listVehicleBrandByFC(String fc) {
		List<VehicleBrand> list = null;
		try {
			SQLQuery query = session.createSQLQuery("select * from Vehicle_Brand where first_character = ?");
			query.setParameter(0,fc);
			query.addEntity(VehicleBrand.class);
			list = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public VehicleBrand getVehicleBrand(String code) {
		VehicleBrand brand = null;
		try{
			brand = (VehicleBrand) session.get(VehicleBrand.class, code);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return brand;
	}

	@Override
	public List<VehicleBrand> listHotVehicleBrand() {
		List<VehicleBrand> list = null;
		try {
			SQLQuery query = session.createSQLQuery("select * from Vehicle_Brand where is_hot = 1");
			query.addEntity(VehicleBrand.class);
			list = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	/*public List<VehicleBrand> listMappingBrand(long productId) {
		List<VehicleBrand> list = null;
		Connection conn = null;
		try {
			//创建SQL执行工具   
			conn = ProxoolConnection.getConnection();
	        QueryRunner qRunner = new QueryRunner();   
	        String sql = " select distinct t3.*,nvl2(t2.product_id,'checked','') mapped from vehicle_brand t3 left join vehicle t1 on t1.BRAND_CODE=t3.code left join product_vehicle t2 on t1.id=t2.VEHICLE_ID and t2.product_id=? ";
	        list = (List<VehicleBrand>) qRunner.query(conn, sql, new BeanListHandler(VehicleBrand.class),productId); 
	        
	        //输出查询结果   
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtils.closeQuietly(conn);
		}
		return list;
	}*/
	
	public List<VehicleBrand> listBrandByProduct(long productId) {
		List<VehicleBrand> list = null;
		Connection conn = null;
		try {
			//创建SQL执行工具   
			conn = ProxoolConnection.getConnection();
	        QueryRunner qRunner = new QueryRunner();   
	        String sql = " select distinct t3.* from vehicle_brand t3 join vehicle t1 on t1.BRAND_CODE=t3.code join product_vehicle t2 on t1.id=t2.VEHICLE_ID and t2.product_id=? ";
	        list = (List<VehicleBrand>) qRunner.query(conn, sql, new BeanListHandler(VehicleBrand.class),productId); 
	        
	        //输出查询结果   
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtils.closeQuietly(conn);
		}
		return list;
	}
}
