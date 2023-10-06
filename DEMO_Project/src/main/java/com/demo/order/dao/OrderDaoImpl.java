package com.demo.order.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.demo.order.dto.OrderDto;

@Repository
public class OrderDaoImpl implements OrderDao{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	String nameSpace = "com.demo.order.";

	@Override
	public List<Map<String, Object>> orderSelectList(int start, int end, String category, String search) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();

		if(category.equals("memberNo")||category.equals("orderNo")) {
			try {
				map.put("search", Integer.parseInt(search));
			} catch (Exception e) {
				// TODO: handle exception
				map.put("search", "");
			}
		}else {
			map.put("search", search);
		}
		map.put("category", category);
		map.put("start", start);
		map.put("end", end);
		
		return sqlSession.selectList(nameSpace + "orderSelectList", map);
	}

	@Override
	public Map<String, Object> orderDetailSelectOne(int orderNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + "orderDetailSelectOne", orderNo);
	}

	@Override
	public int orderSelectListTotalCount(String category, String search) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(category.equals("memberNo")||category.equals("orderNo")) {
			try {
				map.put("search", Integer.parseInt(search));
			} catch (Exception e) {
				// TODO: handle exception
				map.put("search", "");
			}
		}else {
			map.put("search", search);
		}
		map.put("category", category);
		
		return (int)sqlSession.selectOne(nameSpace + "orderSelectListTotalCount", map);
	}

	@Override
	public int orderCancelUpdate(int orderNo) {
		// TODO Auto-generated method stub
		return (int)sqlSession.update(nameSpace + "orderCancelUpdate", orderNo);
	}

	@Override
	public int orderCancelInsert(int orderNo) {
		// TODO Auto-generated method stub
		return (int)sqlSession.insert(nameSpace + "orderCancelInsert", orderNo);
	}
	
	@Override
	public int orderConfirmUpdate(int orderNo) {
		// TODO Auto-generated method stub
		return (int)sqlSession.update(nameSpace + "orderConfirmUpdate", orderNo);
	}

	@Override
	public int orderConfirmInsert(int orderNo) {
		// TODO Auto-generated method stub
		return (int)sqlSession.insert(nameSpace + "orderConfirmInsert", orderNo);
	}

	
	@Override
	public int cancelSelectListTotalCount(String category, String search) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
				
		if(category.equals("memberNo")||category.equals("orderNo")) {
			try {
				map.put("search", Integer.parseInt(search));
			} catch (Exception e) {
				// TODO: handle exception
				map.put("search", "");
			}
		}else {
			map.put("search", search);
		}
		map.put("category", category);
		return (int)sqlSession.selectOne(nameSpace + "cancelSelectListTotalCount", map);
	}

	@Override
	public List<Map<String, Object>> cancelSelectList(int start, int end, String category, String search) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(category.equals("orderNo")) {
			try {
				map.put("search", Integer.parseInt(search));
			} catch (Exception e) {
				// TODO: handle exception
				map.put("search", "");
			}
		}else {
			map.put("search", search);
		}
		map.put("category", category);
		
		map.put("start", start);
		map.put("end", end);
		
		return sqlSession.selectList(nameSpace + "cancelSelectList", map);
	}

	@Override
	public Map<String, Object> orderCancelDetailSelectOne(int orderNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + "orderCancelDetailSelectOne", orderNo);
	}

	@Override
	public int orderSelectListTotalCount(String category, String search, int sessionMemberNo) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(category.equals("orderNo")) {
			try {
				map.put("search", Integer.parseInt(search));
			} catch (Exception e) {
				// TODO: handle exception
				map.put("search", "");
			}
		}else {
			map.put("search", search);
		}
		map.put("category", category);
		map.put("sessionMemberNo", sessionMemberNo);
		
		return (int)sqlSession.selectOne(nameSpace + "memberOrderSelectListTotalCount", map);
	}

	@Override
	public List<Map<String, Object>> orderSelectList(int start, int end, String category, String search,
			int sessionMemberNo) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();

		if(category.equals("orderNo")) {
			try {
				map.put("search", Integer.parseInt(search));
			} catch (Exception e) {
				// TODO: handle exception
				map.put("search", "");
			}
		}else {
			map.put("search", search);
		}
		map.put("category", category);
		map.put("start", start);
		map.put("end", end);
		map.put("sessionMemberNo", sessionMemberNo);
		
		return sqlSession.selectList(nameSpace + "memberOrderSelectList", map);
	}

	@Override
	public int cancelSelectListTotalCountMember(String category, String search, int sessionMemberNo) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(category.equals("orderNo")) {
			try {
				map.put("search", Integer.parseInt(search));
			} catch (Exception e) {
				// TODO: handle exception
				map.put("search", "");
			}
		}else {
			map.put("search", search);
		}
		map.put("category", category);
		map.put("sessionMemberNo", sessionMemberNo);
		return (int)sqlSession.selectOne(nameSpace + "cancelSelectListTotalCountMember", map);
	}

	@Override
	public List<Map<String, Object>> cancelSelectListMember(int start, int end, String category, String search,
			int sessionMemberNo) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(category.equals("orderNo")) {
			try {
				map.put("search", Integer.parseInt(search));
			} catch (Exception e) {
				// TODO: handle exception
				map.put("search", "");
			}
		}else {
			map.put("search", search);
		}
		map.put("category", category);
		map.put("start", start);
		map.put("end", end);
		map.put("sessionMemberNo", sessionMemberNo);
		
		return sqlSession.selectList(nameSpace + "cancelSelectListMember", map);
	}

	@Override
	public void insertOrder(OrderDto orderDto) {
		// TODO Auto-generated method stub
		sqlSession.insert(nameSpace + "insertOrder", orderDto);
	}

	@Override
	public Map<String, Object> selectCartOne(int productNo, int memberNo) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("productNo", productNo);
		map.put("memberNo", memberNo);
		return sqlSession.selectOne("com.demo.product." + "selectCartOne", map);
	}


	

}
