<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
		<div class="container">
		<div class="box_login">
		<div class=" btnBox_tit">
				<p>회원가입</p>
			</div>
<form action="${pageContext.request.contextPath}/member/join" method="post">
	<div class="form-group">
						<span>아이디</span> <input type="text" class="form-control" name="id"
							value="${param.id }" placeholder="ID를 입력하세요">
						<c:if test="${errors.id }">ID를 입력하세요</c:if>
						<c:if test="${errors.duplicateId }">이미 사용중인 아이디 입니다.</c:if>
					</div>
					<div class="form-group">
						<span>암호</span> <input type="password" class="form-control"
							name="passwd" placeholder="암호를 입력하세요">
						<c:if test="${errors.passwd }">암호를 입력하세요</c:if>
					</div>
					<div class="form-group">
						<span> 암호 확인</span> <input type="password" name="confirmpasswd"
							class="form-control" placeholder="암호를 입력하세요">
						<c:if test="${errors.confirmpasswd }">확인을 입력하세요</c:if>
						<c:if test="${errors.notMatch}">암호와 확인이 일치하지 않습니다.</c:if>
					</div>
					<div class="form-group">
						<span>이름</span> <input type="text" class="form-control"
							name="name" value="${param.name }" placeholder="이름을 입력하세요">
						<c:if test="${errors.name }">이름을 입력하세요</c:if>
					</div>
					<div class="form-group">
						<span>생년월일(6자리)</span> <input type="text" class="form-control"
							name="birth" value="${param.birth }" placeholder="생년월일을 입력하세요">
						<c:if test="${errors.birth }">생년월일(6자리)을 입력하세요</c:if>
					</div>
					<div class="form-group">
						<span>성별</span> <span> <input type="radio" class=""
							required="" autocomplete="off" name="sex" value="1"
							checked="checked"> 남자 <input type="radio" class=""
							required="" autocomplete="off" name="sex" value="2">여자
						</span>
						<c:if test="${errors.sex }">성별을 입력하세요</c:if>
					</div>

					<div class="form-group">
						<span>휴대폰 번호</span> <input type="text" class="form-control"
							name="phone">
						<c:if test="${errors.phone }">휴대폰 번호를 입력하세요</c:if>
					</div>
					<div class="form-group">
						<span>주소</span> <input type="text" class="form-control"
							name="address">
						<c:if test="${errors.address }">주소를 입력하세요</c:if>
					</div>
				<div class=" btnBox_center">
					<input type="submit" class="genric-btn primary radius" value="가입">
					 <a href="/teamproject/member/main" class="genric-btn info radius">[메인으로]</a>
				</div>
					
</form>
</div>
<%-- <form action="${pageContext.request.contextPath}/member/join" method="post">
<p>
	아이디:<br/><input type="text" name="id" value="${param.id }">
	<c:if test="${errors.id }">ID를 입력하세요</c:if>
	<c:if test="${errors.duplicateId }">이미 사용중인 아이디 입니다.</c:if>
</p>
<p>
	암호:<br/><input type="password" name="passwd">
	<c:if test="${errors.passwd }">암호를 입력하세요</c:if>
</p>
<p>
	확인:<br/><input type="password" name="confirmpasswd" >
	<c:if test="${errors.confirmpasswd }">확인을 입력하세요</c:if>
	<c:if test="${errors.notMatch}">암호와 확인이 일치하지 않습니다.</c:if>
</p>
<p>
	이름:<br/><input type="text" name="name" value="${param.name }">
	<c:if test="${errors.name }">이름을 입력하세요</c:if>
</p>
<p>
	생년월일(6자리):<br/><input type="text" name="birth" value="${param.birth }">
	<c:if test="${errors.birth }">생년월일(6자리)을 입력하세요</c:if>
</p>
<p>
	성별:<br/>
	<input type="radio" name="sex" value="1" checked="checked">남자
	<input type="radio" name="sex" value="2" >여자
	<c:if test="${errors.sex }">성별을 입력하세요</c:if>
</p>
<p>
	휴대폰 번호:<br/><input type="text" name="phone">
	<c:if test="${errors.phone }">휴대폰 번호를 입력하세요</c:if>
</p>
<p>
	주소:<br/><input type="text" name="address">
	<c:if test="${errors.address }">주소를 입력하세요</c:if>
</p>
<input type="submit" value="가입">
	<a href="${pageContext.request.contextPath}/member/main">[메인으로]</a>
</form> --%>
</div>
</div>
</body>
</html>