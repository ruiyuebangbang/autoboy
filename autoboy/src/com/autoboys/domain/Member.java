package com.autoboys.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="member")
public class Member {

	private Long id;
	private String nickName;
	private String password;
	private String repassword;
	private String mobilePhone;
	private String email;
	private Integer verifiedemail;
	private Long  provid;
	private Integer classid;
	private Integer isAdmin;
	private Integer isDisabled;
	private String avatar;
	private java.sql.Date registerDate;
	
	@Id
	
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator="s_member")
	@SequenceGenerator(name="s_member", sequenceName="S_MEMBER")
	@Column(name="id")	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	@Column(name="NICKNAME")
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	
	@Column(name="password")
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	@Transient 
	public String getRepassword() {
		return repassword;
	}
	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}
	
	@Column(name="MOBIEPHONE")
	public String getMobilePhone() {
		return mobilePhone;
	}
	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}
	
	@Column(name="email")
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name="VERIFIED_EMAIL")
	public Integer getVerifiedemail() {
		return verifiedemail;
	}
	public void setVerifiedemail(Integer verifiedemail) {
		this.verifiedemail = verifiedemail;
	}
	@Column(name="PROVIDER_ID")
	public Long getProvid() {
		return provid;
	}
	public void setProvid(Long provid) {
		this.provid = provid;
	}
	@Column(name="CLASSIFICATION")
	public Integer getClassid() {
		return classid;
	}
	public void setClassid(Integer classid) {
		this.classid = classid;
	}
	@Column(name="IS_ADMIN")
	public Integer getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(Integer isAdmin) {
		this.isAdmin = isAdmin;
	}
	@Column(name="IS_disabled")
	public Integer getIsDisabled() {
		return isDisabled;
	}
	public void setIsDisabled(Integer isDisabled) {
		this.isDisabled = isDisabled;
	}
	@Column(name="avatar")
	public String getAvatar(){
		return avatar;
	}
	public void setAvatar(String avatar){
		this.avatar=avatar;
	}
	@Column(name="register_date")
	public java.sql.Date getRegisterDate(){
		return this.registerDate;
	}
	public void setRegisterDate(java.sql.Date registerDate){
		this.registerDate = registerDate;
	}
	

}
