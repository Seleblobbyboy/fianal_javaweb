<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="css/home.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
	<nav>
		<div class="logo">
			<h1>Admin</h1>
		</div>
		<div class="menu">
			<ul>
				<li><a href="/add/cartoon">เพิ่มข้อมูล <i class="fas fa-plus"></i></a></li>
			</ul>
		</div>
	</nav>
    <div class="search">
        <form action="/searchCartoon" method="get">
            <input type="text" name="keyword" placeholder="ค้นหา">
            <input type="submit" value="ค้นหา">
        </form>
    </div>
    <div class="content">
        <c:forEach var="Cartoon" items="${Cartoons}">
            <div class="crad">
                <div class="detill">
					<div class="head">
						<h1><i class="fas fa-file-signature"></i> ${Cartoon.nameCartoon}</h1>
						<p>รายละเอียด</p>
						<p>${Cartoon.detail}</p>
					</div>
					<div class="bottom">
						<div class="love-sum">
							<p>ผู้เขียน : ${Cartoon.author}</p>
							<p>คนถูกใจ ${Cartoon.love}</p>
						</div>
						<div class="button">
							<a href="/Cartoon/detail/${Cartoon.id}" class="deteil">ดูรายละเอียด</a>
							<a href="/add/love/${Cartoon.id}" class="love"><i class="fas fa-heart"></i></a>
						</div>
					</div>
					
                </div>
            </div>
        </c:forEach>
		<!-- <div class="detill">
			<h1><a href="/Cartoon/detail/${Cartoon.id}">${Cartoon.nameCartoon}</a></h1>
			<p>${Cartoon.detail}</p>
			<p>${Cartoon.date}</p>
			<p>คนถูกใจ ${Cartoon.love}</p>
			<a href="/add/love/${Cartoon.id}">กดใจ</a>
		</div> -->
    </div>
</body>
</html>
