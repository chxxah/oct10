 package com.bank.members;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class MembersController {
	@Autowired
	private MembersService membersService;
	
	@GetMapping("/login")
	public String login(@RequestParam(required = false, defaultValue = "0") String resultCode, Model model) {
		if (resultCode != "0") {
			model.addAttribute("resultCode", resultCode);
		}
		return "login";
	}
	
	@PostMapping("/login")
	public String login(HttpServletRequest request) {
		
		MembersDTO dto = new MembersDTO();
		dto.setMid(request.getParameter("id"));
		dto.setMpw(request.getParameter("pw"));
		
		dto = membersService.login(dto);
		
		
		if (dto.getCount() == 1) {
			switch(dto.getMgrade()) {
				case 1:
				case 2:
					HttpSession session = request.getSession();
					session.setAttribute("mname", dto.getMname());
					session.setAttribute("mid", request.getParameter("id"));
					session.setAttribute("mgrade", dto.getMgrade());
					session.setAttribute("maccount", dto.getMaccount());
					session.setAttribute("mno", dto.getMno());
					return "redirect:/index";
				case 3:
					return "redirect:/dormant";
				default:
					return "redirect:/login";
			}
		} else {
			return "redirect:/login?resultCode=1";
		}
	}
	
	@GetMapping("/dormant")
	public String dormant() {
		return "dormant";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		if (session.getAttribute("mname") != null) {
			session.removeAttribute("mname");
		}
		if (session.getAttribute("mid") != null) {
			session.removeAttribute("mid");
		}
		session.setMaxInactiveInterval(0);
		
		session.invalidate();
		return "redirect:index";
	}
}
