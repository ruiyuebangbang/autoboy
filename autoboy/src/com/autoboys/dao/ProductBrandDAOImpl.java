package com.autoboys.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.autoboys.domain.ProductBrand;
import com.autoboys.domain.ProviderRegion;
import com.autoboys.domain.Service;
import com.autoboys.domain.ServiceCat;
import com.googlecode.s2hibernate.struts2.plugin.annotations.SessionTarget;
import com.googlecode.s2hibernate.struts2.plugin.annotations.TransactionTarget;


public class ProductBrandDAOImpl {
	@SessionTarget
	Session session;

	@TransactionTarget
	Transaction transaction;
	
	
	/**
	 * Used to list all the serviceItems.
	 */
	@SuppressWarnings("unchecked")
	public List<ProductBrand> listBrands() {
		List<ProductBrand> courses = null;
		try {
			courses = session.createSQLQuery("select * from Product_Brand").addEntity(ProductBrand.class).list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return courses;
	}
	
	public List<ProductBrand> listBrandsByservice(String catId) {
		List<ProductBrand> courses = null;
		try {
			String sql="select distinct t1.id,t1.name from product_brand t1  join product t2 on T1.ID = T2.BRAND_id where T2.SERVICE_ID=?";
			Query q = session.createSQLQuery(sql).addEntity(ProductBrand.class);
			q.setString(0, catId);
			courses = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return courses;
	}
}

