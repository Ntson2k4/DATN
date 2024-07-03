package com.example.demo.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Entity
@Table(name = "danh_muc")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class DanhMuc {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    public int id;

    @Column(name = "ma_danh_muc")
    public String maDM;

    @Column(name = "ten_danh_muc")
    public String tenDM;

    @Column(name = "trang_thai")
    public String trangThai;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "ngay_tao")
    public Date ngayTao;

    @Column(name = "ngay_sua")
    public Date ngaySua;


}
