package kr.co.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.domain.CartDTO;
import kr.co.domain.ProductDTO;
import kr.co.repository.CartDAO;

@Service
public class CartServiceImpl implements CartService{
	
	@Inject
	private CartDAO cartDAO;

	@Override
	public boolean findCartGoods(CartDTO cartDTO) {
		
		return cartDAO.findCartGoods(cartDTO);
	}

	@Override
	public void addGoodsInCart(CartDTO cartDTO) {
		
		cartDAO.addGoodsInCart(cartDTO);
		
	}

	@Override
	public Map<String, List> myCartList(CartDTO cartDTO) {
		
		Map<String, List> cartMap = new HashMap<String, List>();
		
		List<CartDTO> myCartList = cartDAO.selectCartList(cartDTO);
		
		if (myCartList.size() == 0) {
			return null;
		}
		
		List<ProductDTO> myGoodsList = cartDAO.selectGoodsList(myCartList);
		
		cartMap.put("myCartList", myCartList);
		cartMap.put("myGoodsList", myGoodsList);
		
 		return cartMap;
	}

}
