package com.autoboys.dao;

import java.util.List;
import com.autoboys.domain.*;

public interface ServiceDAO {

	public void saveOrUpdateService(Service service);
	public List<Service> listService();
	public Service listServiceById(String serviceId);
	public void deleteService(String serviceId);
	public List<Service> listServiceByCatId(String catId);
}
