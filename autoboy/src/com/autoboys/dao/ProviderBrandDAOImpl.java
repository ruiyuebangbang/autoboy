package com.autoboys.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.googlecode.s2hibernate.struts2.plugin.annotations.SessionTarget;
import com.googlecode.s2hibernate.struts2.plugin.annotations.TransactionTarget;
import com.autoboys.domain.*;
import com.autoboys.util.ProxoolConnection;


public class ProviderBrandDAOImpl implements ProviderBrandDAO {
	
	@SessionTarget
	Session session;
	
	@TransactionTarget
	Transaction transaction;

	@SuppressWarnings("unchecked")
	@Override
	public List<ProviderBrand> listProviderBrand(Long providerId) {
		List<ProviderBrand> list = null;
		try {
			SQLQuery query = session.createSQLQuery("select * from provider_Brand where provider_id = ?");
			query.setParameter(0,providerId);
			query.addEntity(ProviderBrand.class);
			list = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	/**
	 * 获得服务商服务品牌Code
	 * @param id
	 * @return
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<String> listProviderBrandCode(Long providerId) {
		List<String> list = new ArrayList<String>();
		try {
			
			String sql = "select * from PROVIDER_BRAND t2 where t2.PROVIDER_ID=? ";
			Connection conn = ProxoolConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setLong(1, providerId);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				list.add(rs.getString("BRAND_CODE"));
			}
			rs.close();
			ps.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	/**
	 * 批量插入服务商选择服务的汽车品牌
	 */
	@Override
	public int insert(Long providerId,List<String> list) {
		
		Connection conn = null;
		PreparedStatement psdel = null;
		PreparedStatement ps = null;
		try {
			String sqldel = "delete from provider_brand where provider_id =? ";
			String sql = "insert into provider_brand (id, provider_id, brand_code) values (s_provider_brand.NextVal, ?, ?)";
			//创建SQL执行工具   
			conn = ProxoolConnection.getConnection();
			psdel = conn.prepareStatement(sqldel);
			psdel.setLong(1, providerId);
			psdel.executeUpdate();
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

	
}
