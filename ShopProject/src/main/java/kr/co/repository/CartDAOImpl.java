package kr.co.repository;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
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
	public List<CartDTO> selectCartList(CartDTO cartDTO) {
		
		List<CartDTO> cartList = sqlSession.selectList(NS+".selectCartList", cartDTO);
		return cartList;
	}

	@Override
	public List<ProductDTO> selectGoodsList(List<CartDTO> myCartList) {
		List<ProductDTO> myGoodsList;
		myGoodsList = sqlSession.selectList(NS+".selectGoodsList", myCartList);
		
		return myGoodsList;
	}

}
