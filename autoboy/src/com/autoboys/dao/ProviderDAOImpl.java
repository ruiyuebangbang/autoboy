package com.autoboys.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.googlecode.s2hibernate.struts2.plugin.annotations.SessionTarget;
import com.googlecode.s2hibernate.struts2.plugin.annotations.TransactionTarget;
import com.autoboys.domain.*;
import com.autoboys.util.*;
public class ProviderDAOImpl implements ProviderDAO {
	
	@SessionTarget
	Session session;
	
	@TransactionTarget
	Transaction transaction;

	/**
	 * Used to save or update a provider.
	 */
	public void saveOrUpdateProvider(Provider provider) {
		try {
			session.saveOrUpdate(provider);
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		}
	}

	/**
	 * Used to delete a provider.
	 */
	
	public void deleteProvider(Long providerId) {
		try {
			Provider provider = (Provider) session.get(Provider.class, providerId);
			session.delete(provider);
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		} 
	}
	
	/**
	 * Used to list all the providers.
	 */
	@SuppressWarnings("unchecked")
	public List<Provider> listProvider() {
		List<Provider> courses = null;
		try {
			courses = session.createQuery("from Provider").list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return courses;
	}

	/**
	 * Used to list a single provider by Id.
	 */
	
	public Provider listProviderById(Long providerId) {
		Provider provider = null;
		/*try {
			provider = (Provider) session.get(Provider.class, providerId);
		} catch (Exception e) {
			e.printStackTrace();
		}*/
		java.sql.Connection conn = null;
		try {
			String sql = "select * from provider where id=?";
			conn = ProxoolConnection.getConnection();
	        QueryRunner qRunner = new QueryRunner();   
	        provider = (Provider) qRunner.query(conn, sql, new BeanHandler(Provider.class),providerId);

		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {conn.close();}catch(Exception e){}
		}
		return provider;
	}

	/**
	 * 更新主要信息
	 */
	public int updateMainInfo(Provider provider) {
		int ret = 0;
		try {
			String sql = " update Provider set REGION_ID =?, SHORT_NAME=?,FULL_NAME=?, AGENT=?,TELEPHONE=?, "   
      + " SERVICE_PHONE=?,SERVICE_TIME=?,ADDRESS=?,REMARK=?,QUALIFICATION=?"
      + " where id = ?";
			session.beginTransaction();
			Query q = session.createQuery(sql);
			
			q.setLong(0, provider.getREGION_ID()==null? 0:provider.getREGION_ID());
			q.setString(1, provider.getSHORT_NAME());
			q.setString(2, provider.getFULL_NAME());
			q.setString(3, provider.getAGENT());
			q.setString(4, provider.getTELEPHONE());
			q.setString(5, provider.getSERVICE_PHONE());
			q.setString(6, provider.getSERVICE_TIME());
			q.setString(7, provider.getADDRESS());
			q.setString(8, provider.getREMARK());
			q.setString(9, provider.getQUALIFICATION());
			q.setLong(10, provider.getID());
			ret = q.executeUpdate();
			
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return ret;
	}
	
	public int updateLogo(Provider prov) {
		int ret = 0;
		Connection conn = null;
		try {
			conn = ProxoolConnection.getConnection();
			CallableStatement cs = conn.prepareCall(" update provider set logo =? where id = ?");
			cs.setString(1,prov.getLOGO());
			cs.setLong(2, prov.getID());

			ret = cs.executeUpdate();
			
			//session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			//session.getTransaction().rollback();
		} finally {
			try {conn.close();}catch(Exception e){}
		}
		return ret;
	}
	
	public int updateLogo(Long id, String logo) {
		int ret = 0;
		try {
			String sql = " update provider set logo =? where id = ?";
			session.beginTransaction();
			Query q = session.createSQLQuery(sql);
			
			q.setString(0,logo);
			q.setLong(1, id);

			ret = q.executeUpdate();
			
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return ret;
	}
	
	public int updateImage(Long providerId,String imagePath,int index) {
		int ret = 0;
		Connection conn = null;
		try {
			conn = ProxoolConnection.getConnection();
			CallableStatement cs = conn.prepareCall("{Call p_update_provider_image(?,?)}");
			cs.setLong(1, providerId);
			cs.setString(2, imagePath);
			cs.executeUpdate();
			cs.close();
			
		} catch (Exception e) {
			e.printStackTrace();
			//session.getTransaction().rollback();
		} finally {
			try {conn.close();}catch(Exception e){}
		}
		return ret;
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Provider> qryAuditProviderList(int pageNo ,int pageSize) {
		List<Provider> list = new ArrayList<Provider>();
		try {
			java.sql.Connection conn = null;
			try {
				String sql = "select b.*,f_getRegionName(b.REGION_ID) regionName from (select a.*,rownum rn from (select * from provider where status is null  or status =0 order by status,apply_date) a where rownum<=?) b where rn >?";
				conn = ProxoolConnection.getConnection();
		        QueryRunner qRunner = new QueryRunner();   
		        list = (List<Provider>) qRunner.query(conn, sql, new BeanListHandler(Provider.class),pageNo*pageSize,(pageNo-1)*pageSize);
		        
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				try {conn.close();}catch(Exception e){}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}	
	
	
	public int qryAuditProviderCnt() {
		int ret = 0;
		try {
			StringBuilder sb =  new StringBuilder("select count(1) from provider where status=0 or status is null ");
			Query q = session.createSQLQuery(sb.toString());
			ret = ((java.math.BigDecimal)q.uniqueResult()).intValue();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ret;
	}	
	
	public int auditProvider(Long providerId,int stat) {
		int ret = 0, mbstat=0, prstat=0 ;
		if( stat == 1) {
			prstat=1;
			mbstat=1;
		} else {
			prstat=2;
			mbstat=0;
		}
		Connection conn = null;
		try {
			conn = ProxoolConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(" update provider set status=? where id = ?");
			ps.setInt(1, prstat);
			ps.setLong(2, providerId);
			ret = ps.executeUpdate();
			
			ps = conn.prepareStatement(" update member set IS_DISABLED =? where PROVIDER_ID = ?");
			ps.setInt(1, mbstat);
			ps.setLong(2, providerId);
			ret = ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			//session.getTransaction().rollback();
		} finally {
			try {conn.close();}catch(Exception e){}
		}
		return ret;
	}
	
	public List<Provider> qryProviderList(String name,Long reg1,Long reg2,int pageNo ,int pageSize) {
		List<Provider> list = new ArrayList<Provider>();
		try {
			java.sql.Connection conn = null;
			try {
				StringBuilder sb = new StringBuilder("select b.*,f_getRegionName(b.REGION_ID) regionName from (select a.*,rownum rn from (select * from provider where 1=1 "); 
				if(name!=null&&!"".equals(name)) {
					sb.append(" and short_name like '%").append(StringUtil.fiterSQLParam(name)).append("%' ");
				}
				if(reg2!=null) {
					sb.append(" and region_id in (select id from region where parent_id=").append(reg2).append(")");
				} else if (reg1!=null) {
					sb.append(" and region_id in (select id from region where parent_id in (select id from region where parent_id=").append(reg1).append("))");
				}
				sb.append("order by status,apply_date) a where rownum<=?) b where rn >?");
				conn = ProxoolConnection.getConnection();
		        QueryRunner qRunner = new QueryRunner();   
		        list = (List<Provider>) qRunner.query(conn, sb.toString(), new BeanListHandler(Provider.class),pageNo*pageSize,(pageNo-1)*pageSize);
		        
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				try {conn.close();}catch(Exception e){}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}	
	
	
	public int qryProviderCnt(String name,Long reg1,Long reg2) {
		int ret = 0;
		try {
			StringBuilder sb =  new StringBuilder("select count(1) from provider where 1=1 ");
			if(name!=null&&!"".equals(name)) {
				sb.append(" and short_name like '%").append(StringUtil.fiterSQLParam(name)).append("%' ");
			}
			if(reg2!=null) {
				sb.append(" and region_id in (select id from region where parent_id=").append(reg2).append(")");
			} else if (reg1!=null) {
				sb.append(" and region_id in (select id from region where parent_id in (select id from region where parent_id=").append(reg1).append("))");
			}
			Query q = session.createSQLQuery(sb.toString());
			ret = ((java.math.BigDecimal)q.uniqueResult()).intValue();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ret;
	}	
	
	public int insertProvider(Member mb,Provider pro) {
		int ret =0;
		java.sql.Connection conn = null;
		try {
			conn = ProxoolConnection.getConnection();
			CallableStatement cs = conn.prepareCall("{? = call f_insertProvider(?, ? ,? ,?,?)}");  
			cs.registerOutParameter(1, Types.INTEGER); 	
			cs.setString(2,pro.getSHORT_NAME());
			cs.setString(3, mb.getNickName());  
			cs.setString(4, mb.getMobilePhone());
			cs.setString(5, mb.getPassword());
			cs.setLong(6,pro.getREGION_ID());
			cs.executeUpdate();  
			ret = cs.getInt(1);
			cs.close();	
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {conn.close();}catch(Exception e) {}
		}
		return ret;
	}
}
