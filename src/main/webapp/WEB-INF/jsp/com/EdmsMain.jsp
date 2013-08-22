<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>EDMS</title>
</head>

<frameset frameborder="no" framespacing="0" cols="300px, *">
	<frame name="_left" id="_left" src="<c:url value='/EdmsLeft.do' />"title="메뉴페이지" scrolling="no">
	<frame id="fr" name="content" src="<c:url value='/user/metaDocList.do' />" title="메인페이지">
</frameset><noframes></noframes>
</html>
