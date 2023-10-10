package com.bank.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.bank.members.MembersDTO;
import com.bank.members.MembersService;

@Controller
public class IndexController {
	@Autowired
	private MembersService membersService;
	
	@GetMapping(value = {"/", "/index"})
	public String index() {
		return "index";
	}
	
	@GetMapping("/mypage")
	public String mypage(HttpSession session, Model model) {
		String mid = (String) session.getAttribute("mid");
		
	    if (mid != null) {
	        MembersDTO dto = new MembersDTO();
	        dto.setMid(mid);
	        
	        List<MembersDTO> list = membersService.mypage(dto);
	        model.addAttribute("list", list);
	        
	        return "mypage";
	    } else {
	        return "redirect:/login";
	    }
	}
}
