<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : LoginUsr.jsp
  * @Description : Login 인증 화면
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<title>EDMS 로그인</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/style.css'/>" media="screen" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css'/>" media="screen" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/content.css'/>" media="screen" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/defaultAuto.css'/>" media="screen" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/main.min.css'/>" media="screen" />
<script type="text/javascript" src="<c:url value='/js/jquery-1.4.2.min.js' />"></script>
<script type="text/javaScript" language="javascript">

function actionLogin() {

    if (document.loginForm.id.value =="") {
        alert("아이디를 입력하세요");
    }else if (document.loginForm.pw_if.value =="") {
        alert("비밀번호를 입력하세요");
    }else {
        document.loginForm.action="<c:url value='/com/actionLogin.do'/>";
        //document.loginForm.j_username.value = document.loginForm.userSe.value + document.loginForm.username.value;
        //document.loginForm.action="<c:url value='/j_spring_security_check'/>";
        document.loginForm.submit();
    }
}
function actionJoin(){
	document.loginForm.action="<c:url value='/com/userJoin.do'/>";
	document.loginForm.submit();
}
function fnInit() {
	$("#id_if").focus();
    var message = document.loginForm.message.value;
    if (message != "") {
        alert(message);
    }

}

	/* Site Main plug-in initilize */		
		$(document).ready(function(){
			
			jQuery(function($){
				$("body").mainFm({
				/*	
				Set page background path. 
				Just add the image path on variables src(Desktop size image) and src_small(Mobile size image).
				 */
					pageBackground 	: [	
					
						{ src : 'http://www.f-vision.co.kr/images/background//background1.jpg', src_small : 'http://www.f-vision.co.kr/images/background//background1_s.jpg'},   // Main Page 			- Home
						
					],
					
				/* set whether it's an one page or separate page file, if it's set false, the template works like a separate page version */
					onePage : false,
					
				/* Set the current page url, that show on the nav menu */
					homePage : "index.asp",
				
				/* Set background overlay patter */							
					backgroundOverlay 	: 'http://www.f-vision.co.kr/images/background_overlay.png',
					
				/* set pageHolder height, if you need to set all the page height in liquid and not align to center,
				just set value "100%" to the below 2 varaibles */	
					pageHolderHeight_desktop : 420,
					pageHolderHeight_ipad : 380,
					
				/* Full screen gallery options for autoplay and slideshow delay time*/
					galleryAutoplay : "true",
					gallerySlideshowDelay : 1.5,
				/* Full screen gallery default image resize types. Options are fill/fit/none */
					galleryImageResize : "fill",
					
				/* FlexSlider slideshow speed */
					slideshowSpeed : 5000
					
				});
			});
			
			
/* Home page Slider */			
			$(function(){
				$(".slider1").fmMainSlider({ 
					pageBgResize:true, 			// Boolean: It used to resize the height of the background as per the slider height
					slideNumber : true, 		// Boolean: Create slide number
					playPause : true, 			// Boolean: Create play pause button
					nextPreviousButton : true, 	// Boolean: Create next button
					autoplay : true, 			// Boolean: Enable auto play
					slideshowDelayTime : 2.5, 	// Integer: slideshow delay time
					mouse_drag : true 			// Boolean: Enable mouse drag action
				});
			});
 
 
 
		});
			
	</script>		
</script>
</head>
<body onLoad="fnInit();">

<!-- 메뉴 -->
<div class="Header">
 <div class="Gnb" >
	  <h1><a href="${pageContext.request.contextPath}/com/LoginUsr.do" target="_top"><img src="${pageContext.request.contextPath}/images/img/stas_logo.jpg" alt="stas" border="0"/></a></h1>
		  <a href="#" name="gnbS"></a>
		  <ul class="GnbUl" id="gnbS">
			  <li id="LeftNavi1_rootmenu_02" class="current"><a href="#"><img src="${pageContext.request.contextPath}/images/img/menu4_off.gif" alt="문서검색" border="0"/></a>
			  		<ul id="LeftNavi1_submenu_01">
						  <li id="LeftNavi1_submenu_01_01" class="on"><a href="#" id="LeftNavi1_hlnkSubmenu_01_01"><img src = "${pageContext.request.contextPath}/images/img/gnb-2depth01-01-on.gif" alt="문서등록"  border="0"/></a>
						  </li>
						  <li id="LeftNavi1_submenu_01_02"><a href="#" id="LeftNavi1_hlnkSubmenu_01_02"><img src = "${pageContext.request.contextPath}/images/img/gnb-2depth01-02-off.gif" alt="문서검색"  border="0"/></a></li>
						  <li id="LeftNavi1_submenu_01_03"><a href="#" id="LeftNavi1_hlnkSubmenu_01_03"><img src = "${pageContext.request.contextPath}/images/img/gnb-2depth01-03-off.gif" alt="내문서"  border="0"/></a></li>    
				    </ul>
			  </li>
			  <li id="LeftNavi1_rootmenu_03"><a href="#"><img src="${pageContext.request.contextPath}/images/img/menu5_off.gif" alt="문서등록" border="0"/></a></li>
			  <li id="LeftNavi1_rootmenu_04"><a href="#"><img src="${pageContext.request.contextPath}/images/img/menu6_off.gif" alt="내문서" border="0"/></a></li>		  
		  </ul>
		  	  <div class="footer" id="footer">
		  <p><img src="${pageContext.request.contextPath}/images/img/txt-copyright.gif" alt="COPYRIGHT ⓒ 2013 KOGAS. ALL RIGHTS RESERVED."/></p>		
	  </div>
  </div>
	<!-- 오른쪽 -->
	<div class="DimArea2 notScroll" style="display: table; #position: relative; overflow: hidden;">


						<div class="login2">
							 <div class="login3">
								<p class="login_p1"><img src="${pageContext.request.contextPath}/images/img/tt_logo.gif"></p>
								<p class="login_p2"><img src="${pageContext.request.contextPath}/images/img/tt_text.gif"></p>
								<div id="login_box_g">
								<!-- 로그인  in -->
										<div id="login-box">
										   <form name="loginForm" action ="<c:url value='/com/actionLogin.do'/>" method="post">
											 <input type="hidden" name="message" value="${message}">
												<fieldset>
													<legend></legend> 
													<div class="login">
														<dl class="cl">
															<dt><label for="USER_ID">사번</label></dt>
															<dd><input type="text" size="30" name="id_if" id="id_if" maxlength="8"  class="input_f"/></dd>
															<dt><label for="PASS_WORD">비밀번호</label></dt>
															<dd><input type="password" size="30" id="pw_if" name="pw_if" class="input_f" maxlength="20" onkeypress="javascript:if (event.keyCode == 13) { actionLogin(); return false;}" /></dd>
														</dl>
														<a href="#LINK" onClick="actionLogin();return false;"><input type="image" src="${pageContext.request.contextPath}/images/img/btn_login.gif" alt="로그인" class="submit"></a>
													</div>
													<div class="login-opt cl">
														<div class="fl"><a href="#LINK" onClick="actionJoin()"><img src="${pageContext.request.contextPath}/images/img/btn_member_go.gif" alt="가입" /></a></div>
				<!-- 										<div class="fr">
															<a href="#ID/PW찾기" onclick="goFindId(); return false;"><img src="/homepage/images/kor3/btn/btn_idpw_go.gif" alt="아이디찾기/비밀번호 재발급" /></a>
														</div> -->
													</div>
												</fieldset>
											</form>
										</div>
										</div>
									<p class="login_p3"><img src="${pageContext.request.contextPath}/images/img/tt_text2.gif" alt="※ 인천가스기지에서 보유한 문서를 관리하기 위한 문서관리 시스템으로 외부인의 접속 정보 공개를 자재하시기 바랍니다." /></p>
							 </div>
						</div>
	</div></div>
</body>
</html>


