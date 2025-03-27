<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="/css/input.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />


</head>
<body>
    <nav>
		<div class="logo">
			<h1>Admin</h1>
		</div>
		<div class="menu">
			<ul>
				<!-- <li><a href="/add/cartoon">เพิ่มข้อมูล <i class="fas fa-plus"></i></a></li> -->
			</ul>
		</div>
	</nav>
    <div class="show">
        <ul>
            <li><a href="/s">หน้าแรก</a></li>
            <li>/</li>
            <li>แก้ไขข้อมูล</li>
        </ul>
    </div>
    <h1>เพิ่มข้อมูล</h1>
    <div class="form">
        <form action="/update-cartoon" method="post">
            <input type="hidden" value="${Cartoons.id}" name="id">
            <input type="hidden" name="love" value="${Cartoons.love}">
            <label for="">ชื่อการ์ตูน</label>
            <input type="text" name="nameCartoon" value="${Cartoons.nameCartoon}">
            <label for="">รายละเอียด</label>
            <input type="text" name="detail" value="${Cartoons.detail}">
            <label for="ชื่อผู้เขียน"></label>
            <input type="text" name="author" value="${Cartoons.author}">
            <input type="submit" value="แก้ไข">
        </form>
    </div>
</body>
</html>