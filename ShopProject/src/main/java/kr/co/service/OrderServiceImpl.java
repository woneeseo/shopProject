package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.domain.CartDTO;
import kr.co.domain.OrderDTO;
import kr.co.repository.CartDAO;
import kr.co.repository.MemberDAO;
import kr.co.repository.OrderDAO;
import kr.co.repository.ProductDAO;

@Service
public class OrderServiceImpl implements OrderService{

	@Inject
	private OrderDAO orderDAO;
	
	@Inject
	private ProductDAO productDAO;
	
	@Inject
	private MemberDAO memberDAO;

	
	@Override
	@Transactional
	public void insert(OrderDTO orderDTO) {
		
		orderDAO.insert(orderDTO);
		productDAO.minusProductStock(orderDTO);
		productDAO.plusSoldRate(orderDTO);
		memberDAO.insertGetPoint(orderDTO);
		
		CartDTO cartDTO = new CartDTO();
		cartDTO.setUserid(orderDTO.getUserid());
		cartDTO.setProductId(orderDTO.getProductId());
		
		delFromCart(cartDTO);
		
	}


	@Override
	public List<OrderDTO> myOrderList(String userid) {
		
		return orderDAO.myOrderList(userid);
	}


	@Override
	public List<OrderDTO> list(int curPage) {
		
		return orderDAO.list(curPage);
	}


	@Override
	public List<OrderDTO> selectByOrderId(String orderId) {
		
		return orderDAO.selectByOrderId(orderId);
	}

	@Override
	public boolean updateDelSitu(OrderDTO orderDTO) {
		
		boolean result = orderDAO.updateDelSitu(orderDTO);
		return result;
	}


	@Override
	public boolean delFromCart(CartDTO cartDTO) {
		
		return orderDAO.delFromCart(cartDTO);
	}


	@Override
	public int orderCancel(OrderDTO orderDTO) {
		
		productDAO.plusProductStock(orderDTO);
		productDAO.minusSoldRate(orderDTO);
		memberDAO.deleteGetPoint(orderDTO);
		return orderDAO.orderCancel(orderDTO);
	}


	@Override
	public int getAmount() {
		
		return orderDAO.getAmount();
	}

}
