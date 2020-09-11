package web_study_11.dao;

import java.sql.Connection;
import java.util.List;

import web_study_11.dto.Product;

public interface ProductDao {
	List<Product> selectProductByAll();
	
	int insertProduct(Product pdt);
	
	Product selectProductBycode(int code);
	
	int updateProduct(Product pdt);
	
	int deleteProduct(int code);

	void setCon(Connection con);
}
