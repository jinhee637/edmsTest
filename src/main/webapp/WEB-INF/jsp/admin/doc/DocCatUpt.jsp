<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="/css/style.css" media="screen" />
<link rel="stylesheet" type="text/css" href="/css/common.css" media="screen" />
<link rel="stylesheet" type="text/css" href="/css/content.css" media="screen" />
<link rel="stylesheet" type="text/css" href="/css/defaultAuto.css" media="screen" />
<title>left</title>
<script type="text/javascript" src="<c:url value='/js/jstree/_lib/jquery.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jstree/_lib/jquery.cookie.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jstree/jquery.jstree.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jstree/_lib/jquery.hotkeys.js' />"></script>

<script type="text/javascript">
$(function(){
	document.body.style.overflow='hidden';
});
</script>

</head>
<body class="nosidebar">

<!-- 메뉴 -->
<div class="Header">
  <div class="Gnb" >
		  <!-- 폴더영역 -->
		  <div class="fd" id="lefttree">
		  	<ul>
				<li rel="root" id="0" parentId="" depth="1" name="ROOT">
					<a href='#'>인천기지STAS</a>
					<c:set var="prevDepth" value="-1"/>
					<c:forEach var="node" items="${treeList}">
						<c:if test="${node.depth > prevDepth}">
						<ul>
						</c:if>
						<c:if test="${prevDepth > node.depth}">
							<c:forEach begin="${node.depth}" end="${prevDepth - 1}" step="1">
							</ul></li>
							</c:forEach>
						</c:if>
						<li id="${node.cat_seq}" parentId="${node.parcat_seq}" name="${node.cat_nm}" depth="${node.depth}" rel="${node.cat_seq}" cat_dc="${node.cat_dc }">
							<a href='#'>${node.cat_nm}</a>
						<c:if test="${node.cnt == 0}">
						</li>
						</c:if>
						<c:set var="prevDepth" value="${node.depth}"/>
					</c:forEach>
				</li>
		    </ul>
		</div>
	  <!-- 폴더영역 -->
	  <button id="btn_popClose" name="btn_popClose" value="닫기" onclick="popClose(); return false;"/>
  </div>
</div>

<input type="hidden" id="catSeq" name="catSeq" value="<c:out value='${cvo.cat_seq }' />"/>
<input type="hidden" id="catNm" name="catNm" value="<c:out value='${cvo.cat_nm }' />" />
<script type="text/javascript">
//tree definition
$(document).ready(function() {

	$('#lefttree').jstree({
   		'plugins' : ["themes","html_data","ui","types","sort"], //,"dnd"  ,"html_data" , 'checkbox', "cookies",
   		'themes' : {
   			'theme' : 'classic',
   			'dots' : true,
   			'icons' : true
		},
		'core' : {
			'initially_open' : ['0'],
			'animation' : 0
		},
		'ui' : {
			'initially_select' : ['0'],
//			'select_multiple_modifier' : false
			'select_limit' : 1
		},

		"crrm" : { 
			"move" : {
				"default_position":"inside"
			}
		}
	})
	.bind("select_node.jstree",function(e, data){
  		data.rslt.obj.each(function () {
  			if(data.rslt.obj.attr("id")=='0'){
  	  			return;
  	  		}else{
  	  			console.log(this.id);
  	  			console.log(data.rslt.obj.attr("name"));
  				$("#catSeq").val(this.id);
  				$("#catNm").val(data.rslt.obj.attr("name"));
  				$("#catSeq", opener.document).val($("#catSeq").val());
  				$("#catNm", opener.document).val($("#catNm").val());
  				window.open("about:blank","_self").close();
  	  		}
  		});
  	})
	
  });
  
  function popClose(){
	  window.open("about:blank","_self").close();
  }
</script>  
</body>
</html>
