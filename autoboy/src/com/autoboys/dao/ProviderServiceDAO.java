package com.autoboys.dao;

import java.util.List;

import com.autoboys.domain.*;

public interface ProviderServiceDAO {

	public void saveOrUpdateProviderService(ProviderService providerService);
	public List<ProviderService> listProviderService();
	public List<ProviderService> listProviderService(long providerId);
	public ProviderService listProviderServiceById(Long providerServiceId);
	public void deleteProviderService(Long providerServiceId);
}
