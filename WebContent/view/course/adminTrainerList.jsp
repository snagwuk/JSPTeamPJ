<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[admin] 강사 관리</title>
</head>
<body>

	<section class="banner_area">
	<div class="banner_inner d-flex align-items-center">
		<div class="overlay bg-parallax" data-stellar-ratio="0.9"
			data-stellar-vertical-offset="0" data-background=""></div>
		<div class="container">
			<div class="banner_content text-center">
				<h2>강사 목록</h2>
				<div class="page_link">
					<a href="index.jsp">Home</a> <a
						href="${pageContext.request.contextPath}/rent/list">강사 목록</a>
				</div>
			</div>
		</div>
	</div>
	</section>
	<!--================End Home Banner Area =================-->

	<div class="whole-wrap">
		<div class="container">
			<div class=" btnBox_tit">
				<h2>강사 추가</h2>
			<table border="1" width="100%" class="coure_table">
				<form action="${pageContext.request.contextPath}/course/trainernew"
					method="post">
					<tr>
						<td>코드</td>
						<td>강사이름</td>
						<td>이메일</td>
						<td>자격증</td>
						<td>연락처</td>
						<td>생성</td>
					</tr>
					<tr>
						<td><input type="text" name="train_code"
							value="${selectTrainer.train_code}"></td>
						<td><input type="text" name="name"
							value="${selectTrainer.name}"></td>
						<td><input type="text" name="email"
							value="${selectTrainer.email}"></td>
						<td><input type="text" name="license"
							value="${selectTrainer.license}"></td>
						<td><input type="text" name="tel"
							value="${selectTrainer.tel}"></td>
						<td><input type="submit" value="강사생성"></td>
					</tr>
				</form>
			</table>
			</div>

			

			<h2>강사 목록</h2>
			<table border="1" width="100%" class="coure_table">
				<tr>
					<td>코드</td>
					<td>강사이름</td>
					<td>이메일</td>
					<td>자격증</td>
					<td>연락처</td>
					<td>삭제</td>
				</tr>
				<c:forEach var="selectTrainer" items="${trainerlist}">
					<tr>
						<td>${selectTrainer.train_code}</td>
						<td>${selectTrainer.name}</td>
						<td>${selectTrainer.email}</td>
						<td>${selectTrainer.license}</td>
						<td>${selectTrainer.tel}</td>
						<td><a
							href="${pageContext.request.contextPath}/course/trainerdelete?train_code=${selectTrainer.train_code}">[강사삭제]</a></td>
					</tr>
				</c:forEach>
			</table>
</body>
</html>