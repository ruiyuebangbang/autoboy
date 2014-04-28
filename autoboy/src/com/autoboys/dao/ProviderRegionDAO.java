package com.autoboys.dao;

import java.sql.Connection;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.autoboys.domain.Member;
import com.autoboys.domain.ProviderRegion;
import com.autoboys.util.ProxoolConnection;

import com.googlecode.s2hibernate.struts2.plugin.annotations.SessionTarget;
import com.googlecode.s2hibernate.struts2.plugin.annotations.TransactionTarget;

public class ProviderRegionDAO {
	private static Logger logger = Logger.getLogger(ProviderRegionDAO.class);
	
	@SessionTarget
	Session session;
	
	@TransactionTarget
	Transaction transaction;
	
	/*public static Integer getRegionsParent(int regionid ) {
		
		Connection conn = ProxoolConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement("select from ");
	}*/
	
	public ProviderRegion getObjectById(Long regionid) {
		ProviderRegion obj = null;
		try {
			obj = (ProviderRegion) session.get(ProviderRegion.class, regionid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return obj;
	}
	
	public List<ProviderRegion> getChildrenByParent(Long parent) {
		List<ProviderRegion> rs = null;
		try {
			if( parent == null) {
				Query q = session.createSQLQuery("select * from region where parent_id is null").addEntity(ProviderRegion.class);
				rs = q.list();
			} else {
				Query q = session.createSQLQuery("select * from region where parent_id=?").addEntity(ProviderRegion.class);
				q.setInteger(0, parent.intValue());
				rs = q.list();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
}
