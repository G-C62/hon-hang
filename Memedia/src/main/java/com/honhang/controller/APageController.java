package com.honhang.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.honhang.model.follow.FollowDAO;
import com.honhang.model.follow.FollowVO;
import com.honhang.model.user.UserDAO;
import com.honhang.model.user.UserVO;

@Controller
@RequestMapping("/a_page")
@SessionAttributes({ "id", "a_id", "fw" })
public class APageController {
	private UserDAO userDAO;
	private FollowDAO followDAO;

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	public void setFollowDAO(FollowDAO followDAO) {
		this.followDAO = followDAO;
	}

	@RequestMapping("/user_page_s.do")
	public ModelAndView schedule(
			@RequestParam(value = "id", required = false) String id,
			@RequestParam(value = "a_id", required = false) String a_id) {
		int flag = 0;
		UserVO user = null;
		String followerCount = followDAO.followerCount(a_id);
		String followingCount = followDAO.followingCount(a_id);
		ModelAndView mav = new ModelAndView("a_page/user_page_schedule");
		
		if(a_id != null){
			user = userDAO.selectUser(a_id);
			
			mav.addObject("a_id", user.getUser_id());
			mav.addObject("a_name", user.getUser_name());
			mav.addObject("a_image", user.getUser_img());
			mav.addObject("a_intro", user.getUser_intro());
			mav.addObject("fwrc", followerCount);
			mav.addObject("fwgc", followingCount);	
		}
		
		user = userDAO.selectUser(id);

		mav.addObject("id", user.getUser_id());
		mav.addObject("name", user.getUser_name());
		mav.addObject("image", user.getUser_img());
		mav.addObject("intro", user.getUser_intro());
		
		flag = flagMaster(followDAO.selectFollower(a_id), followDAO.selectFollowing(a_id), id, a_id);
		
		if(flag == 1){
			mav.addObject("fw","ok");
		} else {
			mav.addObject("fw","");
		}
		
		return mav;
	}

	@RequestMapping("/user_page_r.do")
	public ModelAndView review(
			@RequestParam(value = "id", required = false) String id,
			@RequestParam(value = "a_id", required = false) String a_id) {
		int flag = 0;
		UserVO user = null;
		String followerCount = followDAO.followerCount(a_id);
		String followingCount = followDAO.followingCount(a_id);
		ModelAndView mav = new ModelAndView("a_page/user_page_review");
		
		if(a_id != null){
			user = userDAO.selectUser(a_id);
			
			mav.addObject("a_id", user.getUser_id());
			mav.addObject("a_name", user.getUser_name());
			mav.addObject("a_image", user.getUser_img());
			mav.addObject("a_intro", user.getUser_intro());
			mav.addObject("fwrc", followerCount);
			mav.addObject("fwgc", followingCount);	
		} 
		user = userDAO.selectUser(id);

		mav.addObject("id", user.getUser_id());
		mav.addObject("name", user.getUser_name());
		mav.addObject("image", user.getUser_img());
		mav.addObject("intro", user.getUser_intro());
		
		flag = flagMaster(followDAO.selectFollower(a_id), followDAO.selectFollowing(a_id), id, a_id);
		
		if(flag == 1){
			mav.addObject("fw","ok");
		} else {
			mav.addObject("fw","");
		}
		
		return mav;
	}

	@RequestMapping("/user_page_fwr.do")
	public ModelAndView follower(
			@RequestParam(value = "id", required = false) String id,
			@RequestParam(value = "a_id", required = false) String a_id) {
		int flag = 0;
		UserVO user = null;
		String followerCount = followDAO.followerCount(a_id);
		String followingCount = followDAO.followingCount(a_id);
		ModelAndView mav = new ModelAndView("a_page/user_page_follower");
		
		if(a_id != null){
			user = userDAO.selectUser(a_id);
			
			mav.addObject("a_id", user.getUser_id());
			mav.addObject("a_name", user.getUser_name());
			mav.addObject("a_image", user.getUser_img());
			mav.addObject("a_intro", user.getUser_intro());
			mav.addObject("fwrc", followerCount);
			mav.addObject("fwgc", followingCount);	
		} 
		user = userDAO.selectUser(id);
		
		mav.addObject("id", user.getUser_id());
		mav.addObject("name", user.getUser_name());
		mav.addObject("image", user.getUser_img());
		mav.addObject("intro", user.getUser_intro());

		List<FollowVO> followerList = followDAO.selectFollower(a_id);
		List<FollowVO> followingList = followDAO.selectFollowing(a_id);		
		
		flag = flagMaster(followerList, followingList, id, a_id);
		
		if (followerList.isEmpty()) {
			mav.addObject("alert", "팔로워 유저 없음");
		} else {
			List<UserVO> userList = new ArrayList();
			
			for (int i = 0; i < followerList.size(); i++) {
				FollowVO follow = followerList.get(i);
				userList.add(userDAO.selectUser(follow.getUser_id()));
			}
			mav.addObject("alert", "");
			mav.addObject("followingList", userList);
		}
		
		if(flag == 1){
			mav.addObject("fw","ok");
		} else {
			mav.addObject("fw","");
		}
		
		return mav;
	}

	@RequestMapping("/user_page_fwg.do")
	public ModelAndView following(
			@RequestParam(value = "id", required = false) String id,
			@RequestParam(value = "a_id", required = false) String a_id) {
		int flag = 0;
		UserVO user = null;
		String followerCount = followDAO.followerCount(a_id);
		String followingCount = followDAO.followingCount(a_id);
		ModelAndView mav = new ModelAndView("a_page/user_page_following");
		
		if(a_id != null){
			user = userDAO.selectUser(a_id);
			
			mav.addObject("a_id", user.getUser_id());
			mav.addObject("a_name", user.getUser_name());
			mav.addObject("a_image", user.getUser_img());
			mav.addObject("a_intro", user.getUser_intro());
			mav.addObject("fwrc", followerCount);
			mav.addObject("fwgc", followingCount);	
		} 
		user = userDAO.selectUser(id);
		
		mav.addObject("id", user.getUser_id());
		mav.addObject("name", user.getUser_name());
		mav.addObject("image", user.getUser_img());
		mav.addObject("intro", user.getUser_intro());

		List<FollowVO> followerList = followDAO.selectFollower(a_id);
		List<FollowVO> followingList = followDAO.selectFollowing(a_id);		
		
		flag = flagMaster(followerList, followingList, id, a_id);
		
		if (followingList.isEmpty()) {
			mav.addObject("alert", "팔로잉 유저 없음");
		} else {
			List<UserVO> userList = new ArrayList();

			for (int i = 0; i < followingList.size(); i++) {
				FollowVO follow = followingList.get(i);
				userList.add(userDAO.selectUser(follow.getFollow_user_id()));
			}
			mav.addObject("alert", "");
			mav.addObject("followingList", userList);
		}


		if(flag == 1){
			mav.addObject("fw","ok");
		} else {
			mav.addObject("fw","");
		}

		return mav;
	}
	
	public int flagMaster(List<FollowVO> followerList, List<FollowVO> followingList, String id, String a_id){
		if (!followerList.isEmpty()) {
			return 1;
		} else {
			for(int i = 0; i < followingList.size(); i++){
				FollowVO follow = followingList.get(i);
				
				if(follow.getUser_id().equals(id)&&follow.getFollow_user_id().equals(a_id)){
					return 1;
				}
			}
		}
		return 0;
	}
}
