package com.autoboys.dao;

import java.util.List;
import com.autoboys.domain.*;

public interface ProviderProductDAO {

	public void saveOrUpdateProviderProduct(ProviderProduct providerProduct);
	public List<ProviderProduct> listProviderProduct();
	public ProviderProduct listProviderProductById(Long providerProductId);
	public void deleteProviderProduct(Long providerProductId);
	public List<String> listDistinctProduct();
	
	public List<ProviderProduct> qryProductsList(ProviderProduct cnds, int pageNo ,int pageSize); 	
	public int qryProductsCount(ProviderProduct cnds);
	
	public void updatePrice(String id, String discountPrice, String labourPrice);
	public Long save(Long provid, String product, String discountPrice, String labourPrice);
}
