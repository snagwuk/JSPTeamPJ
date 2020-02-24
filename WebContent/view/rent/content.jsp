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
				<h2>프로그램안내</h2>
				<div class="page_link">
					<a href="index.jsp">Home</a> <a href="applyForm.jsp">프로그램안내</a>
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
			</div>
			<table border="1" class="coure_table mb-30">
				<tr>
					<td>글 번호</td>
					<td>${rent.no}</td>
				</tr>
				<tr>
					<td>신청자</td>
					<td>${rent.name}</td>
				</tr>
				<tr>
					<td>장소</td>
					<td>${rent.location}</td>
				</tr>
				<tr>
					<td>목적</td>
					<td>${rent.purpose}</td>
				</tr>
				<tr>
					<td>대관 신청일</td>
					<td>${rent.regDate}</td>
				</tr>
				<tr>
					<td>대관 신청날짜</td>
					<td>${rent.r_date}</td>
				</tr>
				<c:if test="${rent.status == 0}">
					<tr>
						<td>처리 상태</td>
						<td>[미답변]</td>
					</tr>
				</c:if>

				<c:if test="${rent.status == 1}">
					<tr>
						<td>처리 상태 : [승인]</td>
						<td>답변 일시 :${rent.regDate}</td>
					</tr>
				</c:if>
				<c:if test="${rent.status == 2}">
					<tr>
						<td>처리 상태 : [반려]</td>
						<td>답변 일시 :${rent.regDate}</td>
					</tr>
					<tr>
						<td>반려 사유</td>
						<td>${rent.reason}</td>
					</tr>
				</c:if>
			</table>
			<%-- <form action="${pageContext.request.contextPath}/rent/ans"
		method="POST">
		<input type="hidden" name="no" value="${rent.no}" />
		<table>
			<c:if test="${authUser.admin == 1}">


				<tr>
					<td><b>답변 내용</b></td>
					<td><textarea name="reason" rows="13" cols="40"></textarea></td>
					<td><input type="radio" name="status" value="1"> <label
						for="status">승인</label> <br> <input type="radio"
						name="status" value="2"> <label for="status">거절</label></td>
				</tr>
		</table>
		<input type="submit" value="등록" /> <br> <br> <br> <br>
		<br>
		</c:if>
		</table>
	</form> --%>


			<form action="${pageContext.request.contextPath}/rent/ans"
				method="POST">
				<input type="hidden" name="no" value="${rent.no}" />
				<table border="1" class="coure_table">
					<c:if test="${authUser.admin == 1}">
						
							<tr>
								<td>답변 작성하기</td>
								<td><textarea name="reason" rows="13" cols="40"
										class="form-control" placeholder="내용을 입력하세요"></textarea></td>
								<td><input type="radio" name="status" value="1" checked="checked"> <label
									for="status" >승인</label> <br> <input type="radio"
									name="status" value="2"> <label for="status">거절</label>
									<div class=" btnBox_center">


										<input type="submit" value="등록"
											class="genric-btn primary radius">

									</div></td>
							</tr>
							<!-- <tr>
								<td>답변 작성하기</td>
								<td>
								<textarea name="ans_content" rows="13" cols="40"
										value="article.ans_article"></textarea>
										
										<textarea  class="form-control" value="article.ans_article" rows="13" cols="40" placeholder="내용을 입력하세요"></textarea>
										</td>
							</tr>
			 -->

						

					</c:if>
				</table>


			</form>
			<%-- 
	<input type="button" value="글 삭제"
		OnClick="window.location='${pageContext.request.contextPath}/rent/delete?no=${rent.no}'">
	<input type="button" value="글목록"
		OnClick="window.location='${pageContext.request.contextPath}/rent/list'"> --%>

			<div class=" btnBox_center">

				<a
					href="${pageContext.request.contextPath}/rent/delete?no=${rent.no}"
					class="genric-btn info radius">글 삭제</a> <a
					href="${pageContext.request.contextPath}/rent/list"
					class="genric-btn info radius">글목록</a>



			</div>

		</div>
	</div>

	<!-- Footer Area start  -->
	<jsp:include page="/common/footer.jsp" />
	<!-- Footer Area end  -->
</body>
</html>