package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.domain.OrderDTO;
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
	}


	@Override
	public List<OrderDTO> myOrderList(String userid) {
		
		return orderDAO.myOrderList(userid);
	}


	@Override
	public List<OrderDTO> list() {
		
		return orderDAO.list();
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

}
