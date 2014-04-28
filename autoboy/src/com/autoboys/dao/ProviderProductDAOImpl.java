package com.autoboys.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.googlecode.s2hibernate.struts2.plugin.annotations.SessionTarget;
import com.googlecode.s2hibernate.struts2.plugin.annotations.TransactionTarget;
import com.autoboys.domain.*;
import com.autoboys.util.ProxoolConnection;

public class ProviderProductDAOImpl implements ProviderProductDAO {
	
	@SessionTarget
	Session session;
	
	@TransactionTarget
	Transaction transaction;

	/**
	 * Used to save or update a providerProduct.
	 */
	public void saveOrUpdateProviderProduct(ProviderProduct providerProduct) {
		try {
			session.saveOrUpdate(providerProduct);
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		}
	}

	/**
	 * Used to delete a providerProduct.
	 */
	
	public void deleteProviderProduct(Long providerProductId) {
		try {
			ProviderProduct providerProduct = (ProviderProduct) session.get(ProviderProduct.class, providerProductId);
			session.delete(providerProduct);
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		} 
	}
	
	/**
	 * Used to list all the providerProducts.
	 */
	@SuppressWarnings("unchecked")
	public List<ProviderProduct> listProviderProduct() {
		List<ProviderProduct> courses = null;
		try {
			courses = session.createQuery("from ProviderProduct").list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return courses;
	}

	/**
	 * Used to list a single providerProduct by Id.
	 */
	
	public ProviderProduct listProviderProductById(Long providerProductId) {
		ProviderProduct providerProduct = null;
		try {
			providerProduct = (ProviderProduct) session.get(ProviderProduct.class, providerProductId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return providerProduct;
	}

	public List<String> listDistinctProduct() {
		List<String> courses = null;
		try {
			courses = session.createSQLQuery("select distinct name from product").list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return courses;
	}
	
	
	public List<ProviderProduct> qryProductsList(ProviderProduct cnds, int pageNo ,int pageSize) {
		List<ProviderProduct> courses = new ArrayList<ProviderProduct>();
		try {
			StringBuilder sb =  new StringBuilder("select t1.*,t2.id pid,t2.provider_id,t2.discount_price,T2.LABOUR_PRICE,t2.discount_price+t2.labour_price total_price from product t1 ")
			.append(" left join provider_product t2 on T1.ID = T2.PRODUCT_ID where 1=1 ");
			if(cnds.getService_id() != null && !"".equals(cnds.getService_id())) {
				sb.append(" and t1.service_id='").append(cnds.getService_id()).append("' ");
			}
			if(cnds.getBrand_id() != null) {
				sb.append(" and t1.brand_id=").append(cnds.getBrand_id());
			}
			if(cnds.getName() != null && !"".equals(cnds.getName())) {
				sb.append(" and t1.name='").append(cnds.getName()).append("' ");
			}
			sb.append(" order by t1.name,t2.discount_price nulls first ");
			String sql = "select b.*,f_getProviderProductMaxPrice(id) max_price, f_getProviderProductMinPrice(id) min_price from (select a.*,rownum rn from (" + sb.toString() + ") a where rownum<=?)b where rn>? ";
			/*Query q = session.createSQLQuery(sql).addEntity(ProviderProduct.class);
			q.setInteger(0, pageNo*pageSize);
			q.setInteger(1, (pageNo-1)*pageSize);
			courses = q.list();*/
			
			java.sql.Connection conn = null;
			try {
				conn = ProxoolConnection.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setInt(1, pageNo*pageSize);
				ps.setInt(2, (pageNo-1)*pageSize);
				ResultSet rs = ps.executeQuery();
				String tmp;
				while(rs.next()) {
					ProviderProduct p = new ProviderProduct();
					tmp = rs.getString("pid");
					if(tmp!=null &&!"".equals(tmp)) {
						p.setId(Long.valueOf(tmp));
					} 
					p.setName(rs.getString("name"));
					
					tmp = rs.getString("id");
					if(tmp!=null &&!"".equals(tmp)) {
						p.setProduct_id(Long.valueOf(tmp));
					} 
					tmp = rs.getString("provider_id");
					if(tmp!=null &&!"".equals(tmp)) {
						p.setProvider_id(Long.valueOf(tmp));
					} 

					p.setService_id(rs.getString("service_id"));
					p.setSpecification(rs.getString("specification"));
					
					tmp = rs.getString("standard_price");
					if(tmp!=null &&!"".equals(tmp)) {
						p.setStandard_price(Double.valueOf(tmp));
					} 					
					tmp = rs.getString("discount_price");
					if(tmp!=null &&!"".equals(tmp)) {
						p.setDiscount_price(Double.valueOf(tmp));
					} 
					tmp = rs.getString("labour_price");
					if(tmp!=null &&!"".equals(tmp)) {
						p.setLabour_price(Double.valueOf(tmp));
					} 
					tmp = rs.getString("total_price");
					if(tmp!=null &&!"".equals(tmp)) {
						p.setTotal_price(Double.valueOf(tmp));
					} 
					tmp = rs.getString("max_price");
					if(tmp!=null &&!"".equals(tmp)) {
						p.setMax_price(Double.valueOf(tmp));
					} 		
					tmp = rs.getString("min_price");
					if(tmp!=null &&!"".equals(tmp)) {
						p.setMin_price(Double.valueOf(tmp));
					} 
					courses.add(p);
				}
				rs.close();
				ps.close();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				try {conn.close();}catch(Exception e){}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return courses;
	}	
	
	
	public int qryProductsCount(ProviderProduct cnds) {
		int ret = 0;
		try {
			StringBuilder sb =  new StringBuilder("select count(1) from product t1 where 1=1 ");
			if(cnds.getService_id() != null && !"".equals(cnds.getService_id())) {
				sb.append(" and t1.service_id='").append(cnds.getService_id()).append("' ");
			}
			if(cnds.getBrand_id() != null) {
				sb.append(" and t1.brand_id=").append(cnds.getBrand_id());
			}
			if(cnds.getName() != null && !"".equals(cnds.getName())) {
				sb.append(" and t1.name='").append(cnds.getName()).append("' ");
			}
			
			Query q = session.createSQLQuery(sb.toString());
			ret = ((java.math.BigDecimal)q.uniqueResult()).intValue();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ret;
	}	
	
	public void updatePrice(String id, String discountPrice, String labourPrice) {
		Query q = session.createSQLQuery("update provider_product set discount_price=?,labour_price=? where id=?");
		q.setDouble(0, Double.valueOf(discountPrice));
		q.setDouble(1, Double.parseDouble(labourPrice));
		q.setInteger(2, Integer.parseInt(id));
		q.executeUpdate();
	}
	
	public Long save(Long provid, String product, String discountPrice, String labourPrice) {
		long ret =0;
		java.sql.Connection conn = null;
		try {
			conn = ProxoolConnection.getConnection();
			CallableStatement cs = conn.prepareCall("{? = call f_insertProviderProduct(?, ? ,? ,?)}");  
			cs.registerOutParameter(1, Types.INTEGER); 	
			cs.setLong(2,provid );  
			cs.setString(3, product);  
			cs.setString(4, discountPrice);
			cs.setString(5, labourPrice);
			cs.executeUpdate();  
			ret = cs.getLong(1);
			cs.close();	
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {conn.close();}catch(Exception e) {}
		}
		return ret;
	}
	
	
}
