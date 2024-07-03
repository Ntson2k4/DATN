CREATE
DATABASE java4
use java4 
drop
database java4
CREATE TABLE san_pham
(
    id           INT IDENTITY(1,1) PRIMARY KEY,
    ma_san_pham  VARCHAR(255),
    ten_san_pham VARCHAR(255),
    trang_thai   VARCHAR(50), -- or INT, depending on how you represent status
    ngay_tao     DATETIME,
    ngay_sua     DATETIME
);
CREATE TABLE mau_sac
(
    id         INT IDENTITY(1,1) PRIMARY KEY,
    ma_mau     VARCHAR(255),
    ten_mau    VARCHAR(255),
    trang_thai VARCHAR(50), -- or INT, based on your status representation
    ngay_sua   DATETIME,
    ngay_tao   DATETIME
);
CREATE TABLE size
(
    id         INT IDENTITY(1,1) PRIMARY KEY,
    ma_size    VARCHAR(255),
    ten_size   VARCHAR(255),
    trang_thai VARCHAR(50), -- or INT, based on your status representation
    ngay_sua   DATETIME,
    ngay_tao   DATETIME
);
CREATE TABLE danh_muc
(
    id           INT IDENTITY(1,1) PRIMARY KEY,
    ma_danh_muc  VARCHAR(255),
    ten_danh_muc VARCHAR(255),
    trang_thai   VARCHAR(50), -- Adjust based on how you plan to represent the status
    ngay_tao     DATETIME,
    ngay_sua     DATETIME
);
CREATE TABLE khach_hang
(
    id         INT IDENTITY(1,1) PRIMARY KEY,
    ho_ten     NVARCHAR(255),
    dia_chi    NVARCHAR(255),
    sdt        VARCHAR(20),
    trang_thai VARCHAR(50), -- Adjust based on how you plan to represent the status
    ngay_tao   DATETIME,
    ngay_sua   DATETIME
);
CREATE TABLE ctsp
(
    id           INT IDENTITY(1,1) PRIMARY KEY,
    id_sp        INT NULL,
    id_mau_sac   INT NULL,
    id_size      INT NULL,
    gia_ban      DECIMAL(18, 2),
    so_luong_ton INT,
    trang_thai   VARCHAR(50), -- Adjust based on your representation of status
    ngay_tao     DATETIME,
    ngay_sua     DATETIME,
    CONSTRAINT fk_sp FOREIGN KEY (id_sp) REFERENCES san_pham (id) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_mau_sac FOREIGN KEY (id_mau_sac) REFERENCES mau_sac (id) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_size FOREIGN KEY (id_size) REFERENCES size (id) ON UPDATE CASCADE ON DELETE CASCADE,
);
CREATE TABLE hoa_don
(
    id            INT IDENTITY(1,1) PRIMARY KEY,
    id_khach_hang INT NULL,
    trang_thai    VARCHAR(50), -- Adjust based on how you represent the status
    ngay_tao      DATETIME,
    ngay_sua      DATETIME,
    dia_chi       NVARCHAR(255),
    so_dien_thoai VARCHAR(20),
    CONSTRAINT fk_khach_hang FOREIGN KEY (id_khach_hang) REFERENCES khach_hang (id) ON UPDATE CASCADE ON DELETE CASCADE,
);

CREATE TABLE hdct
(
    id           INT IDENTITY(1,1) PRIMARY KEY,
    id_hoa_don   INT NULL,
    id_ctsp      INT NULL,
    so_luong_mua INT,
    gia_ban      DECIMAL(18, 2),
    tong_tien    DECIMAL(18, 2),
    trang_thai   VARCHAR(50), -- Adjust based on how you represent the status
    ngay_tao     DATETIME,
    ngay_sua     DATETIME,
    CONSTRAINT fk_hoa_don FOREIGN KEY (id_hoa_don) REFERENCES hoa_don (id) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_ctsp FOREIGN KEY (id_ctsp) REFERENCES ctsp (id) ON UPDATE CASCADE ON DELETE CASCADE,
);
ALTER TABLE san_pham
    ADD id_danh_muc INT NULL;

ALTER TABLE san_pham
    ADD CONSTRAINT fk_san_pham_danh_muc
        FOREIGN KEY (id_danh_muc) REFERENCES danh_muc (id) ON UPDATE CASCADE ON DELETE CASCADE;


INSERT INTO san_pham (ma_san_pham, ten_san_pham, trang_thai, ngay_tao, ngay_sua, id_danh_muc)
VALUES ('Prod001', 'Product 1', 'Active', '2024-01-01', '2024-01-02', 1),
       ('Prod002', 'Product 2', 'Inactive', '2024-01-03', '2024-01-04', 2),
       ('Prod003', 'Product 3', 'Active', '2024-01-05', '2024-01-06', 3),
       ('Prod004', 'Product 4', 'Active', '2024-01-07', '2024-01-08', 1),
       ('Prod005', 'Product 5', 'Inactive', '2024-01-09', '2024-01-10', 2),
       ('Prod006', 'Product 6', 'Active', '2024-01-11', '2024-01-12', 3),
       ('Prod007', 'Product 7', 'Inactive', '2024-01-13', '2024-01-14', 1),
       ('Prod008', 'Product 8', 'Active', '2024-01-15', '2024-01-16', 2),
       ('Prod009', 'Product 9', 'Active', '2024-01-17', '2024-01-18', 3),
       ('Prod010', 'Product 10', 'Inactive', '2024-01-19', '2024-01-20', 1);
INSERT INTO danh_muc (ma_danh_muc, ten_danh_muc, trang_thai, ngay_tao, ngay_sua)
VALUES ('S001', 'Category 1', 'Active', '2024-03-22 08:00:00', '2024-03-22 08:00:00'),
       ('S002', 'Category 2', 'Inactive', '2024-03-21 09:30:00', '2024-03-21 09:30:00'),
       ('S003', 'Category 3', 'Active', '2024-03-20 10:45:00', '2024-03-20 10:45:00'),
       ('S004', 'Category 4', 'Active', '2024-03-19 11:20:00', '2024-03-19 11:20:00'),
       ('S005', 'Category 5', 'Inactive', '2024-03-18 12:15:00', '2024-03-18 12:15:00'),
       ('S006', 'Category 6', 'Active', '2024-03-17 13:00:00', '2024-03-17 13:00:00'),
       ('S007', 'Category 7', 'Active', '2024-03-16 14:30:00', '2024-03-16 14:30:00'),
       ('S008', 'Category 8', 'Inactive', '2024-03-15 15:45:00', '2024-03-15 15:45:00'),
       ('S009', 'Category 9', 'Active', '2024-03-14 16:10:00', '2024-03-14 16:10:00'),
       ('S010', 'Category 10', 'Active', '2024-03-13 17:20:00', '2024-03-13 17:20:00');
INSERT INTO mau_sac (ma_mau, ten_mau, trang_thai, ngay_sua, ngay_tao)
VALUES ('C001', 'Red', 'Active', '2024-03-22 08:00:00', '2024-03-22 08:00:00'),
       ('C002', 'Black', 'Active', '2024-03-22 08:00:00', '2024-03-22 08:00:00'),
       ('C003', 'Blue', 'Active', '2024-03-22 08:00:00', '2024-03-22 08:00:00'),
       ('C004', 'Pink', 'Inactive', '2024-03-22 08:00:00', '2024-03-22 08:00:00'),
       ('C005', 'Yellow', 'Inactive', '2024-03-22 08:00:00', '2024-03-22 08:00:00')
    INSERT
INTO size (ma_size, ten_size, trang_thai, ngay_sua, ngay_tao)
VALUES
    ('S001', 'S', 'Active', '2024-03-22 08:00:00', '2024-03-22 08:00:00'),
    ('S002', 'M', 'Active', '2024-03-22 08:00:00', '2024-03-22 08:00:00'),
    ('S003', 'L', 'Active', '2024-03-22 08:00:00', '2024-03-22 08:00:00'),
    ('S004', 'X', 'Active', '2024-03-22 08:00:00', '2024-03-22 08:00:00'),
    ('S005', 'XX', 'Active', '2024-03-22 08:00:00', '2024-03-22 08:00:00')

INSERT INTO ctsp (id_sp, id_mau_sac, id_size, gia_ban, so_luong_ton, trang_thai, ngay_sua, ngay_tao)
VALUES
    (2, 1, 1, 10000, 10, 'Active', '2024-03-22 08:00:00', '2024-03-22 08:00:00'),
    (2, 3, 4, 12000, 9, 'Active', '2024-03-22 08:00:00', '2024-03-22 08:00:00'),
    (3, 4, 2, 80000, 7, 'Active', '2024-03-22 08:00:00', '2024-03-22 08:00:00'),
    (4, 3, 3, 10000, 10, 'Active', '2024-03-22 08:00:00', '2024-03-22 08:00:00'),
    (5, 2, 3, 8000, 4, 'Active', '2024-03-22 08:00:00', '2024-03-22 08:00:00')

INSERT INTO khach_hang(ho_ten, dia_chi, sdt, trang_thai, ngay_sua, ngay_tao)
VALUES
    ('Nguyen Van A', 'Ha Noi', '0937183923', 'Active', '2024-03-22 08:00:00', '2024-03-22 08:00:00'),
    ('Nguyen Van B', 'Ha Noi', '0974567728', 'Active', '2024-03-22 08:00:00', '2024-03-22 08:00:00'),
    ('Nguyen Van C', 'Ha Noi', '0937183923', 'Active', '2024-03-22 08:00:00', '2024-03-22 08:00:00'),
    ('Nguyen Van D', 'Ha Noi', '0937183923', 'Active', '2024-03-22 08:00:00', '2024-03-22 08:00:00')

INSERT INTO hoa_don(id_khach_hang, dia_chi, so_dien_thoai, trang_thai, ngay_sua, ngay_tao)
VALUES
    (1, 'Ha Noi', '0937183923', 'Chua thanh toan', '2024-03-22 08:00:00', '2024-03-22 08:00:00'),
    (2, 'Ha Noi', '0974567728', 'Chua thanh toan', '2024-03-22 08:00:00', '2024-03-22 08:00:00'),
    (3, 'Ha Noi', '0937183923', 'Chua thanh toan', '2024-03-22 08:00:00', '2024-03-22 08:00:00'),
    (4, 'Ha Noi', '0937183923', 'Chua thanh toan', '2024-03-22 08:00:00', '2024-03-22 08:00:00')

INSERT INTO hdct(id_hoa_don, id_ctsp, so_luong_mua, gia_ban, tong_tien, trang_thai, ngay_sua, ngay_tao)
VALUES
    (1, 2, 2, 10000, 20000, 'Active', '2024-03-22 08:00:00', '2024-03-22 08:00:00'),
    (1, 2, 3, 12000, 36000, 'Active', '2024-03-22 08:00:00', '2024-03-22 08:00:00'),
    (1, 5, 2, 8000, 16000, 'Active', '2024-03-22 08:00:00', '2024-03-22 08:00:00'),
    (2, 3, 2, 10000, 20000, 'Active', '2024-03-22 08:00:00', '2024-03-22 08:00:00'),
    (3, 2, 2, 80000, 240000, 'Active', '2024-03-22 08:00:00', '2024-03-22 08:00:00'),
    (3, 4, 1, 10000, 10000, 'Active', '2024-03-22 08:00:00', '2024-03-22 08:00:00'),
    (4, 5, 5, 10000, 50000, 'Active', '2024-03-22 08:00:00', '2024-03-22 08:00:00')
select *
from san_pham
select *
from mau_sac
select *
from size
select *
from danh_muc
select *
from ctsp
select *
from hoa_don
select *
from hdct
select *
from khach_hang
select *
from hdct
where id_hoa_don = 1031
  and id_ctsp = 1

select hd.id, SUM(ct.tong_tien) as tongtien
from hoa_don hd
         join hdct ct on hd.id = ct.id_ctsp
group by hd.id

