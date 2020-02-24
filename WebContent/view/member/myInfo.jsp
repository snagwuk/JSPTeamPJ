<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>myInfo</title>
</head>
<body>

			<section class="banner_area">
			<div class="banner_inner d-flex align-items-center">
				<div class="overlay bg-parallax" data-stellar-ratio="0.9"
					data-stellar-vertical-offset="0" data-background=""></div>
				<div class="container">
					<div class="banner_content text-center">
						<h2>마이페이지</h2>
						<div class="page_link">
							<a href="index.jsp">Home</a> <a href="${pageContext.request.contextPath}/member/mypage">마이페이지</a>
						</div>
					</div>
				</div>
			</div>
			</section>
			<!--================End Home Banner Area =================-->

	<div class="whole-wrap">
		<div class="container mb-30">
		<div class=" btnBox_tit">
				<p>내 정보 목록</p>
				<a href="${pageContext.request.contextPath}/member/changeinfo" class="genric-btn info radius">내정보 수정</a>
			</div>
			<p>${authUser.name }님, 안녕하세요.</p>
		<table border="1" class="coure_table">
			<tr>
				<td >아이디</td>
				<td>${myInfo.id}</td>
			<tr>
			<tr>
				<td >이름</td>
				<td>${myInfo.name}</td>
			<tr>
			<tr>
				<td >생년월일</td>
				<td>${myInfo.birth}</td>
			<tr>
			<tr>
				<td >성별</td>
				<td>
				<c:if test="${myInfo.sex == 1}">
	남자
	</c:if>
	<c:if test="${myInfo.sex == 2}">
	여자
	</c:if>
	</td>
			<tr>
			<tr>
				<td >휴대폰 번호</td>
				<td>${myInfo.phone}</td>
			<tr>
			<tr>
				<td >주소</td>
				<td>${myInfo.address}</td>
			<tr>
			<tr>
				<td >회원구분</td>
				<td><c:if test="${myInfo.admin == 0}">
	일반회원
	</c:if>
	<c:if test="${myInfo.admin != 0}">
	관리자 회원
	</c:if></td>
			<tr>
		</table>
<%-- <p>
	아이디:<br/>${myInfo.id}
</p>
<p>
	이름:<br/>${myInfo.name}
</p>
<p>
	생년월일:<br/>${myInfo.birth}
</p>
<p>
	성별:<br/>
	<c:if test="${myInfo.sex == 1}">
	남자
	</c:if>
	<c:if test="${myInfo.sex == 2}">
	여자
	</c:if>
</p>
<p>
	휴대폰 번호:<br/> ${myInfo.phone}
</p>
<p>
	주소:<br/>${myInfo.address}
</p>
<p> 
	회원구분:<br/> 
	<c:if test="${myInfo.admin == 0}">
	일반회원
	</c:if>
	<c:if test="${myInfo.admin != 0}">
	관리자 회원
	</c:if>
</p> --%>

	<%-- 
	<a href="${pageContext.request.contextPath}/member/main">[메인으로]</a>
	<a href="${pageContext.request.contextPath}/member/changeinfo">[내정보 수정]</a> --%>
</div>
</div>
<!-- Footer Area start  -->
	<jsp:include page="/common/footer.jsp" />
	<!-- Footer Area end  -->
</body>
</html>