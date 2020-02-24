<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>대관 신청 목록</title>
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
		<div class="container">
			<div class=" btnBox_tit">
				<p>대관신청</p>
				<a href="rent" class="genric-btn info radius">게시글쓰기</a>
			</div>
			<!-- <p>
				<a href="rent">[게시글쓰기]</a>
			</p> -->
			<table border="1" class="coure_table">
				<thead>
					<tr>
						<th>번호</th>
						<th>처리여부</th>
						<th>신청자</th>
						<th>장소</th>
						<th>대관날짜</th>
						<th>대관신청일</th>
					</tr>
				</thead>
				<!-- <tr>
					<td>번호</td>
					<td>처리여부</td>
					<td>신청자</td>
					<td>장소</td>
					<td>대관날짜</td>
					<td>대관신청일</td>
				</tr> -->
				<c:if test="${count==0}">
					<tr>
						<td colspan="4">게시글이 없습니다.</td>
					</tr>
				</c:if>



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

			<nav class="blog-pagination justify-content-center d-flex">
				<ul class="pagination">
					<li class="page-item"><a href="#" class="page-link"
						aria-label="Previous"> <span aria-hidden="true"> <span
								class="lnr lnr-chevron-left"></span>
						</span>
					</a></li>
					<li class="page-item"><c:forEach var="i" begin="${startPage}"
							end="${endPage}">

							<a href="list?pageNum=${i }" class="page-link">0${i }</a>

						</c:forEach></li>

					<li class="page-item"><a href="#" class="page-link"
						aria-label="Next"> <span aria-hidden="true"> <span
								class="lnr lnr-chevron-right"></span>
						</span>
					</a></li>
				</ul>
			</nav>
			<%-- <p align="center">

		<c:if test="${ startPage > bottomLine}">

			<a href="list?pageNum=${startPage-bottomLine }">[이전]</a>
		</c:if>


		<c:forEach var="i" begin="${startPage}" end="${endPage}">

			<a href="list?pageNum=${i }">[${i }]</a>

		</c:forEach>

		<c:if test="${endPage < pageCount}">

			<a href="list?pageNum=${startPage + bottomLine}">[다음]</a>
		</c:if> --%>
		</div>
	</div>
	<!-- Footer Area start  -->
	<jsp:include page="/common/footer.jsp" />
	<!-- Footer Area end  -->
</body>
</html>