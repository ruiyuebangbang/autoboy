package com.autoboys.dao;

import java.util.List;
import com.autoboys.domain.*;

public interface VehicleCategoryDAO {

	public List<VehicleBrand> listVehicleBrandsByFC(String firstCharacter);
	public String getFullNameByCode(String code);
	public List<ProviderVehicleBrand> listVehicleByProvider(Long id);
	public List<VehicleBrand> getVehicleBrands();
	public List<String> listVehicleCodeByProvider(Long id);
}
