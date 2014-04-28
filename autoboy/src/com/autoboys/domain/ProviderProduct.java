package com.autoboys.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="PROVIDER_PRODUCT")
public class ProviderProduct {

	Long	  id  ;
	Long	  provider_id; 
	Long 	  product_id;

	String	  service_id;
	Long	  brand_id;
	String    name;
	String	  specification;
	Double	  standard_price;
	Double	  discount_price;
	Double	  labour_price;
	
	Double    max_price;
	Double 	  min_price;
	Double    total_price;
	
	public Double getMax_price() {
		return max_price;
	}
	public Double getMin_price() {
		return min_price;
	}
	public void setMax_price(Double max_price) {
		this.max_price = max_price;
	}
	public void setMin_price(Double min_price) {
		this.min_price = min_price;
	}
	@Id
	@Column(name="ID")
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getProvider_id() {
		return provider_id;
	}
	public void setProvider_id(Long provider_id) {
		this.provider_id = provider_id;
	}
	public String getService_id() {
		return service_id;
	}
	public void setService_id(String service_id) {
		this.service_id = service_id;
	}
	public Long getBrand_id() {
		return brand_id;
	}
	public void setBrand_id(Long brand_id) {
		this.brand_id = brand_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSpecification() {
		return specification;
	}
	public void setSpecification(String specification) {
		this.specification = specification;
	}
	public Double getStandard_price() {
		return standard_price;
	}
	public void setStandard_price(Double standard_price) {
		this.standard_price = standard_price;
	}
	public Double getDiscount_price() {
		return discount_price;
	}
	public void setDiscount_price(Double discount_price) {
		this.discount_price = discount_price;
	}
	public Double getLabour_price() {
		return labour_price;
	}
	public void setLabour_price(Double labour_price) {
		this.labour_price = labour_price;
	}
	public Double getTotal_price() {
		return total_price;
	}
	public void setTotal_price(Double total_price) {
		this.total_price = total_price;
	}	
	public Long getProduct_id() {
		return product_id;
	}
	public void setProduct_id(Long product_id) {
		this.product_id = product_id;
	}	
	
	/*public Double getTotal_price() {
		return discount_price.doubleValue() + labour_price.doubleValue();
	}*/
}
