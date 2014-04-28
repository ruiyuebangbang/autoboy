package com.autoboys.dao;

import java.util.List;
import com.autoboys.domain.*;

public interface ProviderDAO {

	public void saveOrUpdateProvider(Provider provider);
	public int updateMainInfo(Provider provider);
	public List<Provider> listProvider();
	public Provider listProviderById(Long providerId);
	public void deleteProvider(Long providerId);
	public int updateLogo(Provider prov);
	public int updateLogo(Long id, String logo);
	public int updateImage(Long providerId,String imagePath,int index);	
	public List<Provider> qryAuditProviderList(int pageNo ,int pageSize);
	public int qryAuditProviderCnt();
	public int auditProvider(Long providerId,int stat);
	public List<Provider> qryProviderList(String name,Long reg1,Long reg2,int pageNo ,int pageSize);
	public int qryProviderCnt(String name,Long reg1,Long reg2);
	public int insertProvider(Member member,Provider provider);
}
