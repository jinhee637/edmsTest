<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<script>
$(document).ready(
	function() {
		if($("#cat_seq").val()=='0'){
			$("#cat_dc").attr("disabled",true);
			$("#group1").attr("disabled",true);
			$("#group2").attr("disabled",true);
			$("#group3").attr("disabled",true);
		}else{
			$("#cat_dc").attr("disabled",false);
			$("#group1").attr("disabled",false);
			$("#group2").attr("disabled",false);
			$("#group3").attr("disabled",false);
		}
	}
);

</script>
<link rel="stylesheet" type="text/css" href="/css/style.css" media="screen" />
<link rel="stylesheet" type="text/css" href="/css/common.css" media="screen" />
<link rel="stylesheet" type="text/css" href="/css/content.css" media="screen" />
<link rel="stylesheet" type="text/css" href="/css/defaultAuto.css" media="screen" />
<body>
<form id="frm" name="frm" method="post" action="/admin/saveCatDesc.do">
<input type="hidden" id="cat_seq" name="cat_seq" value="${vo.cat_seq }"/>

 <div class="mat30 tableSt05 Maplist" style="margin:20px 0;">		
	<table summary="문서 카테고리 설정"   class="introTable3">
		<colgroup>
			<col width="20%" />
			<col width="80%" />
		</colgroup>
		<tr>
			<th colspan="2" class="last">문서 카테고리 설정</th>
		</tr>
		<tr>
			<td>명칭</td>
			<td class="last2"><div><input type="text" size="34" id="cat_nm" name="cat_nm" disabled="disabled" value="${vo.cat_nm }"/></div></td>
		</tr>
		<tr>
			<td>설명</td>
			<td class="last2"><div><input type="text" size="34" id="cat_dc" name="cat_dc" value="${vo.cat_dc}"/></div></td>
		</tr>
		<tr>
			<td>그룹지정</td>
			<td class="last"><div>
				<select id="group1" name="group_seq_arr" style="width:220px;">
					<option value="0">없음</option>
					<c:forEach items="${groupList}" var="gitem" varStatus="stats">
						<option value="${gitem.group_seq}" <c:if test="${gitem.group_seq == vo.group1}">selected="selected"</c:if>>${gitem.group_nm }</option>
					</c:forEach>
				</select></div></td>
		</tr>
		<tr>
			<td>그룹지정</td>
			<td class="last"><div>
				<select id="group2" name="group_seq_arr" style="width:220px;">
					<option value="0">없음</option>
					<c:forEach items="${groupList}" var="gitem" varStatus="stats">
						<option value="${gitem.group_seq}" <c:if test="${gitem.group_seq == vo.group2}">selected="selected"</c:if>>${gitem.group_nm }</option>
					</c:forEach>
				</select></div></td>
		</tr>
		<tr>
			<td>그룹지정</td>
			<td class="last"><div>
				<select id="group3" name="group_seq_arr" style="width:220px;">
					<option value="0">없음</option>
					<c:forEach items="${groupList}" var="gitem" varStatus="stats">
						<option value="${gitem.group_seq}" <c:if test="${gitem.group_seq == vo.group3}">selected="selected"</c:if>>${gitem.group_nm }</option>
					</c:forEach>
				</select></div></td>
		</tr>
	</table>
 </div> 
</form>
</body>
</html>