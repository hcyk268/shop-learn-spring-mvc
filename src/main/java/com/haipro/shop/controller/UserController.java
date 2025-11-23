package com.haipro.shop.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.haipro.shop.service.UserService;
import com.haipro.shop.domain.User;
import com.haipro.shop.repository.UserRepository;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/")
    public String getHomePage(Model model) {
        model.addAttribute("haivar", "Chua co cai gi het a");
        return "test";
    }

    @RequestMapping("/admin/user/create")
    public String getUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
    public String createUserPage(Model model, @ModelAttribute("newUser") User dataUser) {
        this.userService.handleSaveUser(dataUser);
        return "redirect:/admin/user";
    }

    @RequestMapping("/admin/user")
    public String getUserTable(Model model) {
        List<User> allUsers = this.userService.getAllUsers();
        model.addAttribute("allUsers", allUsers);
        return "admin/user/userlist";
    }

    @GetMapping("/admin/user/{id}")
    public String getDetailUserPage(Model model, @PathVariable long id) {
        User userdetail = this.userService.getUserById(id);
        model.addAttribute("userdetail", userdetail);
        return "admin/user/showinforuser";
    }

    @GetMapping("admin/user/update/{id}")
    public String getUpdateUserPage(Model model, @PathVariable long id) {
        User userupdate = this.userService.getUserById(id);
        model.addAttribute("updateUser", userupdate);
        return "admin/user/update";
    }

    @PostMapping("admin/user/update")
    public String postUpdateUser(Model model, @ModelAttribute("updateUser") User updateUser) {
        User curr = this.userService.getUserById(updateUser.getId());
        if (curr != null) {
            curr.setAddress(updateUser.getAddress());
            curr.setFullname(updateUser.getFullname());
            curr.setPhone(updateUser.getPhone());
            this.userService.handleSaveUser(curr);
        }
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/delete/{id}")
    public String getDeleteUserPage(Model model, @PathVariable long id) {
        User delu = this.userService.getUserById(id);
        model.addAttribute("deleteUser", delu);
        return "admin/user/delete";
    }

    @PostMapping("/admin/user/delete")
    public String postDeleteUser(Model model, @ModelAttribute("deleteUser") User deleteUser) {
        this.userService.deleteUserById(deleteUser.getId());
        return "redirect:/admin/user";
    }

}
