package com.autoboys.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.googlecode.s2hibernate.struts2.plugin.annotations.SessionTarget;
import com.googlecode.s2hibernate.struts2.plugin.annotations.TransactionTarget;
import com.autoboys.domain.*;

public class ServiceDAOImpl implements ServiceDAO {
	
	@SessionTarget
	Session session;
	
	@TransactionTarget
	Transaction transaction;

	/**
	 * Used to save or update a service.
	 */
	public void saveOrUpdateService(Service service) {
		try {
			session.saveOrUpdate(service);
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		}
	}

	/**
	 * Used to delete a service.
	 */
	
	public void deleteService(String serviceId) {
		try {
			Service service = (Service) session.get(Service.class, serviceId);
			session.delete(service);
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		} 
	}
	
	/**
	 * Used to list all the services.
	 */
	@SuppressWarnings("unchecked")
	public List<Service> listService() {
		List<Service> courses = null;
		try {
			courses = session.createQuery("from Service").list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return courses;
	}

	/**
	 * Used to list a single service by Id.
	 */
	
	public Service listServiceById(String serviceId) {
		Service service = null;
		try {
			service = (Service) session.get(Service.class, serviceId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return service;
	}

	public List<Service> listServiceByCatId(String catId) {
		List<Service> courses = null;
		try {
			
			Query q = session.createSQLQuery("select * from Service where CATEGORY_CODE=?").addEntity(Service.class);
			q.setString(0, catId);
			courses = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return courses;
	}
}
