package com.autoboys.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="provider_service")
public class ProviderService {

	private Long id;
	private String serviceCode;
	private String labourPrice;
	private String providerId;
	
	
	@Id
	@GeneratedValue
	@Column(name="ID")	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	@Column(name="service_code")
	public String getServiceCode() {
		return serviceCode;
	}
	public void setServiceCode(String serviceCode) {
		this.serviceCode = serviceCode;
	}
	
	@Column(name="labour_price")
	public String getLabourPrice() {
		return labourPrice;
	}
	public void setLabourPrice(String labourPrice) {
		this.labourPrice = labourPrice;
	}
	
	@Column(name="provider_id")
	public String getProviderId() {
		return providerId;
	}
	public void setProviderId(String providerId) {
		this.providerId = providerId;
	}
	
	

}
