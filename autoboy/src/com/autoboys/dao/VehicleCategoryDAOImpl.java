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

public class VehicleCategoryDAOImpl implements VehicleCategoryDAO {
	
	@SessionTarget
	Session session;
	
	@TransactionTarget
	Transaction transaction;

	/**
	 * 
	 */
	@Override
	@SuppressWarnings("unchecked")
	public String getFullNameByCode(String code) {
		String fullName = null ;
		/*try {
			VehicleBrand vc = (VehicleBrand) session.get(VehicleBrand.class, code);
			if(vc != null)	fullName = vc.getFullName();
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		} */
		return fullName;
	}

	
	@Override
	@SuppressWarnings("unchecked")
	public List<ProviderVehicleBrand> listVehicleByProvider(Long id) {
		List<ProviderVehicleBrand> list = new ArrayList<ProviderVehicleBrand>();
		try {
			String sql = "select t1.*,t2.PROVIDER_ID from vehicle_brand t1 left join PROVIDER_BRAND t2 on t1.code=t2.brand_code and t2.PROVIDER_ID=? " +
					" where 1=1 order by t1.first_character,t1.cname ";
			Connection conn = ProxoolConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setLong(0, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				ProviderVehicleBrand b = new ProviderVehicleBrand();
				b.setCode(rs.getString("code"));
				b.setEname(rs.getString("ename"));
				b.setCname(rs.getString("cname"));
				b.setCode(rs.getString("code"));
			    String tmp = rs.getString("provider_id");
			    if(tmp==null||"".equals(tmp)) {
			    	b.setSelected(new Integer(0));
			    } else {
			    	b.setSelected(new Integer(1));
			    	b.setProvider(Long.valueOf(tmp));
			    }
			}
			rs.close();
			ps.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	@Override
	@SuppressWarnings("unchecked")
	public List<VehicleBrand> getVehicleBrands() {
		List<VehicleBrand> list= null;
		
			try {
				list = session.createQuery("from VehicleBrand").list();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return list;
		
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<String> listVehicleCodeByProvider(Long id) {
		List<String> list = new ArrayList<String>();
		try {
			String sql = "select * from PROVIDER_BRAND t2 where t2.PROVIDER_ID=? ";
			Connection conn = ProxoolConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setLong(1, id);
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


	@SuppressWarnings("unchecked")
	@Override
	public List<VehicleBrand> listVehicleBrandsByFC(String firstCharacter) {
		List<VehicleBrand> list = null;
		try {
			SQLQuery query = session.createSQLQuery("select * from vehicle_category where p_code = '0' and first_character = ? order by first_character");
			query.setParameter(0,firstCharacter);
			query.addEntity(VehicleBrand.class);
			list = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
