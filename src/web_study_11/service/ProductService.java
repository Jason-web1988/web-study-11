package web_study_11.service;

import java.sql.Connection;
import java.util.List;

import org.junit.BeforeClass;

import web_study_11.dao.ProductDao;
import web_study_11.dao.impl.ProductImpl;
import web_study_11.ds.JdbcUtil;
import web_study_11.dto.Product;

public class ProductService {
	private ProductDao dao ;
	private static Connection con;

	
	
	public ProductService() {
		con = JdbcUtil.getConnection();
		dao = ProductImpl.getInstance();
		dao.setCon(con);
	}

	public 	List<Product> getProductList(){
		return dao.selectProductByAll();
	}

	public int addProduct(Product pdt) {
		return dao.insertProduct(pdt);
	}
	
	public Product getSelectByCode(int code) {
		return dao.selectProductBycode(code);
		
	}
	
	public int modifyProduct(Product pdt) {
		return dao.updateProduct(pdt);
	}
	
	public int removeProduct(int code) {
		return dao.deleteProduct(code);
	}
	
	
}
