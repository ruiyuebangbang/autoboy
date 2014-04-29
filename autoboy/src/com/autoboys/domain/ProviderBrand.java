package com.autoboys.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="USERS")
public class ProviderBrand {
	private long id;
	private long providerId;
	private String brandCode;
	
	@Id
	@GeneratedValue
	@Column(name="ID")	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	@Column(name="provider_id")
	public long getProviderId(){
		return providerId;
	}
	public void setProviderId(long providerId){
		this.providerId = providerId;
	}
	
	@Column(name="brand_code")
	public String getBrandCode(){
		return brandCode;
	}
	public void setBrandCode(String brandCode){
		this.brandCode = brandCode;
	}
	

}
