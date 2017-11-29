package com.honhang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.honhang.model.user.UserDAO;
import com.honhang.model.user.UserVO;

@Controller
@RequestMapping("/social")
@SessionAttributes({ "id", "name", "email", "category", "image"})
public class LoginController {
	private UserDAO userDAO;

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	// 로그인 처리
	@RequestMapping("/login.do")
	public ModelAndView login(Model model, @RequestParam("id") String id,
			@RequestParam("name") String name,
			@RequestParam("email") String email,
			@RequestParam(value = "category", required=false) String category,
			@RequestParam(value = "image") String image,
			SessionStatus sessionStatus) {
		UserVO user = null;

		if(!id.equals("undefined")){
			if (userDAO.selectUser(id) == null) {
				userDAO.insertUser(new UserVO(id, name, email, category, image));
				user = userDAO.selectUser(id);
			} else {
				user = userDAO.selectUser(id);
			}
						
			model.addAttribute("id", user.getUser_id());
			model.addAttribute("name", user.getUser_name());
			model.addAttribute("email", user.getUser_email());
			model.addAttribute("category", user.getUser_category());
			if(!image.equals(null)){
				model.addAttribute("image", image);
			}
			
		} else {
			sessionStatus.setComplete();
		}
		
		// redirect시 주소 뒤에 파라미터 값을 표시하지 않기 위해 사용
		RedirectView rv = new RedirectView("/index.do");
		rv.setExposeModelAttributes(false);
		
		return new ModelAndView(rv);
	}

	// 로그아웃
	@RequestMapping("/logout.do")
	public ModelAndView logout(@ModelAttribute("id") String id,
			@ModelAttribute("name") String name,
			@ModelAttribute("email") String email,
			@ModelAttribute("category") String category,
			SessionStatus sessionStatus) {
		
		// redirect시 주소 뒤에 파라미터 값을 표시하지 않기 위해 사용
		RedirectView rv = new RedirectView("/index.do");
		rv.setExposeModelAttributes(false);
		sessionStatus.setComplete();

		return new ModelAndView(rv);
	}
	
	/* 테스트 코드
	@RequestMapping("/userList.do")
	public ModelAndView userList(@RequestParam("id") String id, SessionStatus sessionStatus){
		ModelAndView mav = new ModelAndView("user_list");
		
		mav.addObject("id", id);
		mav.addObject("userList", userDAO.selectAll());
		
		return mav;
	}*/
}
