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

public class VehicleSeriesDAOImpl implements VehicleSeriesDAO {
	
	@SessionTarget
	Session session;
	
	@TransactionTarget
	Transaction transaction;

	@SuppressWarnings("unchecked")
	public List<VehicleSeries> listVehicleSeries() {
		List<VehicleSeries> list = null;
		try {
			//courses = session.createQuery("from Vehicle_series").list();
			SQLQuery query = session.createSQLQuery("select * from Vehicle_Series");
			query.addEntity(VehicleSeries.class);
			list = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<VehicleSeries> listByBrandCode(String brandCode) {
		List<VehicleSeries> list = null;
		try {
			SQLQuery query = session.createSQLQuery("select * from Vehicle_Series where brand_code = ?");
			query.setParameter(0,brandCode);
			query.addEntity(VehicleSeries.class);
			list = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}

	
	@Override
	public VehicleSeries getVehicleSeries(String code) {
		VehicleSeries series = null;
		try{
			series = (VehicleSeries) session.get(VehicleSeries.class, code);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return series;
	}

	public List<VehicleSeries> listMappingSeries(long productId,String brandCode) {
		List<VehicleSeries> list = null;
		Connection conn = null;
		try {
			//创建SQL执行工具   
			conn = ProxoolConnection.getConnection();
	        QueryRunner qRunner = new QueryRunner();   
	        String sql = " select distinct t3.* from vehicle_series t3 left join vehicle t1 on t1.series_code =t3.code left join product_vehicle t2 on t1.id=t2.VEHICLE_ID and t2.product_id=?  where t3.brand_code=?";
	        list = (List<VehicleSeries>) qRunner.query(conn, sql, new BeanListHandler(VehicleSeries.class),productId,brandCode); 
	        
	        //输出查询结果   
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtils.closeQuietly(conn);
		}
		return list;
	}
}
