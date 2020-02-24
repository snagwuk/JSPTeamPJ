<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon" href="<%=request.getContextPath()%>/img/favicon.png" type="/image/png">
<title>쌍용문화센터</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/vendors/linericon/style.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/font-awesome.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/vendors/lightbox/simpleLightbox.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/vendors/nice-select/css/nice-select.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/vendors/animate-css/animate.css">
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/vendors/flaticon/flaticon.css"> --%>
<!-- main css -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/responsive.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>


	<!-- The Modal -->
	<div class="modal fade seminor-login-modal" data-backdrop="static"
		id="sem-reg">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">

				<!-- Modal body -->
				<div class="modal-body seminor-login-modal-body">
					<h5 class="modal-title text-center">CREATE AN ACCOUNT</h5>
					<button type="button" class="close" data-dismiss="modal">
						<span><i class="fa fa-times-circle" aria-hidden="true"></i></span>
					</button>


					<form class="seminor-login-form"  action="${pageContext.request.contextPath}/member/join" method="post">
						<div class="form-group">
							<input type="text" name="id"  class="form-control" required
								autocomplete="off"  value="${param.id }"> <label
								class="form-control-placeholder" for="id">User ID</label>
								<c:if test="${errors.id }">ID를 입력하세요</c:if>
	<c:if test="${errors.duplicateId }">이미 사용중인 아이디 입니다.</c:if>
						</div>
						<div class="form-group">
							<input type="password" class="form-control" required
								autocomplete="off" name="passwd"> <label
								class="form-control-placeholder" for="passwd">Password
								</label>
								<c:if test="${errors.passwd }">암호를 입력하세요</c:if>
						</div>

						<div class="form-group">
							<input type="password" class="form-control" required
								autocomplete="off" name="confirmpasswd"> <label
								class="form-control-placeholder" for="name">확인</label>
								<c:if test="${errors.confirmpasswd }">확인을 입력하세요</c:if>
	<c:if test="${errors.notMatch}">암호와 확인이 일치하지 않습니다.</c:if>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" required
								autocomplete="off" name="name" value="${param.name }"> <label
								class="form-control-placeholder" for="name">이름</label>
								<c:if test="${errors.name }">이름을 입력하세요</c:if>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" required
								autocomplete="off" name="birth" value="${param.birth }"> <label
								class="form-control-placeholder" for="birth">생년월일(6자리)</label>
								<c:if test="${errors.birth }">생년월일(6자리)을 입력하세요</c:if>
						</div>
						<div class="form-group">
						<label
								class="form-control-placeholder" for="sex" style="display: contents;">성별</label>
						<span>	<input type=radio class="" required
								autocomplete="off" name="sex" value="1" checked="checked"> 남자
								<input type=radio class="" required
								autocomplete="off" name="sex" value="2" >여자
								<c:if test="${errors.sex }">성별을 입력하세요</c:if></span>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" required
								autocomplete="off" name="phone"> <label
								class="form-control-placeholder" for="phone">휴대폰</label>
									<c:if test="${errors.phone }">휴대폰 번호를 입력하세요</c:if>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" required
								autocomplete="off"  name="address"> <label
								class="form-control-placeholder" for="address">주소
								</label>
									<c:if test="${errors.address }">주소를 입력하세요</c:if>
						</div>



						<div class="btn-check-log">
							<button type="submit" class="btn-check-login">SIGN UP</button>
						</div>
						<div class="create-new-fau text-center pt-3">
							<a href="#" class="text-primary-fau"><span
								data-toggle="modal" data-target="#sem-login"
								data-dismiss="modal">Already Have An Account</span></a>
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>




	<!-- The Modal -->
	<div class="modal fade seminor-login-modal" data-backdrop="static"
		id="sem-login">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">

				<!-- Modal body -->
				<div class="modal-body seminor-login-modal-body">
					<h5 class="modal-title text-center">LOGIN TO MY ACCOUNT</h5>
					<button type="button" class="close" data-dismiss="modal">
						<span><i class="fa fa-times-circle" aria-hidden="true"></i></span>
					</button>

					
					<form class="seminor-login-form"action="${pageContext.request.contextPath}/member/login"
						method="post">
						<c:if test="${errors.idOrPwNotMatch }">아이디와 암호가 일치하지 않습니다.</c:if>
						<div class="form-group">
							<input type="text" name="id" value="${param.id}"
								class="form-control" required autocomplete="off">
							<!--  <input type="email" class="form-control" required autocomplete="off"> -->
							<label class="form-control-placeholder" for="name">회원ID</label>
							<c:if test="${errors.id }">ID를 입력하세요</c:if>
						</div>
						<div class="form-group">
							<input type="password" name="passwd" class="form-control"
								required autocomplete="off"> <label
								class="form-control-placeholder" for="password">Password</label>
							<c:if test="${errors.passwd }">암호를 입력하세요</c:if>
						</div>
						<div class="form-group">
							<label class="container-checkbox"> Remember Me On This
								Computer <input type="checkbox" checked="checked" required>
								<span class="checkmark-box"></span>
							</label>
						</div>

						<div class="btn-check-log">
							<input type="submit" value="로그인" class="btn-check-login">
							<!--  <button type="submit" class="btn-check-login">LOGIN</button> -->
						</div>


						<!--  <div class="forgot-pass-fau text-center pt-3">
                            <a href="/reset_pass" class="text-secondary">Forgot Your Password?</a>

                        </div> -->
						<div class="create-new-fau text-center pt-3">
							<%--   <a href="${pageContext.request.contextPath}/member/join">[회원가입하기]</a> --%>
							<a href="#" class="text-primary-fau"><span
								data-toggle="modal" data-target="#sem-reg" data-dismiss="modal">Create
									A New Account</span></a>
						</div>



					</form>

				</div>
			</div>
		</div>
	</div>




	<!--================Header Menu Area=================-->
	<header class="header_area">
		<div class="top_menu">
			<div class="container">
				<div class="top_inner">
					<div class="float-left">

						<c:if test="${! empty authUser}">
	<span class="log_txt">${authUser.name }님, 안녕하세요.</span>
	<a href="${pageContext.request.contextPath}/member/mypage">[마이페이지]</a>
							<a href="${pageContext.request.contextPath}/member/logout">[로그아웃하기]</a>
						</c:if>
						<c:if test="${empty authUser}">
						<a href="#" data-toggle="modal" data-target="#sem-login">로그인</a>
						 <a	href="#" data-toggle="modal" data-target="#sem-reg">회원가입</a>
						</c:if>
					<c:if test="${authUser.admin == 1}">	
					 <a	href="${pageContext.request.contextPath}/member/adminpage">[관리자페이지]</a>
					 </c:if>
					 
						<!-- 공통해더부분시작  -->
						<%--  <jsp:include page="common/head.jsp" />    --%>
						<!-- 공통해더부분  -->
						<!-- 비로그인도 이동 가능 -->
						<%-- <a href="${pageContext.request.contextPath}/course/list">[강좌
							목록 조회]</a> <a href="${pageContext.request.contextPath}/rent/list">[대관
							가능 시설 조회]</a> <a
							href="${pageContext.request.contextPath}/minwon/list">[민원
							게시판]</a> <br>
						<br> --%>


					</div>
					<div class="float-right">

						<ul class="list header_socila">

							<li><a href="https://www.facebook.com/"><i class="fa fa-facebook"></i></a></li>
							<li><a href="https://twitter.com/"><i class="fa fa-twitter"></i></a></li>

						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="main_menu" id="mainNav">
			<nav class="navbar navbar-expand-lg navbar-light">
				<div class="container">
					<!-- Brand and toggle get grouped for better mobile display -->
					<a class="navbar-brand logo_h" href="${pageContext.request.contextPath}/member/main"><img
						src="../img/logo.png" alt=""><img src="../img/logo-2.png" alt=""></a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse offset"
						id="navbarSupportedContent">
						<ul class="nav navbar-nav menu_nav ml-auto">

							<li class="nav-item"><a class="nav-link"
								href="${pageContext.request.contextPath}/course/list">수강신청</a></li>
							<li class="nav-item">
							<a class="nav-link" href="${pageContext.request.contextPath}/rent/locationlist">대관 안내</a>
								</li>
							<li class="nav-item submenu dropdown"><a
								href="${pageContext.request.contextPath}/minwon/list"
								class="nav-link">고객의 소리</a></li>
							<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/mypage">마이페이지</a></li>
							<li class="nav-item active"><a class="nav-link"
								href="${pageContext.request.contextPath}/member/contact">오시는길</a></li>
						
						</ul>
					</div>
				</div>
			</nav>
		</div>
	</header>