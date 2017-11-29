package com.honhang.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.honhang.model.follow.FollowDAO;
import com.honhang.model.follow.FollowVO;
import com.honhang.model.user.UserDAO;
import com.honhang.model.user.UserVO;

@Controller
@RequestMapping("/follow")
@SessionAttributes({ "id" })
public class FollowController {
	private FollowDAO followDAO;
	private UserDAO userDAO;

	public void setFollowDAO(FollowDAO followDAO) {
		this.followDAO = followDAO;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	@RequestMapping("/insertFollow_s.do")
	public String insertFollowS(Model model, @RequestParam("id") String id,
			@RequestParam("a_id") String a_id,
			SessionStatus sessionStatus) {
		FollowVO follow = new FollowVO(id, a_id);
		followDAO.insert(follow);
		
		model.addAttribute("a_id", a_id);
		
		return "redirect:/a_page/user_page_s.do";
	}
	
	@RequestMapping("/insertFollow_r.do")
	public String insertFollowR(Model model, @RequestParam("id") String id,
			@RequestParam("a_id") String a_id,
			SessionStatus sessionStatus) {
		FollowVO follow = new FollowVO(id, a_id);
		followDAO.insert(follow);
		
		model.addAttribute("a_id", a_id);
		
		return "redirect:/a_page/user_page_r.do";
	}
	
	@RequestMapping("/insertFollow_fwr.do")
	public String insertFollowFwr(Model model, @RequestParam("id") String id,
			@RequestParam("a_id") String a_id,
			SessionStatus sessionStatus) {
		FollowVO follow = new FollowVO(id, a_id);
		followDAO.insert(follow);
		
		model.addAttribute("a_id", a_id);
		
		return "redirect:/a_page/user_page_fwr.do";
	}
	
	@RequestMapping("/insertFollow_fwg.do")
	public String insertFollowFwg(Model model, @RequestParam("id") String id,
			@RequestParam("a_id") String a_id,
			SessionStatus sessionStatus) {
		FollowVO follow = new FollowVO(id, a_id);
		followDAO.insert(follow);
		
		model.addAttribute("a_id", a_id);
		
		return "redirect:/a_page/user_page_fwg.do";
	}
	
	@RequestMapping("/insertFollow.do")
	public String insertFollow(Model model, @RequestParam("id") String id,
			@RequestParam("a_id") String a_id,
			SessionStatus sessionStatus) {
		FollowVO follow = new FollowVO(id, a_id);
		followDAO.insert(follow);
		
		return "redirect:/page/user_page_fwr.do";
	}
	
	@RequestMapping("/deleteFollow_s.do")
	public String deleteFollowS(Model model, @RequestParam("id") String id,
			@RequestParam("a_id") String a_id,
			SessionStatus sessionStatus) {
		FollowVO follow = new FollowVO(id, a_id);
		followDAO.delete(follow);
		
		model.addAttribute("a_id", a_id);
		
		return "redirect:/a_page/user_page_s.do";
	}
	
	@RequestMapping("/deleteFollow_r.do")
	public String deleteFollowR(Model model, @RequestParam("id") String id,
			@RequestParam("a_id") String a_id,
			SessionStatus sessionStatus) {
		FollowVO follow = new FollowVO(id, a_id);
		followDAO.delete(follow);
		
		model.addAttribute("a_id", a_id);
		
		return "redirect:/a_page/user_page_r.do";
	}
	
	@RequestMapping("/deleteFollow_fwr.do")
	public String deleteFollowFwr(Model model, @RequestParam("id") String id,
			@RequestParam("a_id") String a_id,
			SessionStatus sessionStatus) {
		FollowVO follow = new FollowVO(id, a_id);
		followDAO.delete(follow);
		
		model.addAttribute("a_id", a_id);
		
		return "redirect:/a_page/user_page_fwr.do";
	}
	
	@RequestMapping("/deleteFollow_fwg.do")
	public String deleteFollowFwg(Model model, @RequestParam("id") String id,
			@RequestParam("a_id") String a_id,
			SessionStatus sessionStatus) {
		FollowVO follow = new FollowVO(id, a_id);
		followDAO.delete(follow);
		
		model.addAttribute("a_id", a_id);
		
		return "redirect:/a_page/user_page_fwg.do";
	}
	
	@RequestMapping("/deleteFollowPfwr.do")
	public String deleteFollow_pfwr(@RequestParam("id") String id,
			@RequestParam("a_id") String a_id,
			SessionStatus sessionStatus) {
		FollowVO follow = new FollowVO(id, a_id);
		followDAO.delete(follow);
		
		return "redirect:/page/user_page_fwr.do";
	}
	
	@RequestMapping("/deleteFollowPfwg.do")
	public String deleteFollow_pfwg(@RequestParam("id") String id,
			@RequestParam("a_id") String a_id,
			SessionStatus sessionStatus) {
		FollowVO follow = new FollowVO(id, a_id);
		followDAO.delete(follow);
		
		return "redirect:/page/user_page_fwg.do";
	}
}
