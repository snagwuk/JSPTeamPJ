<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수강 신청</title>
<c:if test="${ff==1 }">
<script>
window.onload=function(){
	alert("이미 등록된 과목입니다.");
};
</script>
	<meta http-equiv="Refresh" content="0;url=list">
</c:if>
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
<p>강의정보</p>
				
			</div>
<table border="1"  class="coure_table">
<tr>

	<td>코드</td>
	<td>${selectCourse.code}</td>
</tr>
<tr>

	<td>대분류</td>
	<td>${selectCourse.bigtype}</td>
</tr>
<tr>

	<td>강좌명</td>
	<td>${selectCourse.course}</td>
</tr>
<tr>

	<td>강의시간</td>
	<td>${selectCourse.course_time}</td>
</tr>

<tr>

	<td>강의장소</td>
	<td>${selectCourse.course_location}</td>
</tr>
<tr>

	<td>모집인원</td>
	<td>${selectCourse.course_person}명</td>
</tr>
<tr>

	<td>수강료</td>
	<td>${selectCourse.price}원</td>
</tr>

</table>
<div class=" btnBox_center">
<form action="apply" method="post" >
<a href="${pageContext.request.contextPath}/member/main" class="genric-btn info radius">[메인으로]</a>
<a href="${pageContext.request.contextPath}/course/list" class="genric-btn info radius">[강좌 목록]</a>
	<input type="hidden" name="code" value="${selectCourse.code}">
<input type="submit" value="신청" class="genric-btn primary radius">
</form>
</div>


	<div class=" btnBox_tit">
<p>강사정보</p>
				
			</div>
<table border="1" class="coure_table">
<tr>

	<td>코드</td>
	<td>${selectTrainer.train_code}</td>
	

</tr>
<tr>
	
	<td>강사이름</td>
	<td>${selectTrainer.name}</td>
</tr>

<tr>
	
	<td>이메일</td>
	<td>${selectTrainer.email}</td>
</tr>
<tr>
	
	<td>자격증</td>
	<td>${selectTrainer.license}</td>
</tr>
<tr>
	
	<td>연락처</td>
	<td>${selectTrainer.tel}</td>
</tr>

	</table>
</div>
</div>
<!-- Footer Area start  -->
 	 <jsp:include page="/common/footer.jsp" />
    <!-- Footer Area end  -->
</body>
</html>