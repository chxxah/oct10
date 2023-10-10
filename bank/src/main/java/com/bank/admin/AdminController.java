package com.bank.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;

	@GetMapping("/admin")
	public String admin(Model model, HttpSession session,  HttpServletRequest request) {
		String mid = (String) session.getAttribute("mid");

		if (mid != null && !(mid.equals(""))) {
			
			Integer mgrade = (Integer) session.getAttribute("mgrade");
			
				if (mgrade == 1) {
					AdminDTO adminDTO = new AdminDTO();
					adminDTO.setMid(mid);
					adminDTO.setMgrade(mgrade);
					List<AdminDTO> memberList = adminService.memberList(adminDTO);
					model.addAttribute("memberList", memberList);
					return "/admin";
				} else {
					return "redirect:/login";
				}
		} else {
			return "redirect:/login";
		}
	}
	
	@PostMapping("/admin")
	public String edit(@RequestParam Map<String, Object> map, HttpSession session) {
	
		String mid = (String) session.getAttribute("mid");
		Integer mgrade = (Integer) session.getAttribute("mgrade");
		
		if (mid != null && !(mid.equals("")) && mgrade == 1) {
			
				int result = adminService.edit(map);
				System.out.println(result);
				System.out.println(map);
				return "redirect:/admin";
		} else {
			return "redirect:/login";
		}
	}

}