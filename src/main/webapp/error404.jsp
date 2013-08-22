<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<link rel="stylesheet" type="text/css" href="/css/error.css" />
<title>:::::: 40 ::::::</title>

</head>

<body>

<div id="error">
	<div class="errorContent">
		<h1><img src="/images/error_title.gif" alt="죄송합니다.요청하신 페이지를 찾을수 없습니다." /></h1>
		<p class="errorText">관련 문의는<br />
			<span>이메일(kogasin@kogas.or.kr) , 연락처(TEL 031-783-6400)</span>로 하실 수 있습니다.<br />
			친철하게 안내해 드리겠습니다.<br />
			감사합니다. 
		</p>
	</div>
	<p class="homeBtn">
	<a href="${pageContext.request.contextPath}/com/LoginUsr.do"><img src="/images/error_btn.gif" alt="홈으로가기"/></a></p>
</div>

</body>
</html>
