package com.autoboys.domain;

public class ProviderVehicleBrand extends VehicleBrand {
	private Long provider;
	private Integer selected;
	
	public Long getProvider() {
		return provider;
	}
	public Integer getSelected() {
		return selected;
	}
	public void setProvider(Long provider) {
		this.provider = provider;
	}
	public void setSelected(Integer selected) {
		this.selected = selected;
	}
	
}
