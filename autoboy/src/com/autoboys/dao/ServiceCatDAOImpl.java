package com.autoboys.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.googlecode.s2hibernate.struts2.plugin.annotations.SessionTarget;
import com.googlecode.s2hibernate.struts2.plugin.annotations.TransactionTarget;
import com.autoboys.domain.*;

public class ServiceCatDAOImpl implements ServiceCatDAO {
	
	@SessionTarget
	Session session;
	
	@TransactionTarget
	Transaction transaction;

	/**
	 * Used to save or update a serviceItem.
	 */
	public void saveOrUpdateServiceCat(ServiceCat serviceItem) {
		try {
			session.saveOrUpdate(serviceItem);
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		}
	}

	/**
	 * Used to delete a serviceItem.
	 */
	
	public void deleteServiceCat(String serviceItemId) {
		try {
			ServiceCat serviceItem = (ServiceCat) session.get(ServiceCat.class, serviceItemId);
			session.delete(serviceItem);
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		} 
	}
	
	/**
	 * Used to list all the serviceItems.
	 */
	@SuppressWarnings("unchecked")
	public List<ServiceCat> listServiceCat() {
		List<ServiceCat> courses = null;
		try {
			courses = session.createQuery("from ServiceCat").list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return courses;
	}

	/**
	 * Used to list a single serviceItem by Id.
	 */
	
	public ServiceCat listServiceCatById(String serviceItemId) {
		ServiceCat serviceItem = null;
		try {
			serviceItem = (ServiceCat) session.get(ServiceCat.class, serviceItemId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return serviceItem;
	}

}
