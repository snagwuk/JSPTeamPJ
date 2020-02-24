<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 대관 신청 목록</title>
</head>
<body>
	<section class="banner_area">
	<div class="banner_inner d-flex align-items-center">
		<div class="overlay bg-parallax" data-stellar-ratio="0.9"
			data-stellar-vertical-offset="0" data-background=""></div>
		<div class="container">
			<div class="banner_content text-center">
		<h2>대관 안내</h2>
		<div class="page_link">
			<a href="${pageContext.request.contextPath}/member/main">Home</a> <a
				href="${pageContext.request.contextPath}/rent/list">대관 안내</a>
		</div>
	</div>
		</div>
	</div>
	</section>
	<!--================End Home Banner Area =================-->

	<div class="whole-wrap">
		<div class="container mb-30">
			<div class=" btnBox_tit">
				<p>나의 대관 신청 목록</p>
				<a href="list" class="genric-btn info radius">대관 신청 목록</a> 
			</div>



			<table border="1" class="coure_table">

				<tr>
					<td>번호</td>
					<td>처리여부</td>
					<td>신청자</td>
					<td>장소</td>
					<td>대관날짜</td>
					<td>대관신청일</td>
				</tr>
				<c:forEach var="rent" items="${rentList}">
					<tr>
						<td>${rent.no}</td>
						<td><c:if test="${rent.status==1}">승인</c:if> <c:if
								test="${rent.status==2}">반려</c:if> <c:if
								test="${rent.status==0}">미답변</c:if></td>
						<td align="center"><a
							href="${pageContext.request.contextPath}/rent/content?no=${rent.no}">${rent.name}</a>
						</td>
						<td>${rent.location}</td>
						<td>${rent.r_date}</td>
						<td>${rent.regDate}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>

	<!-- Footer Area start  -->
	<jsp:include page="/common/footer.jsp" />
	<!-- Footer Area end  -->
</body>
</html>