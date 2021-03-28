package kr.co.test;

import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.domain.MemberVO;
import kr.co.domain.ProductDTO;
import kr.co.repository.MemberDAO;
import kr.co.repository.ProductDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class test {
	
	@Inject
	private MemberDAO dao;
	
	@Inject
	private ProductDAO pDao;
	
	@Test
	public void insertTest() {
		// dao.insert(new MemberVO("m005", "m005", "kang", "경기도 광명시", "d@e.f", 0, "1980-12-01"));
	}
	
	
	@Test
	public void testRead() {
		
		MemberVO vo = dao.read("m003");
		// System.out.println(vo.getAddress());
		// System.out.println(vo.getBirth());
	}
	
//	@Test
//	public void testProductList() {
//		
//		//List<ProductDTO> list = pDao.list();
//		for (int i = 0; i < list.size(); i++) {
//			
//			ProductDTO dto = list.get(i);
//			System.out.println(dto.getProductId());
//		}
//	}
	
	@Test
	public void testProductRead() {
		
		ProductDTO dto = pDao.read("test_product_id");
		System.out.println(dto.getProductName());
	}
	
	@Test
	public void testProductUpdate() {
		
	}
	
	@Test
	public void testProductInsert() {
		
		// pDao.insert(new ProductDTO("test22222", "test22222", 30000, 2, "bottom", " "));
		pDao.insert(new ProductDTO("top_jdodjo_112231_bk", "[반팔티] 검정 반팔티", 15000, 10, "top", ""));
		
		
	}

}
