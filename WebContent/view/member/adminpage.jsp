<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 페이지</title>
</head>
<body>


	<section class="banner_area">
	<div class="banner_inner d-flex align-items-center">
		<div class="overlay bg-parallax" data-stellar-ratio="0.9"
			data-stellar-vertical-offset="0" data-background=""></div>
		<div class="container">
			<div class="banner_content text-center">
				<h2>관리자 페이지</h2>
				<div class="page_link">
					<a href="index.jsp">Home</a> <a href="applyForm.jsp">관리자 페이지</a>
				</div>
			</div>
		</div>
	</div>
	</section>
	<!--================End Home Banner Area =================-->

	<div class="whole-wrap">
		<div class="container mb-30">
			<div class=" btnBox_tit">
				<p>[관리자 권한 기능]</p>
			

				<a  class="genric-btn info radius " href="${pageContext.request.contextPath}/member/list">[회원목록]</a>
				<%-- <a class="genric-btn info radius"  href="${pageContext.request.contextPath}/course/list">[강좌관리]</a>
				<a class="genric-btn info radius" href="${pageContext.request.contextPath}/course/applylist">[수강목록관리]</a> --%>
				<a class="genric-btn info radius mr-20"  href="${pageContext.request.contextPath}/course/trainerlist">[강사
					관리]</a> 
					<a class="genric-btn info radius mr-20" href="${pageContext.request.contextPath}/rent/locationlist">[대관장소관리]</a>
 <a class="genric-btn info radius mr-20" href="${pageContext.request.contextPath}/rent/list">[대관신청목록]</a>
			</div>

			<h2>미답변 민원 리스트</h2>

			<c:if test="${minwonsize==0}">
				<table border="1" width="700">
					<tr>
						<td align="center">미답변 민원이 없습니다...</td>
					</tr>
				</table>
			</c:if>
			<c:if test="${minwonsize!=0}">
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
					<c:forEach var="minwon" items="${adminminwon}">
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
			</c:if>
			<br>
			<h2>미답변 대관신청 리스트</h2>

			<table border="1" class="coure_table">
				<tr>
					<td>번호</td>
					<td>처리여부</td>
					<td>신청자</td>
					<td>장소</td>
					<td>대관날짜</td>
					<td>대관신청일</td>
				</tr>
				<c:if test="${rentsize==0}">
					<tr>
						<td colspan="4">게시글이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="rent" items="${adminrent}">
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