package com.autoboys.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.googlecode.s2hibernate.struts2.plugin.annotations.SessionTarget;
import com.googlecode.s2hibernate.struts2.plugin.annotations.TransactionTarget;
import com.autoboys.domain.*;
import com.autoboys.util.ProxoolConnection;

public class VehicleDAOImpl implements VehicleDAO {
	
	@SessionTarget
	Session session;
	
	@TransactionTarget
	Transaction transaction;

	@SuppressWarnings("unchecked")
	public List<Vehicle> listVehicle() {
		List<Vehicle> courses = null;
		try {
			courses = session.createQuery("from Vehicle").list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return courses;
	}

	@Override
	public Vehicle getVehicleByPrimaryKey(Integer id) {
		Vehicle vehicle = null;
		try {
			vehicle = (Vehicle) session.get(Vehicle.class, id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vehicle;
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Vehicle> getVehiclesBySE(String seriesCode,String emisionCode) {
		List<Vehicle> list = null;
		try {
			SQLQuery query = session.createSQLQuery("select * from Vehicle where series_code = ? and emission_code = ?");
			query.setParameter(0,seriesCode);
			query.setParameter(1,emisionCode);
			query.addEntity(Vehicle.class);
			list = query.list();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<VehicleEmission> getEmissionsBySeries(String seriesCode) {
		List<VehicleEmission> list = new ArrayList<VehicleEmission>();
		java.sql.Connection conn = null;
		try {
			/*
			Query query = session.createQuery("select distinct series_code,emission_code from Vehicle where series_code = ?");
			query.setParameter(0,seriesCode);
			//query.addEntity(Vehicle.class);
			List<Object[]> olist = query.list();
			for(Object[] ol : olist){  
				Vehicle vehicle = new Vehicle();
				vehicle.setSeriesCode(ol[0].toString());
				vehicle.setEmissionCode(ol[1].toString());
				list.add(vehicle);
			}
			*/
			conn = ProxoolConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement("select distinct series_code,emission_code from Vehicle where series_code = ?");
			ps.setString(1,seriesCode );
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				VehicleEmission ve = new VehicleEmission();
				ve.setSeriesCode(rs.getString("series_code"));
				ve.setCode(rs.getString("emission_code"));
				list.add(ve);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
