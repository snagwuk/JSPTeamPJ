<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[관리자모드] 회원목록</title>
</head>
<body>
<section class="banner_area">
			<div class="banner_inner d-flex align-items-center">
				<div class="overlay bg-parallax" data-stellar-ratio="0.9"
					data-stellar-vertical-offset="0" data-background=""></div>
				<div class="container">
					<div class="banner_content text-center">
						<h2>회원 목록</h2>
						<div class="page_link">
							<a href="index.jsp">Home</a> <a href="applyForm.jsp">회원 목록</a>
						</div>
					</div>
				</div>
			</div>
			</section>
			<!--================End Home Banner Area =================-->
	
	<div class="whole-wrap">
		<div class="container">
		
		<div class=" btnBox_tit">
				<p>회원 목록</p>
			</div>
	<table border="1" class="coure_table">
		<tr>
			<td>아이디</td>
			<td>이름</td>
			<td>휴대폰번호</td>
			<td>주소</td>
			<td>회원구분</td>
			<td>회원수강내역</td>
		</tr>

		<c:forEach var="member" items="${memberlist}">
			<tr>
				<td>${member.id }</td>
				<td>${member.name }</td>
				<td>${member.phone}</td>
				<td>${member.address}</td>
				<td><c:if test="${member.admin == 0}">
               	 		[일반회원]
                	</c:if> 
                	<c:if test="${member.admin == 1}">
               	 		[관리자회원]
                	</c:if>
                </td>
                <td><a href="${pageContext.request.contextPath}/course/mylist?id=${member.id}">[수강목록]</a></td>
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


