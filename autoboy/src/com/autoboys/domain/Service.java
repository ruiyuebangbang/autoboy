package com.autoboys.domain;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="SERVICE")
public class Service {

	String	  CODE         ;
	String	  NAME         ;
	String	  CATEGORY_CODE  ;
	String	  REMARK         ;
	Double	  MIN_PRICE     ;
	Double	  MAX_PRICE     ;
	private ServiceCat serviceCat;
	
	@Id
	@Column(name="code")
	public String getCODE() {
		return CODE;
	}
	public void setCODE(String cODE) {
		CODE = cODE;
	}
	@Column(name="name")
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	@Column(name="category_code")
	public String getCATEGORY_CODE() {
		return CATEGORY_CODE;
	}
	public void setCATEGORY_CODE(String cATEGORY_CODE) {
		CATEGORY_CODE = cATEGORY_CODE;
	}
	@Column(name="remark")
	public String getREMARK() {
		return REMARK;
	}
	public void setREMARK(String rEMARK) {
		REMARK = rEMARK;
	}
	@Column(name="min_price")
	public Double getMIN_PRICE() {
		return MIN_PRICE;
	}
	public void setMIN_PRICE(Double mIN_PRICE) {
		MIN_PRICE = mIN_PRICE;
	}
	@Column(name="max_price")
	public Double getMAX_PRICE() {
		return MAX_PRICE;
	}
	public void setMAX_PRICE(Double mAX_PRICE) {
		MAX_PRICE = mAX_PRICE;
	}
	

}
