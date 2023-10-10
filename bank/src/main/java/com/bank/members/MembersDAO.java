package com.bank.members;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MembersDAO {
	@Autowired
	private SqlSession sqlSession;

	public MembersDTO login(MembersDTO dto) {
		return sqlSession.selectOne("login.login", dto);
	}
	
	public List<MembersDTO> mypage(MembersDTO dto) {
		return sqlSession.selectList("login.mypage",dto);
	}
}
