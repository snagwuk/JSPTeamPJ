<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>대관 장소 목록</title>
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
		<div class="container mb-30">


			<c:if test="${authUser.admin == 1}">
				<div class=" btnBox_tit">
					<p>대관 장소 삽입</p>
				</div>
				<form method="post"
					action="${pageContext.request.contextPath}/rent/locationwrite">
					<table style="width: 70%;" class="coure_table">
						<%-- 		<input type="hidden" name="id" value="${authUser.id}"> --%>
						<tr>
							<td width="70" align="center">대분류</td>
							<td width="330"><input type="text" size="40" maxlength="50"
								name="mcategory"></td>
						</tr>
						<tr>
							<td width="70" align="center">소분류</td>
							<td width="330"><input type="text" size="40" maxlength="50"
								name="scategory"></td>
						</tr>
						<tr>
							<td width="70" align="center">장소 코드</td>
							<td width="330"><input type="text" size="40" maxlength="50"
								name="locationCode"></td>
						</tr>
						<tr>
							<td width="70" align="center">비용</td>
							<td width="330"><input type="text" size="40" maxlength="50"
								name="cost"></td>
						</tr>
						<tr>
							<td width="70" align="center">수용가능 인원</td>
							<td width="330"><input type="text" size="40" maxlength="50"
								name="capacity"></td>
						</tr>
						<tr>
							<td colspan=2 align="center"><input type="submit" value="등록">

							</td>
						</tr>
					</table>
				</form>
			</c:if>

			<div class=" btnBox_tit">
				<p>대관 장소 목록</p>

				<a href="mylist" class="genric-btn info radius ">나의 대관 목록</a>
				<a href="rent " class="genric-btn info radius  mr-20">대관 신청</a>
			</div>

			<table border="1" class="coure_table">
				<tr>
					<td>대분류</td>
					<td>소분류</td>
					<td>장소 코드</td>
					<td>비용</td>
					<td>수용가능 인원</td>
					<c:if test="${authUser.admin == 1}">
						<td>삭제</td>
					</c:if>
				</tr>

				<c:forEach var="glocation" items="${listlocations}">

					<tr>
						<td>${glocation.mcategory }</td>
						<td>${glocation.scategory }</td>
						<td>${glocation.locationCode }</td>
						<td>${glocation.cost }</td>
						<td>${glocation.capacity }</td>
						<c:if test="${authUser.admin == 1}">
							<td><input type="button" value="삭제"
								OnClick="window.location='${pageContext.request.contextPath}/rent/locationdelete?locationCode=${glocation.locationCode}'">
						</c:if>
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