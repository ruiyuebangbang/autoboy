package com.autoboys.domain;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="vehicle_brand")
public class VehicleBrand {
	private String code;
	private String cname;
	private String ename;
	private String firstCharacter;
	private String brandLogo;
	private String isHot;
	private String mapped;
	
	@Transient
	public String getMapped() {
		return mapped;
	}
	public void setMapped(String mapped) {
		this.mapped = mapped;
	}
	private List<VehicleSeries> series;
	
	@Transient
	public List<VehicleSeries> getSeries() {
		return series;
	}
	public void setSeries(List<VehicleSeries> series) {
		this.series = series;
	}
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
	@Column(name="brand_logo")
	public String getBrandLogo() {
		return brandLogo;
	}
	public void setBrandLogo(String brandLogo) {
		this.brandLogo = brandLogo;
	}
	@Column(name="is_hot")
	public String getIsHot() {
		return isHot;
	}
	public void setIsHot(String isHot) {
		this.isHot = isHot;
	}

}
