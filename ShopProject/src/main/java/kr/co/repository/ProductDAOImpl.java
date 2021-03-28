package kr.co.repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.OrderDTO;
import kr.co.domain.PageTO;
import kr.co.domain.ProductDTO;

@Repository
public class ProductDAOImpl implements ProductDAO{
	
	@Inject
	private SqlSession sqlSession;
	private final String NS = "kr.co.product";

	@Override
	public List<ProductDTO> list(int curPage) {

		return sqlSession.selectList(NS+".list");
		
	}
	
	@Override
	public ProductDTO read(String productId) {
		
		return sqlSession.selectOne(NS+".read", productId);
	}

	@Override
	public List<String> getAttaches(String productId) {
		
		return sqlSession.selectList(NS+".getAttaches", productId);
	}

	@Override
	public void update(ProductDTO dto) {
		sqlSession.update(NS+".update", dto);
	}

	@Override
	public void deleteFile(String filename) {
		sqlSession.delete(NS+".deleteFile", filename);
	}

	@Override
	public void deleteFilesByBno(String productId) {
		sqlSession.delete(NS+".deleteFilesByBno", productId);
	}

	@Override
	public void addAttach(String filename, String productId) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("fullname", filename);
		map.put("productId", productId);
		System.out.println(filename);
		System.out.println(productId);
		
		sqlSession.insert(NS+".addAttach", map);
	}

	@Override
	public void delete(String productId) {
		sqlSession.delete(NS+".delete", productId);
	}

	@Override
	public void insert(ProductDTO dto) {
		sqlSession.insert(NS+".insert", dto);
	}

	@Override
	public String getFilename(String productId) {
		
		return sqlSession.selectOne(NS+".getFilename", productId);
	}

	@Override
	public List<ProductDTO> getProductDistList(String productDist) {
		
		return sqlSession.selectList(NS+".getProductDistList", productDist);
	}

	@Override
	public void minusProductStock(OrderDTO orderDTO) {
		
		sqlSession.update(NS+".minusProductStock", orderDTO);
	}

	@Override
	public void plusSoldRate(OrderDTO orderDTO) {
		sqlSession.update(NS+".plusSoldRate", orderDTO);
	}

	@Override
	public List<ProductDTO> newProductList() {
		
		return sqlSession.selectList(NS+".newProductList");
	}

	@Override
	public List<ProductDTO> productList(int curPage) {

		PageTO<ProductDTO> to = new PageTO<ProductDTO>(curPage);
		RowBounds rb = new RowBounds(to.getStartNum()-1, to.getPerPage());

		return sqlSession.selectList(NS+".productlist", null, rb);
	}

	@Override
	public int getAmount() {
		
		return sqlSession.selectOne(NS+".getAmount");
	}

	@Override
	public void plusProductStock(OrderDTO orderDTO) {
		sqlSession.update(NS+".plusProductStock", orderDTO);
	}

	@Override
	public void minusSoldRate(OrderDTO orderDTO) {
		sqlSession.update(NS+".minusSoldRate", orderDTO);
	}


}
