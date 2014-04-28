package com.autoboys.dao;

import java.util.List;

import com.autoboys.domain.*;

public interface VehicleBrandDAO {

	public VehicleBrand getVehicleBrand(String code);
	public List<VehicleBrand> listHotVehicleBrand();
	public List<VehicleBrand> listVehicleBrand();
	public List<VehicleBrand> listVehicleBrandByFC(String fc);
	//public List<VehicleBrand> listMappingBrand(long productId);
	public List<VehicleBrand> listBrandByProduct(long productId);
}
