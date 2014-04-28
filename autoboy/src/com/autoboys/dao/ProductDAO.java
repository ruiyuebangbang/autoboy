package com.autoboys.dao;

import java.util.List;
import com.autoboys.domain.*;

public interface ProductDAO {

	public void saveOrUpdateProduct(Product product);
	public List<Product> listProduct();
	public Product listProductById(Long productId);
	public void deleteProduct(Long productId);
	
	public int qryProductsCount(Product cnds,String selCat,String brand,String series);
	public List<Product> qryProductsList(Product cnds,String selCat,String brand,String series, int pageNo ,int pageSize); 	
	public List<String> listMappingBrand(long productId);
	public List<String> listMappingSeries(long productId);
	public int saveProductVehicleMapping(long productId,List<String> series);
}
