package com.autoboys.dao;

import java.util.List;
import com.autoboys.domain.*;

public interface ServiceCatDAO {

	public void saveOrUpdateServiceCat(ServiceCat serviceItem);
	public List<ServiceCat> listServiceCat();
	public ServiceCat listServiceCatById(String serviceItemId);
	public void deleteServiceCat(String serviceItemId);
}
