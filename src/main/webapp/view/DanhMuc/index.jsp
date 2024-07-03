<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<form action="/danh-muc/add" method="post">
    Mã danh mục :
    <input type="text" name="maDM"><br>
    Tên danh mục :
    <input type="text" name="tenDM"><br>
    Trạng thái :
    <input type="radio" name="trangThai" value="Active">
    <label>Active</label>
    <input type="radio" name="trangThai" value="Inactive">
    <label>Inactive</label><br>
    <button>Add</button>
</form>

<h3>Danh Mục</h3>
<table border="1">
    <thead>
    <tr>
        <th>ID</th>
        <th>Mã danh mục</th>
        <th>Tên danh mục</th>
        <th>Trạng thái</th>
        <th>Ngày tạo</th>
        <th>Ngày Sửa</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="dm">
        <tr>
            <td>${dm.id}</td>
            <td>${dm.maDM}</td>
            <td>${dm.tenDM}</td>
            <td>${dm.trangThai}</td>
            <td>${dm.ngayTao}</td>
            <td>${dm.ngaySua}</td>
            <td>
                <a href="/danh-muc/view-update/${dm.id}">
                    <button>Update</button>
                </a>
            </td>
            <td>
                <a href="/danh-muc/remove/${dm.id}">
                    <button>Remove</button>
                </a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
