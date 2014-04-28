package com.autoboys.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="vehicle_category")
public class VehicleCategory {

	private String code;
	private String cname;
	private String ename;
	private String firstCharacter;
	private String pcode;
	private String manufacturer;
	private String logoSmall;
	private String logoLarge;
	private String fullName;
	
	@Id
	@GeneratedValue
	@Column(name="code")	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	@Column(name="cname")
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	
	@Column(name="ename")
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	
	@Column(name="first_character")
	public String getFirstCharacter() {
		return firstCharacter;
	}
	public void setFirstCharacter(String firstCharacter) {
		this.firstCharacter = firstCharacter;
	}
	
	@Column(name="manufacturer")
	public String getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}
	@Column(name="logo_small")
	public String getLogoSmall() {
		return logoSmall;
	}
	public void setLogoSmall(String logoSmall) {
		this.logoSmall = logoSmall;
	}
	@Column(name="logo_large")
	public String getLogoLarge() {
		return logoLarge;
	}
	public void setLogoLarge(String logoLarge) {
		this.logoLarge = logoLarge;
	}
	@Column(name="p_code")
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	
	@Column(name="full_name")
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	
	

}
