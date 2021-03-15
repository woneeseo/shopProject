package kr.co.service;

import java.util.List;
import java.util.Map;

import kr.co.domain.CartDTO;

public interface CartService {

	boolean findCartGoods(CartDTO cartDTO);

	void addGoodsInCart(CartDTO cartDTO);

	Map<String, List> myCartList(CartDTO cartDTO);

}
