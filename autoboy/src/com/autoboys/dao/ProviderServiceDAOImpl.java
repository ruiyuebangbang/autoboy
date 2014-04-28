package com.autoboys.dao;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.googlecode.s2hibernate.struts2.plugin.annotations.SessionTarget;
import com.googlecode.s2hibernate.struts2.plugin.annotations.TransactionTarget;
import com.autoboys.domain.*;

public class ProviderServiceDAOImpl implements ProviderServiceDAO {
	
	@SessionTarget
	Session session;
	
	@TransactionTarget
	Transaction transaction;

	/**
	 * Used to save or update a providerService.
	 */
	public void saveOrUpdateProviderService(ProviderService providerService) {
		try {
			session.saveOrUpdate(providerService);
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		}
	}

	/**
	 * Used to delete a providerService.
	 */
	
	public void deleteProviderService(Long providerServiceId) {
		try {
			ProviderService providerService = (ProviderService) session.get(ProviderService.class, providerServiceId);
			session.delete(providerService);
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		} 
	}
	
	/**
	 * Used to list all the providerServices.
	 */
	@SuppressWarnings("unchecked")
	public List<ProviderService> listProviderService() {
		List<ProviderService> courses = null;
		try {
			courses = session.createQuery("from ProviderService").list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return courses;
	}
	
	@SuppressWarnings("unchecked")
	public List<ProviderService> listProviderService(long providerId) {
		List<ProviderService> list = null;
		try {
			SQLQuery query = session.createSQLQuery("select * from provider_service where provider_id = ?");
			query.setParameter(0,providerId);
			query.addEntity(ProviderService.class);
			list = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * Used to list a single providerService by Id.
	 */
	
	public ProviderService listProviderServiceById(Long providerServiceId) {
		ProviderService providerService = null;
		try {
			providerService = (ProviderService) session.get(ProviderService.class, providerServiceId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return providerService;
	}

}
