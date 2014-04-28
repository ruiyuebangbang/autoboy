package com.autoboys.dao;

import java.util.List;

import com.autoboys.domain.*;

public interface VehicleSeriesDAO {
	public VehicleSeries getVehicleSeries(String code);
	public List<VehicleSeries> listVehicleSeries();
	public List<VehicleSeries> listByBrandCode(String brandCode);
	public List<VehicleSeries> listMappingSeries(long productId,String brandCode);
}
