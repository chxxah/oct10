package com.bank.join;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class JoinController {
	@Autowired
	private JoinService joinService;

	@GetMapping("/joininfo")
	public String joininfo() {
		return "/joininfo";
	}
	
	@GetMapping("/join")
	public String join(Model model, JoinDTO joinDTO) {
		joinDTO.setMaccount((int) (Math.random() * 899 + 100) + "-" + (int) (Math.random() * 89999 + 10000) + "-"
				+ (int) (Math.random() * 899 + 100) + "-" + (int) (Math.random() * 89 + 10));
		model.addAttribute("account", joinDTO.getMaccount());
		return "join";
	}

	@PostMapping("/join")
	public String join( JoinDTO joinDTO) {
		
		
		int result = joinService.join(joinDTO);
		if (result ==1 ) {
			
			return "redirect:/index";
			
		}
		return "/join";
	}

	@ResponseBody
	@PostMapping("/checkID")
	public String checkID(@RequestParam("mid") String mid) {
		int result = joinService.checkID(mid);
		JSONObject json = new JSONObject();
		json.put("result", result);

		return json.toString();
	}

}
