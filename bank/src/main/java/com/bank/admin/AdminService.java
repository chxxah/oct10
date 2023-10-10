package com.bank.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminService {
	
	@Autowired
	private AdminDAO adminDAO;

	public List<AdminDTO> memberList(AdminDTO adminDTO) {
		return adminDAO.memberList(adminDTO);
	}

	public int edit(Map<String, Object> map) {
		return adminDAO.edit(map);
	}


}
