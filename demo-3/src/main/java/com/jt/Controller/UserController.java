package com.jt.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jt.Service.UserService;
import com.jt.pojo.User;
import com.jt.vo.SysResult;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@RequestMapping("/deleteUser")
	@ResponseBody
	public SysResult deleteUser(Integer id) {
		userService.deleteUser(id);
		System.out.println("id="+id);
		return new SysResult(200,"删除成功！",null);
	}
	
	@RequestMapping("/updataUser")
	public SysResult updataUser(User entity,Integer[] userIds) {
		userService.updataUser(entity,userIds);
		return new SysResult(200,"修改成功！",null);
	}

	@RequestMapping("/findAll")
	public String findAll(Model model) {
		//User user = new User();
		//QueryWrapper<User> queryWrapper = new QueryWrapper<>(user);

		List<User> userList = userService.findAll();
		System.out.println("userList:"+userList);
		model.addAttribute("userList", userList);
		return "userList";
	}

	@RequestMapping("/ajax")
	public String findAll() {
		return "ajax";
	}

	@RequestMapping("/findAjaxUser")
	@ResponseBody
	public SysResult findAjaxUser() {
		//List<User> userList = userService.findAll();
		try {
			List<User> userList = userService.findAll();
			return new SysResult(200, "服务器处理正确", userList);

		} catch (Exception e) {
			e.printStackTrace();
			return new SysResult(201, "系统正在维护,请稍后重试!!!(大SB别等了,后台错了!!!)", null);
		}
	}
	
	@RequestMapping("/doLoadEditUI")
	public String doLoadEditUI() {
		System.out.println("加载编辑页面......");
		return "user_edit";
	}
	
	/*
	 * @RequestMapping("/doCancel") public String name() {
	 * System.out.println("fhfhfhfhffhfh"); return "forward:findAll"; }
	 */
	
}