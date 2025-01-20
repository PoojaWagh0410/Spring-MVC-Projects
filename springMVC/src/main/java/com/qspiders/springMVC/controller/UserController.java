package com.qspiders.springMVC.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.qspiders.springMVC.dto.UserDTO;
import com.qspiders.springMVC.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping(path = "/home-page")
	protected String getHomePage(HttpSession httpSession) {
		UserDTO authenticatedUser = (UserDTO) httpSession.getAttribute("authenticatedUser");
		if (authenticatedUser != null)
			return "home_page";
		else
			return "login";
	}

	@RequestMapping(path = "/sign-up-page")
	protected String getSignUpPage() {
		return "sign_up";
	}

	@RequestMapping(path = "/login-page")
	protected String getLoginPage() {
		return "login";
	}

	@RequestMapping(path = "/add-user", method = RequestMethod.POST)
	protected String addUser(@RequestParam(name = "username") String name, @RequestParam(name = "email") String email,
			@RequestParam(name = "mobile") long mobile, @RequestParam(name = "password") String password,
			ModelMap modelMap) {

		boolean userAdded = userService.addUser(name, email, mobile, password);

		if (userAdded) {
			modelMap.addAttribute("message", "User Added Sucessfully");
			return "login";
		} else {
			modelMap.addAttribute("message", "Something went wrong");
			return "sign_up";
		}
	}

	@RequestMapping(path = "/auth-user")
	protected String authUser(@RequestParam(name = "email") String email,
			@RequestParam(name = "password") String password, ModelMap modelMap, HttpSession httpSession) {

		UserDTO authenticatedUser = userService.authUser(email, password);

		if (authenticatedUser != null) {
			httpSession.setAttribute("authenticatedUser", authenticatedUser);
			httpSession.setMaxInactiveInterval(100000);

			modelMap.addAttribute("message", "User login Sucessfuly");
			return "home_page";
		} else {
			modelMap.addAttribute("message", "Invalid email or password, try again...");
			return "login";
		}
	}

	@RequestMapping(path = "/logout")
	protected String logout(ModelMap modelMap, HttpSession httpSession) {
		httpSession.invalidate();
		modelMap.addAttribute("message", "User logout Sucessfully...");
		return "login";
	}
	
	@RequestMapping(path="/users")
	protected String findAllUsers(ModelMap modelMap) {
		List<UserDTO> users = userService.findAllUsers();
		
		if(users != null )
			modelMap.addAttribute("users", users);
		else
			modelMap.addAttribute("message", "Something went Wrong");
		return "users";
	}	
	
	
	@RequestMapping(path="/delete-user")
	protected String deleteUserById(@RequestParam(name="id") int id, ModelMap modelMap) {
		boolean userDeleted = userService.deleteUserById(id);
		
		if(userDeleted) {
			modelMap.addAttribute("message","User deleted Sucessfully");
			List<UserDTO> users = userService.findAllUsers();
			modelMap.addAttribute("users",users);
		}else {
			modelMap.addAttribute("message","Something went wrong");			
		}
		return "users";
	}
	

	@RequestMapping(path = "/edit-user")
	protected String editUser(@RequestParam(name = "id") int id, ModelMap modelMap) {
		UserDTO users = userService.findUser(id);
		modelMap.addAttribute("users", users);
		return "edit_user";
	}

	@RequestMapping(path = "/update-user", method = RequestMethod.POST)
	protected String updateuser(@RequestParam(name = "id") int id, @RequestParam(name = "username") String name,
			@RequestParam(name = "email") String email, @RequestParam(name = "mobile") long mobile,
			@RequestParam(name = "password") String password, ModelMap modelMap) {

		boolean userUpdated = userService.updateUser(id, name, email, mobile, password);
		if (userUpdated) {
			modelMap.addAttribute("message", "User Updated sucessfully");
			List<UserDTO> users = userService.findAllUsers();
			modelMap.addAttribute("users", users);
		} else {
			modelMap.addAttribute("message", "Something went wrong");
		}
		return "users";
	}

	
}
