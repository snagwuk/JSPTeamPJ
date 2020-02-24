<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강좌 리스트</title>
</head>
<body>


	<section class="banner_area">
	<div class="banner_inner d-flex align-items-center">
		<div class="overlay bg-parallax" data-stellar-ratio="0.9"
			data-stellar-vertical-offset="0" data-background=""></div>
		<div class="container">
			<div class="banner_content text-center">
				<h2>수강 신청</h2>
				<div class="page_link">
					<a href="index.jsp">Home</a> <a
						href="${pageContext.request.contextPath}/course/list">수강 신청</a>
				</div>
			</div>
		</div>
	</div>
	</section>
	<!--================End Home Banner Area =================-->
	<!-- Start Align Area -->
	<div class="whole-wrap">
		<div class="container">
			<div class=" btnBox_tit">
				<p>수강신청</p>
				<a href="mylist" class="genric-btn info radius">나의 신청목록 검색</a>
			</div>

		<%-- 	<!-- 강좌 추가 -->
			<c:if test="${authUser.admin == 1}">
				<form action="${pageContext.request.contextPath}/course/write"
		method="post">
		<table>
			<tr>
				<td>강좌 코드</td>
				<td><input type="text" name="code" >
				</td>
			</tr>
			<tr>
				<td>대분류</td>
				<td><input type="text" name="bigtype" >
				</td>
			</tr>
			<tr>
				<td>소분류</td>
				<td><input type="text" name="course" >
				</td>
			</tr>
			<tr>
				<td>시간</td>
				<td><input type="text" name="course_time"
					></td>
			<tr>
				<td>시작일</td>
				<td><input type="date" name="course_Period_start"
					></td>
			</tr>
			<tr>
				<td>종료일</td>
				<td><input type="date" name="course_Period_end"
					></td>
			</tr>
			<tr>
				<td>장소</td>
				<td><input type="text" name="course_location"
					></td>
			</tr>
			<tr>
				<td>인원</td>
				<td><input type="text" name="course_person"
					></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="price" >
				</td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="train_code" >
				</td>
			</tr>
			
			
			<tr>
				<td>강사</td>
				<td><select name="train_code">
						<c:forEach var="listtrainer" items="${listtrainer}">
							<option>${listtrainer.code}</option>
						</c:forEach>
				</select></td>
			</tr>
		</table>
		<input type="submit" value="등록">
	</form>
			</c:if>

 --%>


			<%-- <h3 class="mb-30 title_color">Table</h3>
				<a href="${pageContext.request.contextPath}/member/main">[메인으로]</a>

							<a href="mylist">[나의 신청목록 검색]</a><br> --%>
			<div class="progress-table-wrap mb-30">
				<div class="progress-table">
					<div class="table-head">

						<table border="1" class="coure_table">
							<!-- 	<tr>
									<td>코드</td>
									<td>대분류</td>
									<td>강좌명</td>
									<td>강의시간</td>
									<td>수강기간시작</td>
									<td>수강기간끝</td>
									<td>강의장소</td>
									<td>모집인원</td>
									<td>수강료</td>
									<td>수강신청</td>
								</tr> -->
							<thead>
								<tr>
									<th>대분류</th>
									<th>강좌명</th>
									<th>강의시간</th>
									<th>수강기간시작</th>
									<th>수강기간끝</th>
									<th>강의장소</th>
									<th>모집인원</th>
									<th>수강료</th>
									<th>수강신청</th>
								</tr>
							</thead>
							<c:forEach var="gprogram" items="${listprograms}">

								<tr>
									<%-- <td>${gprogram.code }</td> --%>
									<td>${gprogram.bigtype }</td>
									<td>${gprogram.course }</td>
									<td>${gprogram.course_time }</td>
									<td>${gprogram.course_Period_start }</td>
									<td>${gprogram.course_Period_end }</td>
									<td>${gprogram.course_location }</td>
									<td>${gprogram.course_person }</td>
									<td>${gprogram.price }</td>
									<%-- 	<td><a href="${pageContext.request.contextPath}/course/apply?code=${gprogram.code }">[강좌신청]</a></td> --%>



									<td>
									<c:if test="${gprogram.course_Period_start > toDay}">
											<a
												href="${pageContext.request.contextPath}/course/apply?code=${gprogram.code}">[강좌신청]</a>
										</c:if> <c:if test="${gprogram.course_Period_start < toDay}">
											<span>[마감]</span>
										</c:if>
										</td>

								</tr>

							</c:forEach>

						</table>

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