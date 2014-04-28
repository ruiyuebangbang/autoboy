package com.autoboys.dao;

import java.util.List;
import com.autoboys.domain.*;

public interface ServiceItemDAO {

	public void saveOrUpdateServiceItem(ServiceItem serviceItem);
	public List<ServiceItem> listServiceItem();
	public ServiceItem listServiceItemById(Long serviceItemId);
	public void deleteServiceItem(Long serviceItemId);
}
