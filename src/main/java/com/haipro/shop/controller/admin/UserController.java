package com.haipro.shop.controller.admin;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.haipro.shop.service.UploadService;
import com.haipro.shop.service.UserService;
import com.haipro.shop.domain.User;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UserController {

    private final UserService userService;
    private final UploadService uploadService;

    public UserController(UserService userService, UploadService uploadService) {
        this.userService = userService;
        this.uploadService = uploadService;
    }

    @RequestMapping("/")
    public String getHomePage(Model model) {
        model.addAttribute("haivar", "Chua co cai gi het a");
        return "test";
    }

    @GetMapping("/admin/user/create")
    public String getUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @PostMapping("/admin/user/create")
    public String createUserPage(Model model, @ModelAttribute("newUser") User dataUser,
            @RequestParam("avatarFile") MultipartFile file) {
        String avatarpathname = this.uploadService.SaveUploadFile(file, "avatar");
        // this.userService.handleSaveUser(dataUser);
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
