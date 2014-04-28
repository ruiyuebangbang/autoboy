package com.autoboys.dao;

import java.util.List;

import com.autoboys.domain.*;

public interface VehicleYearDAO {
	public VehicleYear getVehicleYear(String code);
	public List<VehicleYear> listVehicleYear();
	public List<VehicleYear> listByEmissionCode(String emissionCode);
	
}
