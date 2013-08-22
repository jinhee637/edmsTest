<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>left</title>
<script type="text/javascript" src="<c:url value='/js/jstree/_lib/jquery.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jstree/_lib/jquery.cookie.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jstree/jquery.jstree.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jstree/_lib/jquery.hotkeys.js' />"></script>
<link type="text/css" rel="stylesheet" href="<c:url value='/js/jstree/themes/default/style.css'/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/style.css'/>" media="screen" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css'/>" media="screen" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/content.css'/>" media="screen" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/defaultAuto.css'/>" media="screen" />
</head>
<body class="nosidebar">
<div class="Wrap">
<!-- 메뉴 -->
<div class="Header">
  <div class="Gnb" >
	  <h1><a href="${pageContext.request.contextPath}/com/LoginUsr.do" target="_top"><img src="${pageContext.request.contextPath}/images/img/stas_logo.jpg" alt="stas" border="0"/></a></h1>
		  <a href="#" name="gnbS"></a>
		  <ul class="GnbUl" id="gnbS">
			  <li id="LeftNavi1_rootmenu_02" class="current"><a href="${pageContext.request.contextPath}/admin/ManageCategory.do" target="content"><img src="${pageContext.request.contextPath}/images/img/menu1_off.gif" alt="카테고리관리" border="0"/></a>
			  		<ul id="LeftNavi1_submenu_01">
						  <li id="LeftNavi1_submenu_01_01" class="on"><a href="#" onclick="goDocInt(); return false;" target="content" id="LeftNavi1_hlnkSubmenu_01_01"><img src = "${pageContext.request.contextPath}/images/img/gnb-2depth01-01-on.gif" alt="문서등록"  border="0"/></a>
						  </li>
						  <li id="LeftNavi1_submenu_01_02"><a href="${pageContext.request.contextPath}/user/metaDocList.do" target="content" id="LeftNavi1_hlnkSubmenu_01_02"><img src = "${pageContext.request.contextPath}/images/img/gnb-2depth01-02-off.gif" alt="문서검색"  border="0"/></a></li>
						  <li id="LeftNavi1_submenu_01_03"><a href="${pageContext.request.contextPath}/user/myDocList.do" target="content" id="LeftNavi1_hlnkSubmenu_01_03"><img src = "${pageContext.request.contextPath}/images/img/gnb-2depth01-03-off.gif" alt="내문서"  border="0"/></a></li>    
				    </ul>
			  </li>
			  <li id="LeftNavi1_rootmenu_03"><a href="${pageContext.request.contextPath}/admin/docList.do" target="content"><img src="${pageContext.request.contextPath}/images/img/menu2_off.gif" alt="문서관리" border="0"/></a></li>
			  <li id="LeftNavi1_rootmenu_04"><a href="${pageContext.request.contextPath}/admin/userList.do" target="content"><img src="${pageContext.request.contextPath}/images/img/menu3_off.gif" alt="사용자관리" border="0"/></a></li>		  
		  </ul>
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
  	  <div class="footer" id="footer">
		  <p><img src="${pageContext.request.contextPath}/images/img/txt-copyright.gif" alt="COPYRIGHT ⓒ 2013 KOGAS. ALL RIGHTS RESERVED."/></p>		
	  </div>
  </div>
</div>
</div>
<form id="dummyfrm" name="dummyfrm" action="/user/categoryDocList.do" method="post" target="content">
	<input type="hidden" id="catSeq" name="catSeq" value="<c:out value='${cvo.cat_seq }' />" />
</form>
<script type="text/javascript">
//tree definition
$(document).ready(function() {
	
	$('#lefttree').jstree({
   		'plugins' : ["themes","html_data","ui","types","cookies","sort"], //,"dnd"  ,"html_data" , 'checkbox', "cookies",
   		'themes' : {
   			'theme' : 'default',
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
		},
	})
	.bind("select_node.jstree",function(e, data){
  		data.rslt.obj.each(function () {
  			if(data.rslt.obj.attr("id")=='0'){
  	  			return;
  	  		}else{
  				$("#catSeq").val(this.id.replace("node_",""));
  				$('#dummyfrm').attr('action','/user/categoryDocList.do');
  				$("#dummyfrm").submit();
  	  		}
  		});
  	})
  	
	
  });
  function testLogout(){
		$.ajax({
				async : false,
				type: 'POST',
				url: '<c:url value="/com/testLogout.do"/>',
				data : { 
				}, 
				success : function (r) {
				}
			});
  }
  function goDocInt(){
	  $('#dummyfrm').attr('action','/user/docInsert.do');
	  $("#dummyfrm").submit();
 	  
  }
</script>  
</body>
</html>
