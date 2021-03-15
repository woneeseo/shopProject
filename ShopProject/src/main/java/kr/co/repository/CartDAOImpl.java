package kr.co.repository;

import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import kr.co.domain.CartDTO;
import kr.co.domain.ProductDTO;

@Repository
public class CartDAOImpl implements CartDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	private final String NS = "kr.co.cart";

	@Override
	public boolean findCartGoods(CartDTO cartDTO) {
		
		String result = sqlSession.selectOne(NS+".findCartGoods", cartDTO);
		return Boolean.parseBoolean(result);
	}

	@Override
	public void addGoodsInCart(CartDTO cartDTO) {

		sqlSession.insert(NS+".addGoodsInCart", cartDTO);
	}

	@Override
	public List<CartDTO> getMyCartProductId(String userid) {
		
		return sqlSession.selectList(NS+".getMyCartProductId", userid);
	}

	@Override
	public List<ProductDTO> getMyCartList(List<CartDTO> cartlist) {
		
		return sqlSession.selectList(NS+".getMyCartList", cartlist);
	}
}
