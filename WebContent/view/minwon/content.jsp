<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
						<a href="${pageContext.request.contextPath}/member/main">Home</a>
						<a href="${pageContext.request.contextPath}/minwon/list">고객의
							소리</a>
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
				<a href="${pageContext.request.contextPath}/minwon/list"
					class="genric-btn info radius">목록보기</a>
			</div>

			<div>

				<%-- <table border="1">
<tr>
   <td>좋아요</td><td>${likeCount}</td>
</tr>
</table> --%>


				<table border="1" class="coure_table">
				<colgroup>
				<col width="20%">
				</colgroup>
					<tr>
						<td>좋아요</td>
						<td>${likeCount}</td>
					</tr>
					<tr>
						<td>글 번호</td>
						<td>${article.num}</td>
					</tr>
					<tr>
						<td>제목</td>
						<td>${article.subject}</td>
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
						<td>작성일자</td>
						<td>${article.article_date}</td>
					</tr>
					<tr>
						<td>내용</td>
						<td>${article.content}</td>
					</tr>

					<c:if test="${article.id eq admin}">
						<tr>
							<td>처리상황</td>
							<c:if test="${article.ans_check==1}">
								<td>답변완료</td>
							</c:if>
							<c:if test="${article.ans_check==0}">
								<td>미답변</td>
							</c:if>
						</tr>
					</c:if>
					<c:if test="${article.ans_check==1}">
						<tr>
							<td>답변시간</td>

							<td>${article.ans_date}</td>
						</tr>

						<tr>
							<td>답변 내용</td>
							<td>${article.ans_content}</td>

						</tr>
					</c:if>

				</table>
				<br>
				<div class=" btnBox_center">
					<c:if test="${authUser.admin == 0 and authUser.id eq article.id}">
						<input type="button" value="수정" class="genric-btn primary radius"
							OnClick="window.location='${pageContext.request.contextPath}/minwon/modify?num=${article.num}'">
					</c:if>
					<c:if test="${authUser.admin == 1 or authUser.id eq article.id}">
						<input type="button" value="삭제" class="genric-btn primary radius"
							OnClick="window.location='${pageContext.request.contextPath}/minwon/delete?num=${article.num}'">
					</c:if>
					<c:if test="${result == 0}">
						<c:set var="likeText" value="좋아요 " />
					</c:if>
					<c:if test="${result != 0}">
						<c:set var="likeText" value="좋아요 취소 " />
					</c:if>
					<input type="button" value="${likeText}"
						class="genric-btn danger  radius"
						OnClick="window.location='${pageContext.request.contextPath}/minwon/like?num=${article.num}'">
				</div>
				<%-- 			
      <c:if test="${authUser.admin == 0 and authUser.id eq article.id}">       
         <input type="button" value="수정"
            OnClick="window.location='${pageContext.request.contextPath}/minwon/modify?num=${article.num}'">
      </c:if>      
      <c:if test="${authUser.admin == 1 or authUser.id eq article.id}">
      <input type="button" value="삭제"
         OnClick="window.location='${pageContext.request.contextPath}/minwon/delete?num=${article.num}'">
      </c:if>
      
    <input type="button" value="목록보기"
         OnClick="window.location='${pageContext.request.contextPath}/minwon/list'">

      <c:if test="${result == 0}">
         <c:set var="likeText" value="좋아요 "/>
      </c:if>
      <c:if test="${result != 0}">
         <c:set var="likeText" value="좋아요 취소 "/>
      </c:if> 
      <br>
      <br>
      <br>
   
      <br>
      <br>
      <br>
      <input type="button" value="${likeText}"
         OnClick="window.location='${pageContext.request.contextPath}/minwon/like?num=${article.num}'">
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>--%>





				<c:if test="${authUser.admin == 1}">
					<form action="${pageContext.request.contextPath}/minwon/ans"
						method="post">
						<table border="1" class="coure_table">
							<input type="hidden" name="num" value="${article.num}">
							<tr>
								<td>답변 작성하기</td>
								<td>
								<!-- <textarea name="ans_content" rows="13" cols="40"
										value="article.ans_article"></textarea> -->
										
										<textarea name="ans_content" class="form-control" value="article.ans_article" rows="13" cols="40" placeholder="내용을 입력하세요"></textarea>
										</td>
							</tr>
			<%-- <tr>
							<c:if test="${article.ans_check==1}">
								<input type="submit" value="수정">
							</c:if>
							<c:if test="${article.ans_check==0}">
								<input type="submit" value="등록">
							</c:if>
		</tr>  --%>
				
						</table>
						<div class=" btnBox_center">
							<c:if test="${article.ans_check==1}">
								<input type="submit" value="수정"  class="genric-btn primary radius">
							</c:if>
							<c:if test="${article.ans_check==0}">
								<input type="submit" value="등록"  class="genric-btn primary radius">
							</c:if>
						</div>
					
					</form>
					
				
				</c:if>





			</div>

		</div>
	</div>

	<!-- Footer Area start  -->
	<jsp:include page="/common/footer.jsp" />
	<!-- Footer Area end  -->

</body>
</html>