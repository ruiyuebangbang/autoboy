package com.autoboys.dao;

import java.util.List;

import com.autoboys.domain.*;

public interface VehicleEmissionDAO {
	public void saveOrUpdateEmission(VehicleEmission emission);
	public VehicleEmission getVehicleEmission(String code);
	public List<VehicleEmission> listVehicleEmission();
	public List<VehicleEmission> listBySeriesCode(String seriesCode);
	
}
