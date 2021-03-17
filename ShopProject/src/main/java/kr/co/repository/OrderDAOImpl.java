package kr.co.repository;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.OrderDTO;

@Repository
public class OrderDAOImpl implements OrderDAO{

	@Inject
	private SqlSession sqlSession;
	
	private final String NS = "kr.co.order";
	
	@Override
	public void insert(OrderDTO orderDTO) {
		
		int orderId = sqlSession.selectOne(NS+".countOrderId");
		orderDTO.setOrderId(orderId);
		
		sqlSession.insert(NS+".insert", orderDTO);
	}

	@Override
	public List<OrderDTO> myOrderList(String userid) {

		List<OrderDTO> myOrderList = sqlSession.selectList(NS+".myOrderList", userid);
		
		if (myOrderList.size() == 0) {	
			return null;
		} else {
			return myOrderList;
		}

	}
	
	

}
