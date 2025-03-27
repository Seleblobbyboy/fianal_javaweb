<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="/css/detail.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
</head>
<body>
    <nav>
		<div class="logo">
			<h1>Admin</h1>
		</div>
		<div class="menu">
			<ul>
				<li><a href="/updat/${Cartoons.id}">แก้ไข <i class="fas fa-pen"></i></a></li>
                <li><a href="/delete/${Cartoons.id}" class="delete">ลบ <i class="fas fa-trash"></i></a></li>
			</ul>
		</div>
	</nav>
    <div class="show">
        <ul>
            <li><a href="/s">หน้าแรก</a></li>
            <li>/</li>
            <li>รายละเอียด ${Cartoons.nameCartoon}</li>
        </ul>
    </div>
    
    <div class="content">
        <div class="nameCartoon">
            <h1>ชื่อเรื่อง ${Cartoons.nameCartoon} </h1>
            <div class="author">
                <p>ผู้เขียย ${Cartoons.author} 
                    <fmt:setLocale value="th_TH"/>
                    <fmt:formatDate value="${Cartoons.date}" pattern="d MMMM yyyy"/>
                </p>
            </div>
            <div class="love">
                <p>คนถูกใจ ${Cartoons.love}</p>
            </div>
        </div>
        <div class="detail-content">
            <div class="detail">
                <h2>รายละเอียด</h2>
                <p>${Cartoons.detail}</p>
            </div>
           
        </div>
    </div>

    <div class="comment">
        <form action="/add-comment" method="post">
            <h1>ความคิดเห็น</h1>
            <input type="hidden" name="cartoonID" value="${Cartoons.id}">
            <label for="ชื่อ">ชื่อ</label>
            <input type="text" name="name">
            <label for="ความคิดเห็น">แสดงความคิดเห็น</label>
            <textarea name="text" required></textarea>
            <input type="submit" value="ส่ง">
        </form>
    </div>
    <div class="show-comment">
        <h1>ความคิดเห็นทั้งหมด</h1>
        <c:forEach var="comment" items="${Comments}">
            <c:if test="${Cartoons.id == comment.cratoon.id}"> 
                <div class="comment-user">
                    <div class="porfile">
                        <i class="fas fa-user-circle"></i>
                    </div>
                    <div class="group">
                        <div class="name">
                            <h3>${comment.name}</h3>
                        </div>
                        <div class="mes">
                            <p>${comment.text}</p>
                        </div>
                    </div>
                   
                </div>
            </c:if>
        </c:forEach>
    </div>
    
   
    
</body>
</html>