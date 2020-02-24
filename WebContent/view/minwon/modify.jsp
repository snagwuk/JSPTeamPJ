
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>minwonContent</title>
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
						<a href="index.jsp">Home</a> <a href="applyForm.jsp">고객의 소리</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Home Banner Area =================-->

	<div class="whole-wrap">
		<div class="container">

			<div>
				<%-- 
<table border="1">
<tr>
	<td>좋아요</td><td>${likeCount}</td>
</tr>
</table> --%>

<div class=" btnBox_tit">
				<p>	나의 민원수정 </p>
				<a href="${pageContext.request.contextPath}/minwon/list" class="genric-btn info radius">목록보기</a>
			</div>


				<form method="post"
					action="${pageContext.request.contextPath}/minwon/modify">
					<table border="1" class="coure_table">
						<tr>
							<td>좋아요</td>
							<td>${likeCount}</td>

						</tr>
						<tr>
							<td>글 번호</td>
							<td>${article.num}</td>
							<input type="hidden" name="num" value="${article.num}">
						</tr>
						<tr>
							<td>제 목</td>
							<td><input type="text" size="40" maxlength="50"
								name="subject" value="${article.subject}"></td>
						</tr>
						<tr>
							<td>조회수</td>
							<td>${article.read_cnt}</td>
						</tr>
						<tr>
							<td>작성자</td>
							<td>${article.id}</td>
						</tr>
						<tr>
							<td>처리상황</td>
							<td>${article.ans_check}</td>
						</tr>
						<tr>
							<td>작성일자</td>
							<td>${article.article_date}</td>
						</tr>
						<tr>
							<td>내용</td>
							<td><input type="text" size="40" maxlength="50"
								name="content" value="${article.content}"></td>
						</tr>
					</table>
					
					
					<div class=" btnBox_center">

<input type="submit" value="등록" class="genric-btn primary radius">

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