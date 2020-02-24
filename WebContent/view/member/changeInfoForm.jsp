<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보 변경</title>
</head>
<body>

			<section class="banner_area">
			<div class="banner_inner d-flex align-items-center">
				<div class="overlay bg-parallax" data-stellar-ratio="0.9"
					data-stellar-vertical-offset="0" data-background=""></div>
				<div class="container">
					<div class="banner_content text-center">
						<h2>마이페이지</h2>
						<div class="page_link">
							<a href="index.jsp">Home</a> <a href="${pageContext.request.contextPath}/member/mypage">마이페이지</a>
						</div>
					</div>
				</div>
			</div>
			</section>
			<!--================End Home Banner Area =================-->

	<div class="whole-wrap">
		<div class="container">
		<div class=" btnBox_tit">
<p>마이페이지</p>
					
			</div>
<form  class="row contact_form form_rent"  action="${pageContext.request.contextPath}/member/changeinfo" method="post">
<%-- <p>
	현재 암호:<br/><input type="password" name="curPwd">
	<c:if test="${errors.curPwd}">현재 암호를 입력하세요</c:if>
	<c:if test="${errors.badCurPwd}">현재 암호가 일치하지 않습니다.</c:if>
</p>
<p>
	새 암호:<br/><input type="password" name="newPwd" >
	<c:if test="${errors.newPwd }">새 암호를 입력하세요</c:if>
</p>
<p>
	휴대폰 번호:<br/><input type="text" name="phone" value="${myInfo.phone}">
	<c:if test="${errors.phone }">휴대폰 번호를 입력하세요</c:if>
</p>
<p>
	주소:<br/><input type="text" name="address" value="${myInfo.address}">
	<c:if test="${errors.address }">주소를 입력하세요</c:if>
</p> --%>
<div class="col-md-12">
                            <div class="form-group">
                            <span>현재 암호</span>
                                <input type="password" class="form-control" name="curPwd" placeholder="현재 암호를 입력하세요">
                                <c:if test="${errors.curPwd}">현재 암호를 입력하세요</c:if>
	<c:if test="${errors.badCurPwd}">현재 암호가 일치하지 않습니다.</c:if>
                            </div>
                            <div class="form-group">
                            <span>새 암호</span>
                                <input type="password" name="newPwd"
				 class="form-control"  placeholder="새암호를 입력하세요">
				 <c:if test="${errors.newPwd }">새 암호를 입력하세요</c:if>
                            </div>
                            <div class="form-group">
                            <span>휴대폰 번호</span>
                              <input type="text" class="form-control" name="phone"  value="${myInfo.phone}">
                            	<c:if test="${errors.phone }">휴대폰 번호를 입력하세요</c:if>
                            </div>
                             <div class="form-group">
                            <span>주소</span>
                              <input type="text" class="form-control" name="address"  value="${myInfo.address}">
                            	<c:if test="${errors.address }">주소를 입력하세요</c:if>
                            </div>
                        </div>
                      
<div class="col-md-12 btnBox_center">
                 <input type="submit"  class="btn submit_btn"value="회원 정보 변경">
              </div>
</form>
</div>
</div>
</body>
</html>