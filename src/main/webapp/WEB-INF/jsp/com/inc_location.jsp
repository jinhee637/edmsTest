 <%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
	<c:when test='${loginVO.bizrole_cd=="ADMIN"}'>
		<ul class="location">
			<li class="home">[<c:out value="${loginVO.id_if}"></c:out>입니다.]</li>
			<li class="user"><a href="${pageContext.request.contextPath }/com/actionLogout.do" target="_top">로그아웃</a></li>				  
		</ul>
	</c:when>
	<c:otherwise>
		<ul class="location">
			<li class="home">[<c:out value="${loginVO.id_if}"></c:out>입니다.]</li>
			<li class="uie"><a href="${pageContext.request.contextPath }/user/forUpdateUser.do"  target="content">사용자정보수정</a></li>
			<li class="user"><a href="${pageContext.request.contextPath }/com/actionLogout.do" target="_top">로그아웃</a></li>				  
		</ul>
	</c:otherwise>
</c:choose>