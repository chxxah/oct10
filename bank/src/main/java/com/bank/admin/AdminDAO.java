package com.bank.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSession sqlSession;

	public List<AdminDTO> memberList(AdminDTO adminDTO) {
		return sqlSession.selectList("login.memberList", adminDTO);
	}

	public int edit(Map<String, Object> map) {
		return sqlSession.update("login.edit", map);
	}

}
