package com.autoboys.domain;

import java.util.HashMap;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Provider")
public class Provider {

	  private long ID;               
	  private Long REGION_ID;        
	  private String SHORT_NAME;       
	  private String FULL_NAME;       
	  private String BUSINESS_LICENSE ;
	  private String AGENT ;            
	  private String TELEPHONE;        
	  private String SERVICE_PHONE;    
	  private String SERVICE_TIME ;    
	  private String ADDRESS;          
	  private String LOGO;             
	  private String REMARK;           
	  private String QUALIFICATION;   
	  private int HAS_BOND;         
	  private Integer CREDIT_SCORE ;    
	  private String IMG4    ;         
	  private String IMG1     ;        
	  private String IMG2    ;         
	  private String IMG6    ;         
	  private String IMG3    ;         
	  private String IMG5   ;          
	  private String IMG7   ;          
	  private String IMG8   ;          
	  private String IMG9   ;          
	  private String IMG10  ;

	  private String apply_date;
	  private String apply_type;
	  private Integer status;
	  private String regionName;
	  
	  
	public String getApply_date() {
		return apply_date;
	}
	public void setApply_date(String app_date) {
		this.apply_date = app_date;
	}
	public String getApply_type() {
		return apply_type;
	}
	public void setApply_type(String app_type) {
		this.apply_type = app_type;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getRegionName() {
		return regionName;
	}
	public void setRegionName(String regionName) {
		this.regionName = regionName;
	}
	
	
	@Id
	@GeneratedValue
	@Column(name="ID")
	public long getID() {
		return ID;
	}
	@Column(name="REGION_ID")
	public Long getREGION_ID() {
		return REGION_ID;
	}
	@Column(name="SHORT_NAME")
	public String getSHORT_NAME() {
		return SHORT_NAME;
	}
	@Column(name="FULL_NAME")
	public String getFULL_NAME() {
		return FULL_NAME;
	}
	@Column(name="BUSINESS_LICENSE")
	public String getBUSINESS_LICENSE() {
		return BUSINESS_LICENSE;
	}
	@Column(name="AGENT")
	public String getAGENT() {
		return AGENT;
	}
	@Column(name="TELEPHONE")
	public String getTELEPHONE() {
		return TELEPHONE;
	}
	@Column(name="SERVICE_PHONE")
	public String getSERVICE_PHONE() {
		return SERVICE_PHONE;
	}
	@Column(name="SERVICE_TIME")
	public String getSERVICE_TIME() {
		return SERVICE_TIME;
	}
	@Column(name="ADDRESS")
	public String getADDRESS() {
		return ADDRESS;
	}
	@Column(name="LOGO")
	public String getLOGO() {
		return LOGO;
	}
	@Column(name="REMARK")
	public String getREMARK() {
		return REMARK;
	}
	@Column(name="QUALIFICATION")
	public String getQUALIFICATION() {
		return QUALIFICATION;
	}
	@Column(name="HAS_BOND")
	public int getHAS_BOND() {
		return HAS_BOND;
	}
	@Column(name="CREDIT_SCORE")
	public Integer getCREDIT_SCORE() {
		return CREDIT_SCORE;
	}
	@Column(name="IMG4")
	public String getIMG4() {
		return IMG4;
	}
	@Column(name="IMG1")
	public String getIMG1() {
		return IMG1;
	}
	@Column(name="IMG2")
	public String getIMG2() {
		return IMG2;
	}
	@Column(name="IMG6")
	public String getIMG6() {
		return IMG6;
	}
	@Column(name="IMG3")
	public String getIMG3() {
		return IMG3;
	}
	@Column(name="IMG5")
	public String getIMG5() {
		return IMG5;
	}
	@Column(name="IMG7")
	public String getIMG7() {
		return IMG7;
	}
	@Column(name="IMG8")
	public String getIMG8() {
		return IMG8;
	}
	@Column(name="IMG9")
	public String getIMG9() {
		return IMG9;
	}
	@Column(name="IMG10")
	public String getIMG10() {
		return IMG10;
	}
	public void setID(long iD) {
		ID = iD;
	}
	public void setREGION_ID(Long rEGION_ID) {
		REGION_ID = rEGION_ID;
	}
	public void setSHORT_NAME(String sHORT_NAME) {
		SHORT_NAME = sHORT_NAME;
	}
	public void setFULL_NAME(String fULL_NAME) {
		FULL_NAME = fULL_NAME;
	}
	public void setBUSINESS_LICENSE(String bUSINESS_LICENSE) {
		BUSINESS_LICENSE = bUSINESS_LICENSE;
	}
	public void setAGENT(String aGENT) {
		AGENT = aGENT;
	}
	public void setTELEPHONE(String tELEPHONE) {
		TELEPHONE = tELEPHONE;
	}
	public void setSERVICE_PHONE(String sERVICE_PHONE) {
		SERVICE_PHONE = sERVICE_PHONE;
	}
	public void setSERVICE_TIME(String sERVICE_TIME) {
		SERVICE_TIME = sERVICE_TIME;
	}
	public void setADDRESS(String aDDRESS) {
		ADDRESS = aDDRESS;
	}
	public void setLOGO(String lOGO) {
		LOGO = lOGO;
	}
	public void setREMARK(String rEMARK) {
		REMARK = rEMARK;
	}
	public void setQUALIFICATION(String qUALIFICATION) {
		QUALIFICATION = qUALIFICATION;
	}
	public void setHAS_BOND(int hAS_BOND) {
		HAS_BOND = hAS_BOND;
	}
	public void setCREDIT_SCORE(Integer cREDIT_SCORE) {
		CREDIT_SCORE = cREDIT_SCORE;
	}
	public void setIMG4(String iMG4) {
		IMG4 = iMG4;
	}
	public void setIMG1(String iMG1) {
		IMG1 = iMG1;
	}
	public void setIMG2(String iMG2) {
		IMG2 = iMG2;
	}
	public void setIMG6(String iMG6) {
		IMG6 = iMG6;
	}
	public void setIMG3(String iMG3) {
		IMG3 = iMG3;
	}
	public void setIMG5(String iMG5) {
		IMG5 = iMG5;
	}
	public void setIMG7(String iMG7) {
		IMG7 = iMG7;
	}
	public void setIMG8(String iMG8) {
		IMG8 = iMG8;
	}
	public void setIMG9(String iMG9) {
		IMG9 = iMG9;
	}
	public void setIMG10(String iMG10) {
		IMG10 = iMG10;
	}          



}
