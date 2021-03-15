package kr.co.repository;

import java.util.List;

import kr.co.domain.CartDTO;
import kr.co.domain.ProductDTO;


public interface CartDAO {

	boolean findCartGoods(CartDTO cartDTO);

	void addGoodsInCart(CartDTO cartDTO);

	List<CartDTO> getMyCartProductId(String userid);

	List<ProductDTO> getMyCartList(List<CartDTO> cartlist);

}
