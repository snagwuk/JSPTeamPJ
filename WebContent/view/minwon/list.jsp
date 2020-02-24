<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>민원게시글 리스트</title>
</head>

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

<div class="whole-wrap">
	<div class="container">
		<div class=" btnBox_tit">
			<p>민원게시판</p>
			
			<a href="${pageContext.request.contextPath}/minwon/write"
				class="genric-btn info radius">글쓰기</a>
				<a href="${pageContext.request.contextPath}/minwon/mylist" class="genric-btn info radius mr-20">나의 민원</a>
		</div>
		<div>
			<%-- <span>
			<h3>
				민원게시판 (전체 글:${count}) / ${admin }
			</h3>
		</span>
		<p>
			<a href="${pageContext.request.contextPath}/minwon/write">글쓰기</a>
		</p> --%>


			<c:if test="${count==0}">

				<table border="1" class="coure_table">
					<tr>
						<td align="center">아직 게시판에 작성된 글이 없어요...</td>
				</table>
			</c:if>
			<c:if test="${count!=0}">
				<table border="1" class="coure_table">
					<tr>
						<td>번호</td>
						<td>답변상태</td>
						<td align="center">제목</td>
						<td>좋아요</td>
						<td>작성자</td>
						<td>작성일</td>
						<td>조회수</td>
					</tr>


					<c:forEach var="minwon" items="${minwonList}">
						<tr>
							<td>${minwon.num}</td>
							<td><c:if test="${minwon.ans_check==1}">답변완료</c:if> <c:if
									test="${minwon.ans_check==0}">미답변</c:if></td>
							<td align="center"><a
								href="${pageContext.request.contextPath}/minwon/content?num=${minwon.num}">${minwon.subject}</a>
							</td>




							<td align="center" width="50">${minwon.like}</td>



							<td>${minwon.id}</td>
							<td>${minwon.article_date}</td>
							<td>${minwon.read_cnt}</td>
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

			</c:if>

		</div>
	</div>
</div>
</div>
</div>
<!-- Footer Area start  -->
<jsp:include page="/common/footer.jsp" />
<!-- Footer Area end  -->
</body>
</html>