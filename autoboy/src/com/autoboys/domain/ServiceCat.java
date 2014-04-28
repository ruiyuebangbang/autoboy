package com.autoboys.domain;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;
import org.hibernate.annotations.FetchMode;

@Entity
@Table(name="SERVICE_CATEGORY")
public class ServiceCat {

	private String code;
	private String name;
	private String remark;
	private Set<Service> services;
	
	@Id
	@Column(name="code")	
	public String getCode() {
		return code;
	}
	public void setCode(String id) {
		this.code = id;
	}
	
	@Column(name="NAME")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name="remark")
	public String getRemark() {
		return remark;
	}
	public void setRemark(String password) {
		this.remark = password;
	}
	
	@OneToMany(targetEntity=Service.class,fetch = FetchType.LAZY)
	@JoinColumn(name="CATEGORY_CODE")
	//@OneToMany(cascade = CascadeType.ALL,fetch = FetchType.LAZY,mappedBy = "category_code") 
	public Set<Service> getServices() {
		return services;
		}
	public void setServices(Set<Service> services) {
	this.services = services;
	}

}
