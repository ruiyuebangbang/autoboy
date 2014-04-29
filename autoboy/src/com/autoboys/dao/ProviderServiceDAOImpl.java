package com.autoboys.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.googlecode.s2hibernate.struts2.plugin.annotations.SessionTarget;
import com.googlecode.s2hibernate.struts2.plugin.annotations.TransactionTarget;
import com.autoboys.domain.*;
import com.autoboys.util.ProxoolConnection;

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
	 * 批量更新服务商服务项目
	 */
	@Override
	public int update(Long providerId,List<String> list) {
		
		Connection conn = null;
		PreparedStatement psdel = null;
		PreparedStatement ps = null;
		try {
			String sqldel = "delete from provider_service where provider_id =? ";
			String sql = "insert into provider_service (id, provider_id, service_code) values (s_provider_service.NextVal, ?, ?)";
			//创建SQL执行工具   
			conn = ProxoolConnection.getConnection();
			
			//删除以前设置的汽车品牌
			psdel = conn.prepareStatement(sqldel);
			psdel.setLong(1, providerId);
			psdel.executeUpdate();
			//批量新增汽车品牌			
			ps = conn.prepareStatement(sql);
			for (String brandCode: list) {
				ps.setLong(1, providerId);
				ps.setString(2, brandCode);
				ps.addBatch();
			}
			ps.executeBatch();
			conn.commit();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
				psdel.close();
				conn.close();
			}catch(Exception e) {}
		}
		return 0;
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
