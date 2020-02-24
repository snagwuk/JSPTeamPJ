<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>시설물 예약</title> 
</head>
<body>

<section class="banner_area">
			<div class="banner_inner d-flex align-items-center">
				<div class="overlay bg-parallax" data-stellar-ratio="0.9"
					data-stellar-vertical-offset="0" data-background=""></div>
				<div class="container">
					<div class="banner_content text-center">
		<h2>대관 신청</h2>
		<div class="page_link">
			<a href="${pageContext.request.contextPath}/member/main">Home</a> <a
				href="${pageContext.request.contextPath}/rent/rent">대관 신청</a>
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
				<!-- <a href="rent" class="genric-btn info radius">게시글쓰기</a> -->
			</div>
		 <form class="row contact_form form_rent" action="${pageContext.request.contextPath}/rent/rent"
		method="post" id="contactForm" novalidate="novalidate">
                        <div class="col-md-12">
                            <div class="form-group">
                            <span>신청자</span>
                                <input type="text" class="form-control" id="name" name="name" value="${param.name}" placeholder="이름을 입력하세요">
                            </div>
                            <div class="form-group">
                            <span>장소</span>
                                <input type="text" name="location"
					value="${param.location}" class="form-control" id="location"  placeholder="장소를 입력하세요">
                            </div>
                            <div class="form-group">
                            <span>날짜</span>
                                <input  type="date" value="YYYY-MM-DD" name="r_date"
					value="${param.r_date}"  class="form-control" id="r_date" name="r_date" >
                            </div>
                             <div class="form-group">
                            <span>인원</span>
                                <input type="text" name="capacity"
					value="${param.capacity}" class="form-control" id="capacity"  placeholder="인원을 입력하세요">
                            </div>
                             <div class="form-group">
                             <span>목적</span>
                                <textarea name="purpose" value="${param.purpose}" class="form-control"  id="purpose" rows="1" placeholder="목적을 입력하세요"></textarea>
                            </div>
                        </div>
                      
                        <div class="col-md-12 btnBox_center">
              
                            <input type="submit"  class="btn submit_btn" value="예약">
                        </div>
                    </form>
	<%-- <form action="${pageContext.request.contextPath}/rent/rent"
		method="post">
		<table>
			<tr>
				<td>신청자</td>
				<td><input type="text" name="name" value="${param.name}"></td>
			</tr>
			<!-- 		<select id="${param.location}">
					<option value="수영장">수영장</option>
					<option value="농구장">농구장</option>
					<option value="대운동장">대운동장</option>
					<option value="야구장">야구장</option>
				</select> -->
			<tr>
				<td>장소</td>
				<td><input type="text" name="location"
					value="${param.location}"></td>
			</tr>
			<tr>
				<td>날짜</td>
				<td><input type="date" value="YYYY-MM-DD" name="r_date"
					value="${param.r_date}"></td>
			</tr>
			<tr>
				<td>인원</td>
				<td><input type="text" name="capacity"
					value="${param.capacity}"></td>
			</tr>
			<tr>
				<td>목적</td>
				<td><input type="text" name="purpose" value="${param.purpose}"></td>
			</tr>
		</table>
		<input type="submit" value="예약">
	</form> --%>
</div>
</div>
<!-- Footer Area start  -->
 	 <jsp:include page="/common/footer.jsp" />
    <!-- Footer Area end  -->
</body>
</html>