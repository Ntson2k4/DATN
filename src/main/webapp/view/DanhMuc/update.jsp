<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body class="container">
<form action="/danh-muc/update" method="post">
    <div class="col">
        <label  class="form-label">ID</label>
        <input type="text" class="form-control" name="id" value="${danhmuc.id}" readonly>
    </div>
    <div class="col">
        <label  class="form-label">Mã danh mục</label>
        <input type="text" class="form-control" name="maDanhMuc" value="${danhmuc.maDanhMuc}">
    </div>
    <div class="col">
        <label  class="form-label">Tên danh mục</label>
        <input type="text" class="form-control" name="tenDanhMuc" value="${danhmuc.tenDanhMuc}">
    </div>
    <div class="col">
        <label  class="form-label">Trạng thái</label>
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="trangThai" value="Active" ${danhmuc.trangThai == 'Active' ? "checked" : ""}>
            <label class="form-check-label">Active</label>
        </div>
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="trangThai" value="Inactive" ${danhmuc.trangThai == 'Inactive' ? "checked" : ""}>
            <label class="form-check-label">Inactive</label>
        </div>
    </div>
    <button type="submit" class="btn btn-primary">Save</button>

</form>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>