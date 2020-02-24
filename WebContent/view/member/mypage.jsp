<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Mypage</title>
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
		<div class=" btnBox_tit">
<p>마이페이지</p>
					
			</div>
<table border="1" class="coure_table">

<tr>
	
	<td>	<a href="${pageContext.request.contextPath}/member/myinfo">내정보 목록</a></td>
	<td><a href="${pageContext.request.contextPath}/member/changeinfo" >내정보 수정</a></td>
</tr>



	</table>
	<%-- <a href="${pageContext.request.contextPath}/member/main">[메인으로]</a>
	${authUser.name }님, 안녕하세요.
	<a href="${pageContext.request.contextPath}/member/logout">[로그아웃하기]</a> --%>
	<%-- <a href="${pageContext.request.contextPath}/member/changeinfo">[내정보
		수정]</a>
	<a href="${pageContext.request.contextPath}/member/myinfo">[내정보 보기]</a>
	<br>
	<br>
	<br> --%>
	<div class=" btnBox_center">

<a href="${pageContext.request.contextPath}/course/mylist" class="genric-btn info radius">[내수강 목록]</a>
<a href="${pageContext.request.contextPath}/rent/mylist" class="genric-btn info radius">[내 대관신청 목록]</a>
<a href="${pageContext.request.contextPath}/minwon/mylist" class="genric-btn info radius">[내민원]</a>
	

</div>

	<%-- <a href="${pageContext.request.contextPath}/course/mylist">[내수강 목록]</a>

	<br>
	<a href="${pageContext.request.contextPath}/rent/mylist">[내 대관신청
		정보@]</a>

	<br>
	<a href="${pageContext.request.contextPath}/minwon/mylist">[내민원
		목록@]</a> --%>

	
	
</div>
</div>
<!-- Footer Area start  -->
 	 <jsp:include page="/common/footer.jsp" />
    <!-- Footer Area end  -->
</body>
</html>