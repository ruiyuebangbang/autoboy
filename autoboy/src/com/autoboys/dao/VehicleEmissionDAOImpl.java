package com.autoboys.dao;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.googlecode.s2hibernate.struts2.plugin.annotations.SessionTarget;
import com.googlecode.s2hibernate.struts2.plugin.annotations.TransactionTarget;
import com.autoboys.domain.*;

public class VehicleEmissionDAOImpl implements VehicleEmissionDAO {
	
	@SessionTarget
	Session session;
	
	@TransactionTarget
	Transaction transaction;

	@SuppressWarnings("unchecked")
	public List<VehicleEmission> listVehicleEmission() {
		List<VehicleEmission> list = null;
		try {
			//courses = session.createQuery("from Vehicle_series").list();
			SQLQuery query = session.createSQLQuery("select * from Vehicle_emission");
			query.addEntity(VehicleEmission.class);
			list = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<VehicleEmission> listBySeriesCode(String seriesCode) {
		List<VehicleEmission> list = null;
		try {
			SQLQuery query = session.createSQLQuery("select * from Vehicle_emission where series_code = ?");
			query.setParameter(0,seriesCode);
			query.addEntity(VehicleEmission.class);
			list = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public VehicleEmission getVehicleEmission(String code) {
		VehicleEmission emission = null;
		try{
			emission = (VehicleEmission) session.get(VehicleEmission.class, code);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return emission;
	}

	@Override
	public void saveOrUpdateEmission(VehicleEmission emission) {
		try {
			session.saveOrUpdate(emission);
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		}
		
	}

}
