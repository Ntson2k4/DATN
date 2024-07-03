package com.example.demo.controller;

import com.example.demo.entity.DanhMuc;
import com.example.demo.repository.DanhMucRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Date;

@Controller

public class DanhMucController {
    @Autowired
    private DanhMucRepo dmRepo;

    @GetMapping("/danh-muc/hien-thi")
    public String Index(Model model){
        model.addAttribute("list",dmRepo.findAll());
        return "/DanhMuc/index";
    }

    @PostMapping("/danh-muc/add")
    public String Add(@ModelAttribute DanhMuc danhMuc){
        danhMuc.setNgayTao(new Date());
        dmRepo.save(danhMuc);
        return "redirect:/danh-muc/hien-thi";
    }

    @GetMapping("/danh-muc/remove/{id}")
    public String Remove(@PathVariable("id") int id){
        dmRepo.deleteById((long) id);
        return "redirect:/danh-muc/hien-thi";
    }
}
