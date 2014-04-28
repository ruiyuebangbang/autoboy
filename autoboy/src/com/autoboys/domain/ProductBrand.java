package com.autoboys.domain;
import javax.persistence.Column;
import javax.persistence.Entity;

import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="SERVICE_CATEGORY")
public class ProductBrand {

		private Long id;
		private String name;
		//private String service;
		
		@Id
		@Column(name="id")	
		public Long getId() {
			return id;
		}
		public void setId(Long id) {
			this.id = id;
		}
		
		@Column(name="NAME")
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		
		/*@Column(name="service_id")
		public String getService() {
			return service;
		}
		public void setService(String password) {
			this.service = password;
		}*/


}
