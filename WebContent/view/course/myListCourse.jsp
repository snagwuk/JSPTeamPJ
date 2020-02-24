<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 강좌 목록</title>

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
		<div class="container mb-30">
			<div class=" btnBox_tit">
				<p>나의신청목록</p>
				<a href="list" class="genric-btn info radius">전체 수강목록</a>
			</div>
			<table border="1" class="coure_table">

				<tr>
					<!-- <td>코드</td> -->
					<td>대분류</td>
					<td>강좌명</td>
					<td>강의시간</td>
					<td>수강기간시작</td>
					<td>수강기간끝</td>
					<td>강의장소</td>
					<td>모집인원</td>
					<td>수강료</td>
					<td>강의평가</td>

				</tr>

				<c:forEach var="gprogram" items="${myprogramlist}">

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
						
						<td>
							<c:if test="${gprogram.course_Period_start > toDay}">
								<span>[수강중인 강좌]</span>
							</c:if> 
							
						<c:if test="${gprogram.course_Period_start < toDay}">
                  <c:forEach var="apply" items="${myprogramcodes}">
                  <c:if test="${gprogram.code eq apply.code}">
                  
                  
                     <c:if test="${apply.grade == 0 || apply.grade == null}">
                     <form method="post" action="${pageContext.request.contextPath}/course/grade">
                        <input type="hidden" name="code" value="${gprogram.code}">
                        <select id="score" name="grade">
                           <option value="1">1</option>
                           <option value="2">2</option>
                           <option value="3">3</option>
                           <option value="4">4</option>
                           <option value="5">5</option>
                        </select> <input type="submit" value="평가">
                     </form>
                     </c:if>
                     
                     
                     
                     <c:if test="${apply.grade != 0 }">
                        <c:if test="${apply.grade != null }">
                              ${apply.grade}
                        </c:if>
                           
                     </c:if>
                        </c:if>
               </c:forEach>
               
               
                  </c:if>
						</td>

					</tr>

				</c:forEach>

			</table>
			<br> <br>
		</div>
	</div>
	<!-- Footer Area start  -->
	<jsp:include page="/common/footer.jsp" />
	<!-- Footer Area end  -->
</body>
</html>