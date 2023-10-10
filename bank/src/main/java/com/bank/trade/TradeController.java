package com.bank.trade;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bank.members.MembersDTO;
import com.bank.members.MembersService;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class TradeController {
	@Autowired
	private TradeService tradeService;
	
	@Autowired
	private MembersService membersService;

	@GetMapping("/trade")
	public String trade(Model model, HttpSession session) {
		if(session.getAttribute("mid") != null) {
			MembersDTO dto = new MembersDTO();
			dto.setMid((String)session.getAttribute("mid"));
			List<MembersDTO> list = membersService.mypage(dto);
	        model.addAttribute("list", list);
	        return "trade";
		} else {
			return "redirect:/login";
		}		
	}
	
	@PostMapping("/trade")
	public String trade(TradeDTO dto) {
		int insert = tradeService.tradeInsert(dto);
		System.out.println("거래내역 추가 결과값 : " + insert);
		int result = tradeService.trade(dto);
		System.out.println("각 계좌에 이체 결과값 : " + result);
		return "trade";
	}
	
	@ResponseBody
	@PostMapping("/checkaccount")
	public String checkaccount(@RequestParam("account") String maccount) {
		JSONObject json = new JSONObject();
		json.put("result", tradeService.checkaccount(maccount));
		return json.toString();
	}
	
	@ResponseBody
	@PostMapping("/mapw")
	public String mapw(@RequestParam("mapw") String mapw, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mapw", mapw);
		map.put("mid", session.getAttribute("mid"));
		JSONObject json = new JSONObject();
		json.put("result", tradeService.mapw(map));
		return json.toString();
	}

	@GetMapping("/tradeList")
	public String tradeList(@RequestParam(value = "pageNo", required = false, defaultValue = "1") int pageNo , HttpSession session, Model model) {
		
		if (session.getAttribute("mid") != null) {
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(pageNo);
		paginationInfo.setRecordCountPerPage(10);
		paginationInfo.setPageSize(10);
		int totalCount = tradeService.totalCount();
		paginationInfo.setTotalRecordCount(totalCount);
		int firstRecordIndex = paginationInfo.getFirstRecordIndex();
		int recordCountPerPage = paginationInfo.getRecordCountPerPage();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("firstRecordIndex", firstRecordIndex);
		map.put("recordCountPerPage", recordCountPerPage);
		map.put("mid", session.getAttribute("mid"));
		List<Map<String, Object>> list = tradeService.tradeList(map);
		List<Map<String, Object>> list2 = tradeService.tradeMem(map);
		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		model.addAttribute("paginationInfo", paginationInfo);
		return "tradeList";
		}else {
			return "redirect:/login";
		}
	}
}
