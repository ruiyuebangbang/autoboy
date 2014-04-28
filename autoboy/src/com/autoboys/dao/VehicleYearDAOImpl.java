package com.autoboys.dao;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.googlecode.s2hibernate.struts2.plugin.annotations.SessionTarget;
import com.googlecode.s2hibernate.struts2.plugin.annotations.TransactionTarget;
import com.autoboys.domain.*;

public class VehicleYearDAOImpl implements VehicleYearDAO {
	
	@SessionTarget
	Session session;
	
	@TransactionTarget
	Transaction transaction;

	@SuppressWarnings("unchecked")
	public List<VehicleYear> listVehicleYear() {
		List<VehicleYear> courses = null;
		try {
			courses = session.createQuery("from Vehicle_Year").list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return courses;
	}
	
	@Override
	public List<VehicleYear> listByEmissionCode(String emissionCode) {
		List<VehicleYear> list = null;
		try {
			SQLQuery query = session.createSQLQuery("select * from Vehicle_year where emission_code = ?");
			query.setParameter(0,emissionCode);
			query.addEntity(VehicleYear.class);
			list = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}
	
	@Override
	public VehicleYear getVehicleYear(String code) {
		VehicleYear vyear = null;
		try{
			vyear = (VehicleYear) session.get(VehicleYear.class, code);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return vyear;
	}

}
