<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 민원 목록</title>
</head>
<body>


	<section class="banner_area">
	<div class="banner_inner d-flex align-items-center">
		<div class="overlay bg-parallax" data-stellar-ratio="0.9"
			data-stellar-vertical-offset="0" data-background=""></div>
		<div class="container">
			<div class="banner_content text-center">
				<h2>고객의 소리</h2>
				<div class="page_link">
					<a href="${pageContext.request.contextPath}/member/main">Home</a> <a
						href="${pageContext.request.contextPath}/minwon/list">고객의 소리</a>
				</div>
			</div>
		</div>
	</div>
	</section>
	<!--================End Home Banner Area =================-->
	<!-- Start Align Area -->
	<div class="whole-wrap mb-30">
		<div class="container">
			<div class=" btnBox_tit">
				<p>나의 민원목록</p>
				<a href="${pageContext.request.contextPath}/minwon/write"
					class="genric-btn info radius">글쓰기</a>
			</div>
			<%-- <a href="${pageContext.request.contextPath}/member/main">[메인으로]</a>
	<br>
	<br>
	<a href="${pageContext.request.contextPath}/minwon/list">[민원 목록으로]</a>
	<br>
	<br> --%>
			<table border="1" class="coure_table">
				<tr class="w3-grey">
					<td align="center" width="50">번호</td>
					<td align="center" width="100">답변상태</td>
					<td align="center" width="200">제목</td>
					<td align="center" width="100">좋아요</td>
					<td align="center" width="100">작성자</td>
					<td align="center" width="150">작성일</td>
					<td align="center" width="50">조회수</td>
				</tr>


				<c:forEach var="minwon" items="${minwonList}">
					<tr>
						<td align="center" width="50">${minwon.num}</td>
						<td align="center" width="50"><c:if
								test="${minwon.ans_check==1}">답변완료</c:if> <c:if
								test="${minwon.ans_check==0}">미답변</c:if></td>
						<td align="center"><a
							href="${pageContext.request.contextPath}/minwon/content?num=${minwon.num}">${minwon.subject}</a>
						</td>
						<td align="center" width="50">${minwon.like}</td>
						<td align="center" width="50">${minwon.id}</td>
						<td align="center" width="100">${minwon.article_date}</td>
						<td align="center" width="100">${minwon.read_cnt}</td>
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