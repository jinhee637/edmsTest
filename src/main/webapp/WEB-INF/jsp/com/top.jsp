<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>EDMS</title>
</head>
<body>
<div id="wrap">
<div id="header">
	<table width="950" border="1" cellspacing="0" cellpadding="0">
		<tr>
			<td width="169" rowspan="2" valign="bottom">
				<table width="169"  border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td class="logo" rowspan="2"><!-- 로고 -->KOGAS EDMS</td>
					</tr>
				</table>
			</td>
			<td rowspan="2" class="borderR"></td>
			<td width="780" align="right">
			<!-- 어드민 TOP메뉴영역 Start -->
				<table border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td><span class="b">${loginVO.id_if}님</span> 환영합니다.</td>
						<td></td>
						<td><a href="${pageContext.request.contextPath}/admin/ManageCategory.do" target="content">카테고리 관리 |</a> </td>
						<td><a href="${pageContext.request.contextPath}/admin/docList.do" target="content">문서관리 | </a></td>
						<td><a href="${pageContext.request.contextPath}/admin/userList.do" target="content">사용자 관리 |</a> </td>
						<td>로그아웃</td>
					</tr>
				</table>
				<!-- 어드민 TOP메뉴영역 End -->
			</td>
		</tr>
		<tr>
			<td align="right" valign="top">
				<!-- 사용자 TOP 메뉴 Start -->
				<table border="0" cellspacing="0" cellpadding="0">
 					<tr>
   						<td>
   							<a href="${pageContext.request.contextPath}/com/tree.do" target="content">문서등록</a>
   						</td>
   						<td class="gnbline">&nbsp;</td>
   						<td>
   							<a href="${pageContext.request.contextPath}/user/metaDocList.do" target="content">문서검색</a>
   						</td>
   						<td class="gnbline">&nbsp;</td>
   						<td>
   							<a href="#" class="gnb" id="top_menu3">내문서</a>
   						</td>
   						<td class="gnbline">&nbsp;</td>
 					</tr>
				</table>
				<!-- 사용자 TOP 메뉴 END -->
			</td>
		</tr>
		<tr>
			<td colspan="3" height="90px;">
				<!-- 이미지 -->
				<center>메인이미지 영역</center>
			</td>
		</tr>
	</table>
</div>
</div>
</body>
</html>
