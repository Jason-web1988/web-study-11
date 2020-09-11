package web_study_11.dao;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.util.Calendar;
import java.util.List;

import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

import web_study_11.dao.impl.ProductImpl;
import web_study_11.ds.JdbcUtil;
import web_study_11.dto.Product;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class ProductDaoTest {
	private static ProductDao dao ;
	private static Connection con;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception{
		con = JdbcUtil.getConnection();
		dao = ProductImpl.getInstance();
		dao.setCon(con);
	}

	@Test
	public void testSelectProductByAll() {
		System.out.println("testSelectProductByAll()");
        List<Product> list = dao.selectProductByAll();
        Assert.assertNotNull(list);
        list.stream().forEach(System.out::println);
	}

	@Test
	public void test01InsertProduct() {
		System.out.println("testSelectProductByAll()");
		Product newProduct = new Product(10, "이현석", 500, "현석이다", "??");
        int res = dao.insertProduct(newProduct);
        Assert.assertEquals(1, res);
	}

	@Test
	public void testSelectProductBycode() {
		System.out.println("testSelectProductBycode()");
		Product pdt = dao.selectProductBycode(1);
        Assert.assertNotNull(pdt);
        System.out.println(pdt);
	}

	@Test
	public void test02UpdateProduct() {
		System.out.println("testUpdateProduct()");
		Product modifyPdt = dao.selectProductBycode(10);
        System.out.println("before : " + modifyPdt);
        //(NAME, USERID, PWD, EMAIL, PHONE, ADMIN)
        
        modifyPdt.setName("최수정");
        modifyPdt.setPrice(3333);
        modifyPdt.setDescription("홍홍홍");
        modifyPdt.setPictureUrl("잇음");
        int res = dao.updateProduct(modifyPdt);
        Assert.assertEquals(1, res);
        System.out.println("after : " + modifyPdt);
	}

	@Test
	public void test03DeleteProduct() {
		System.out.println("testDeleteProduct()");
        int res = dao.deleteProduct(10);
        Assert.assertEquals(1, res);  
	}

	@Test
	public void testSetCon() {
		System.out.println(con);
	}

}


