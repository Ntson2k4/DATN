package com.example.a123.controller;

import com.example.a123.entity.DanhMuc;
import com.example.a123.repository.DanhMucRepository;
import org.hibernate.type.descriptor.jdbc.LocalDateJdbcType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@Controller
@RequestMapping("/danh-muc")
public class DanhMucController {

    @Autowired
    DanhMucRepository danhMucRepository;


    @GetMapping("/hien-thi")
    public String hienthi(Model model){
        model.addAttribute("list",danhMucRepository.findAll());
        return "index";
    }

    @PostMapping("/update")
    public String update(DanhMuc danhMuc){
        danhMuc.setNgayTao(danhMucRepository.findById(danhMuc.getId()).get().getNgayTao());
        danhMuc.setNgaySua(LocalDate.now());
        danhMucRepository.save(danhMuc);
        return "redirect:/danh-muc/hien-thi";
    }



    @GetMapping("/detail")
    public String detail(@RequestParam("id") int id,Model model){
        model.addAttribute("danhmuc",danhMucRepository.findById(id).get());
        return "update";
    }


}
