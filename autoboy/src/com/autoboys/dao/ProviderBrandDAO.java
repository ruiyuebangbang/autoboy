package com.autoboys.dao;

import java.util.List;

import com.autoboys.domain.*;

public interface ProviderBrandDAO {

	public List<ProviderBrand> listProviderBrand(Long providerId);
	public List<String> listProviderBrandCode(Long providerId);
	public int insert(Long providerId,List<String> list);
}
