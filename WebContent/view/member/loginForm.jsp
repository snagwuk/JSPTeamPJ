<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<h2>Login</h2>
				<div class="page_link">
					<a href="index.jsp">Home</a> <a href="${pageContext.request.contextPath}/member/login">Login</a>
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
				<p>로그인</p>
				<!-- <a href="rent" class="genric-btn info radius">게시글쓰기</a> -->
			</div>	
			<form action="${pageContext.request.contextPath}/member/login"
				method="post">
				<c:if test="${errors.idOrPwNotMatch }">
아이디와 암호가 일치하지 않습니다.
</c:if>

				<div class="form-group">

					<input type="text" name="id" value="${param.id}"
						class="form-control" placeholder="아이디를 입력하세요">
					<c:if test="${errors.id }">ID를 입력하세요</c:if>
				</div>
				<div class="form-group">

					<input type="password" name="passwd"
						class="form-control" placeholder="암호를 입력하세요">
					<c:if test="${errors.passwd }">암호를 입력하세요</c:if>
				</div>
			<%-- 	<p>
					아이디:<br />
					<input type="text" name="id" value="${param.id}">
					<c:if test="${errors.id }">ID를 입력하세요</c:if>
				</p>
				<p>
					암호:<br />
					<input type="password" name="passwd">
					<c:if test="${errors.passwd }">암호를 입력하세요</c:if>
				</p> --%>
				<%-- <input type="submit" value="로그인">
<a href="${pageContext.request.contextPath}/member/join">[회원가입하기]</a>
<a href="${pageContext.request.contextPath}/member/main">[메인으로]</a>
 --%>
				<div class=" btnBox_center">
					<input type="submit" class="genric-btn primary radius" value="로그인">
					<a href="${pageContext.request.contextPath}/member/join"
						class="genric-btn info radius">[회원가입하기]</a> <a
						href="${pageContext.request.contextPath}/member/main"
						class="genric-btn info radius">[메인으로]</a>
				</div>
			</form>
</div>
		</div>
	</div>
	<!-- Footer Area start  -->
	<jsp:include page="/common/footer.jsp" />
	<!-- Footer Area end  -->
</body>
</html>