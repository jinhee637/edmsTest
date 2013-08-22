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
<title>카테고리관리</title>
<script type="text/javascript" src="<c:url value='/js/jstree/_lib/jquery.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jstree/_lib/jquery.cookie.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jstree/jquery.jstree.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jstree/_lib/jquery.hotkeys.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jquery.simplemodal-1.4.4.js' />"></script>
<link type="text/css" rel="stylesheet" href="<c:url value='/js/jstree/themes/default/style.css'/>"/>
<style>
#simplemodal-overlay {background-color:#000;}
#pwd_popup{display:none;margin:50 auto;width:220px;height:100px;background:white;color:#fff}
</style>
</head>
<body class="nosidebar">
		<div class="Container">
			<div class="contTit CompanyTit">
				<h2><img src="/images/img/tit-category.gif" alt="카테고리보기" /></h2>
<!-- 				<p></p> -->
			</div>
			<div class="ContentArea">
			
				<!-- location // -->				
				<jsp:include page="/WEB-INF/jsp/com/inc_location.jsp"></jsp:include>
				<!-- // location -->
				
				<!-- content // -->
				<div class="content" id="content">
					<div class="serviceWrap">
						<div class="serviceContentWrap">
							<div class="serviceHeader">
								<div class="serviceHeaderImg">
									<p><img src="/images/img/category_img.jpg" alt="카테고리" /></p>
								</div>
								<div class="serviceHeaderCont2">
									<h3><img src="/images/img/title-category.gif" alt="카테고리관리" /></h3>
									<p>PDF 문서 카테고리</p>
								</div>
							</div>
				<div class="mat30 tableSt04 Maplist">							
				<!--// serviceHeader-->
			<table summary="회원정보 입력"  class="recruitBoardList borderList">
					<colgroup>
					<col width="38%" />
					<col width="62%" />
					</colgroup>
				<tbody>
				<tr>
					<th><div id="tree" style="min-height:150px; text-align:left">				
							<span>listNode</span>
							<!-- <ul>
							<li rel="root" id="0" parentId="" depth="1" name="ROOT">
								<a href='#'>ROOT</a> -->
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
									</c:forEach></div>	
								<!-- /li>
							</ul> -->
						</th>
					<td class="last">
					<!-- 테이블 삽입 -->
					<div id="target" style="padding:0 0 0 30px;"></div>
					</td>
					<!-- 테이블 삽입 -->
				</tr>
				<tr>	
				<td class="last"><div id="mmenu">
						<input type="button" style="background:url(/images/img/bt_add.gif); background-repeat:no-repeat; width:57px; height:25px; border:0;display:block; float:left; cursor:hand; margin:0 7px;" id="create"/>
						<input type="button" style="background:url(/images/img/bt_edit2.gif); background-repeat:no-repeat; width:57px; height:25px; border:0;display:block; float:left;cursor:hand; margin:0 7px;" id="rename"/>
						<input type="button" style="background:url(/images/img/bt_del.gif); background-repeat:no-repeat; width:57px; height:25px; border:0;display:block; float:left;cursor:hand; margin:0 7px;" id="delCate"/>				
						<input type="button" style="background:url(/images/img/bt_save2.gif); background-repeat:no-repeat; width:63px; height:25px; border:0;display:block;cursor:hand;" id="btnSave"/></div>
					</td>
					<td class="last"></td>
				</tr>	
							</tbody>
			</table>


				<div id="pwd_popup" class="pop_s">
					<p class="height:30px">관리자 암호를 입력하십시오.</p><br />
						<div><input type="password" name="pwd" id="pwd" onkeypress="javascript:if (event.keyCode == 13) { delCate(); }"/></div><br />
						<div><input type="button" onclick="javascript:delCate();" style="background:url(/images/img/bt_confirm2.gif) left top; width:37px; height:21px; border:0; cursor:hand;"/>
							 <input type="button" onclick="javascript:modalClose();" style="background:url(/images/img/bt_cancel2.gif) left top; width:37px; height:21px; border:0; cursor:hand;"/></div>
				</div>

				</div>
				</div>
			</div>
			</div>
			</div>
				<!-- right -->	
					 <div class="DimArea notScroll">
					 </div>
				<!-- right -->					 
<script type="text/javascript">
//tree definition
$(document).ready(function() {

	$('#tree').jstree({
   		'plugins' : ["themes","html_data","ui","crrm","dnd","types","sort","cookies"], //,"dnd"  ,"html_data" , 'checkbox', "cookies","hotkeys"
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
			//'select_multiple_modifier' : false,
			'select_limit' : 1
		},

		"crrm" : { 
			"move" : {
				"default_position":"inside"
			}
		},
		"cookies" : { 
			"save_selected" :false
		}
	})
	.bind("select_node.jstree",function(e, data){
		var seq=data.rslt.obj.attr("id").replace("node_","");
		$("#target").load('<c:url value="/admin/selectDesc.do"/>',{"cat_seq":seq});
  		/* data.rslt.obj.each(function () {
  			$.ajax({
  				async : false,
  				type: 'POST',
  				dataType:"json",
  				url:  '<c:url value="/admin/selectDesc.do"/>',
  				data : { 
  					"operation" : "select_node", 
  					"id" : this.id.replace("node_","")
  				},
  				success : function (r) {
  					if(!r.status) {
  						data.inst.refresh();
  					}else{
  						var seq = data.rslt.obj.attr("id").replace("node_","");
  						$("#cat_nm").val(r.cat_nm);
  				  		$("#cat_dc").val(r.cat_dc);
  				  		$("#cat_seq").val(seq);
  				  		$("#group1").val(r.group1).attr("selected","true");
  				  		$("#group2").val(r.group2).attr("selected","true");
  				  		$("#group3").val(r.group3).attr("selected","true");
  					}
//  					$('#tree').jstree('refresh',-1);
  				}
  			});
  		}); */
  		/* $("#cat_nm").val(data.rslt.obj.attr("name"));
  		$("#cat_dc").val(data.rslt.obj.attr("cat_dc"));
  		$("#cat_seq").val(data.rslt.obj.attr("id").replace("node_","")); */
  	})
  	.bind("create.jstree", function (e, data) {
  		var parcat = data.rslt.parent.attr("id").replace("node_","");
  		//data.inst.select_node(data.rslt.obj, true); 생성후 포커스 테스트용

  		/*$.post(
  			"/admin/saveTree.do", 
  			{ 
  				"operation" : "create_node", 
  				"id" : parcat, 
  				"position" : data.rslt.position,
  				"title" : data.rslt.name,
  				//"type" : data.rslt.obj.attr("rel")
  			}, 
  			function (r) {
  				alert(r);
  				alert(r.status);
  				alert(r.id);
  				if(r.status) {
  					alert("tre");
  					var node = data.rslt.obj;
  					//$(data.rslt.obj).attr("id", "node_" + r.id);
  					node.attr("id", r.id);
  					$('#tree').jstree('refresh',-1);
  				}
  				else {
  					$.jstree.rollback(data.rlbk);
  				}
  				//$(data.rslt.oc).attr("id", "node_" + r.id);
  				$('#tree').jstree('refresh',-1);

  			}
  		);*/
  		data.rslt.obj.each(function () {
  			$.ajax({
  				async : false,
  				type: 'POST',
  				url: '<c:url value="/admin/saveTree.do"/>',
  				data : { 
  					"operation" : "create_node", 
  	  				"id" : parcat, 
  	  				"position" : data.rslt.position,
  	  				"title" : data.rslt.name
  	  				//"type" : data.rslt.obj.attr("rel")
  				}, 
  				dataType:"json",
  				success : function (r) {
  					if(r.status) {
  	  					var node = data.rslt.obj;
  	  					//$(data.rslt.obj).attr("id", "node_" + r.id);
  	  					node.attr("id", r.id);
  	  					node.attr("name",data.rslt.name);
  	  					$('#tree').jstree('refresh',-1);
  	  					alert("생성되었습니다.");
  	  					parent._left.location.reload();
  					}else {
  	  					$.jstree.rollback(data.rlbk);
  	  				}
  				}
  			});
  		});
  	})
  	.bind("remove.jstree", function (e, data) {
  		if(data.rslt.obj.attr("id")=='0'){
  			alert("최상위는 삭제할 수 없습니다.");
  			$.jstree.rollback(data.rlbk);
  		}else{
	  		data.rslt.obj.each(function () {
	  			$.ajax({
	  				async : true,
	  				type: 'POST',
	  				url: '<c:url value="/admin/saveTree.do"/>',
	  				data : { 
	  					"operation" : "remove_node", 
	  					"id" : this.id.replace("node_",""),
	  					"pwd" : $("#pwd").val()
	  				}, 
	  				dataType:"json",
	  				success : function (r) {
		  				if(r.result=="exist") {
		  					//$.jstree.rollback(data.rlbk);
		  					alert("해당 카테고리에 하위 문서가 있습니다. 문서 삭제 후 삭제하시기 바랍니다.");
		  					parent.content.location.reload();
		  					return;
		  				}else if(r.result=="fail"){
		  					//$.jstree._reference('tree').refresh();
		  					//$('#tree').jstree('refresh',-1);
		  					//$.jstree.rollback(data.rlbk);
		  					
		  					//$.jstree._focused().select_node("#node_0");
		  					//$('#tree').jstree('set_focus');
		  					alert("관리자 암호가 일치하지않습니다.");
		  					parent.content.location.reload();
		  					return;
		  				}else{
		  					var node = data.rslt.obj;
		  					//$(data.rslt.obj).attr("id", "node_" + r.id);
	  						node.attr("name",data.rslt.new_name);
		  					$('#tree').jstree('refresh',-1);
		  					alert("삭제되었습니다.");
		  					parent._left.location.reload();
		  					return;
		  				}
		  				$.jstree._reference('#tree').lock(false);
	  				}
	  			});
	  		});
  		}
  	})
  	.bind("rename.jstree", function (e, data) {
  		if(data.rslt.obj.attr("id")=='0'){
  			alert("최상위는 삭제할 수 없습니다.");
  			$.jstree.rollback(data.rlbk);
  		}else{
  			data.rslt.obj.each(function () {
	  			$.ajax({
	  				async : false,
	  				type: 'POST',
	  				url: '<c:url value="/admin/saveTree.do"/>',
	  				data : { 
	  					"operation" : "rename_node", 
		  				"id" : data.rslt.obj.attr("id").replace("node_",""),
		  				"title" : data.rslt.new_name
	  				}, 
	  				dataType:"json",
	  				success : 	function (r) {
		  				if(!r.result) {
		  					$.jstree.rollback(data.rlbk);
		  					alert("이름 변경에 실패하였습니다.");
		  				}else{
		  					var node = data.rslt.obj;
		  					//$(data.rslt.obj).attr("id", "node_" + r.id);
	  						node.attr("name",data.rslt.new_name);
		  					$('#tree').jstree('refresh',-1);
		  					alert("수정되었습니다.");
		  					parent._left.location.reload();
		  				}
		  			}
	  			});
	  		});
  		}
  	})
  	.bind("move_node.jstree", function (e, data) {
  		data.rslt.o.each(function (i) {
  			$.ajax({
  				async : false,
  				type: 'POST',
  				url: '<c:url value="/admin/saveTree.do"/>',
  				data : { 
  					"operation" : "move_node", 
  					"id" : $(this).attr("id").replace("node_",""), 
  					"ref" : data.rslt.cr === -1 ? 0 : data.rslt.np.attr("id").replace("node_",""), 
  					"position" : data.rslt.cp + i,
  					"title" : data.rslt.name,
  					"copy" : data.rslt.cy ? 1 : 0
  				},
  				dataType:"json",
  				success : function (r) {
  					if(!r.result) {
  						alert("카테고리 이동에 실패하였습니다.");
  						$.jstree.rollback(data.rlbk);
  					}
  					else {
  						$(data.rslt.oc).attr("id", "node_" + r.id);
  						if(data.rslt.cy && $(data.rslt.oc).children("UL").length) {
  							data.inst.refresh(data.inst._get_parent(data.rslt.oc));
  						}
  						$('#tree').jstree('refresh',-1);
  						alert("이동되었습니다.");
  						parent._left.location.reload();
  					}
  					
  				}
  			});
  		});
  	});

  });
//Code for the menu buttons
$(function () { 
	$("#mmenu input").click(function () {
		switch(this.id) {
			case "add_default":
			case "add_folder":
				$("#tree").jstree("create", null, "last","새 카테고리",{"attr":{"id":"test"}},true);
				break;
			case "text": break;
			default:
				$("#tree").jstree(this.id);
				break;
		}
	});
/* 	$("#btnSave").click(function(){
		alert("asdf");
		$.ajax({
			type: 'POST',
			dataType:"json",
			url: '<c:url value="/admin/saveCatDesc.do"/>',
			data : $("#frm").serialize(),
			success : function (status) {
				alert(status);
				if(!status) {
					alert("저장에 실패했습니다.");
				}else{
					alert("저장에 실패했습니다.");
				}
			}
		});
		return false;
	}); */
/* 	$("#btnSave").click(function(){
		$("#target").load('<c:url value="/admin/saveCatDesc.do"/>',{"cat_seq":$("#cat_seq").val(),"cat_nm":("#cat_nm").val(),"cat_dc":("#cat_dc").val(),"group1":("#group1").val(),"group2":("#group2").val(),"group3":("#group3").val()});
	}); */
	$("#btnSave").click(function(){
		$.ajax({
			async : true,
			type: 'POST',
			dataType:"json",
			url: '<c:url value="/admin/saveCatDesc.do"/>',
			data : $("#frm").serialize(),
			success : function (r) {
				if(!r.result) {
					alert("저장에 실패했습니다.");
				}else{
					alert("저장되었습니다.");
				}
			}
		});
		return false;
	});
	$("#delCate").click(function(){
		$("#pwd_popup").modal();
	});
});
function delCate(){
	$("#tree").jstree("remove");
	modalClose();
	return false;;
}
function modalClose(){
	$.modal.close();
	return false;
}
</script>  
</body>
</html>
