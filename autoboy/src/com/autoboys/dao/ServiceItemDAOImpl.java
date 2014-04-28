package com.autoboys.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.googlecode.s2hibernate.struts2.plugin.annotations.SessionTarget;
import com.googlecode.s2hibernate.struts2.plugin.annotations.TransactionTarget;
import com.autoboys.domain.*;

public class ServiceItemDAOImpl implements ServiceItemDAO {
	
	@SessionTarget
	Session session;
	
	@TransactionTarget
	Transaction transaction;

	/**
	 * Used to save or update a serviceItem.
	 */
	public void saveOrUpdateServiceItem(ServiceItem serviceItem) {
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
	
	public void deleteServiceItem(Long serviceItemId) {
		try {
			ServiceItem serviceItem = (ServiceItem) session.get(ServiceItem.class, serviceItemId);
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
	public List<ServiceItem> listServiceItem() {
		List<ServiceItem> courses = null;
		try {
			courses = session.createQuery("from ServiceItem").list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return courses;
	}

	/**
	 * Used to list a single serviceItem by Id.
	 */
	
	public ServiceItem listServiceItemById(Long serviceItemId) {
		ServiceItem serviceItem = null;
		try {
			serviceItem = (ServiceItem) session.get(ServiceItem.class, serviceItemId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return serviceItem;
	}

}
