<!DOCTYPE HTML>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<html lang="ko">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link rel="stylesheet" type="text/css" href="<c:url value='/css/style.css' />" media="screen" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css' />" media="screen" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/content.css' />" media="screen" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/defaultAuto.css' />" media="screen" />
<link href="<c:url value='/css/jqueryui/base/jquery-ui.css' />" rel="stylesheet" />

<%-- <script type="text/javascript" src="<c:url value='/js/jquery-latest.js' />"></script> --%>

<script type="text/javascript" src="<c:url value='/js/jquery-latest.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-cookie-plugin.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jquery.blockUI.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/loading.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jquery.alerts.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jquery.form.js' />"></script>

<script type="text/javascript" src="<c:url value='/js/user/doc.js' />"></script>

<link rel="stylesheet" href="<c:url value='/css/jqueryfileupload/bootstrap.min.css' />" rel="stylesheet" />

<link href="<c:url value='/css/jqueryfileupload/jquery.fileupload-ui.css' />" rel="stylesheet" />

<title>사용자 문서 등록</title>

<script type="text/javascript" src="<c:url value='/js/jqueryfileupload/vendor/jquery.ui.widget.js' />" ></script>
<script type="text/javascript" src="<c:url value='/js/jqueryfileupload/load-image.min.js' />" ></script>
<script type="text/javascript" src="<c:url value='/js/jqueryfileupload/canvas-to-blob.min.js' />" ></script>
<script type="text/javascript" src="<c:url value='/js/jqueryfileupload/jquery.iframe-transport.js' />" ></script>
<script type="text/javascript" src="<c:url value='/js/jqueryfileupload/jquery.fileupload.js' />" ></script>
<script type="text/javascript" src="<c:url value='/js/jqueryfileupload/jquery.fileupload-process.js' />" ></script>
<script type="text/javascript" src="<c:url value='/js/jqueryfileupload/jquery.fileupload-image.js' />" ></script>
<script type="text/javascript" src="<c:url value='/js/jqueryfileupload/jquery.fileupload-audio.js' />" ></script>
<script type="text/javascript" src="<c:url value='/js/jqueryfileupload/jquery.fileupload-video.js' />" ></script>
<script type="text/javascript" src="<c:url value='/js/jqueryfileupload/jquery.fileupload-validate.js' />" ></script>

<script type="text/javascript" src="<c:url value='/js/jquery-ui-1.8.16.custom.min.js' />"></script>


<script type="text/javascript">
	$(function(){
		if($('#bizrole_cd').val()=="ADMIN"){
			alert("관리자는 문서를 등록 할 수 없습니다.");
			history.back(-1);
		}else if($('#docregaut_yn').val()=="N"){
			alert('문서 등록 권한이 없습니다. 관리자에게 문의해주세요.');
			history.back(-1);
		}else if($('#catSeq').val()==null){
			alert('최상위 카테고리로 문서를 등록하실 수 없습니다.');
			history.back(-1);			
		}else if($('#catSeq').val()=="0"){
			alert('최상위 카테고리로 문서를 등록하실 수 없습니다.');
			history.back(-1);
		}else if($('#catSeq').val()==""){
			alert('문서를 등록할 카테고리를 선택하셔야 합니다.');
			history.back(-1);
		}
		
		
		$('#metafregDt').datepicker({
			dateFormat:'yy-mm-dd',
			 showMonthAfterYear: true,
			 changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
			 changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
			 showOn: 'both', // both/button
			 yearRange: 'c-99:c+99'
		});
		
		var url = "/user/docUploadOk.do";
		var maxFilesAllowed = 1;
		var maxFiles = 0;
		
		$('#fileupload').fileupload({
			singleFileUploads: false,
			url: url,
			dataType: "json",
			acceptFileTypes: /(\.|\/)(pdf)$/i,
			maxNumberOfFiles: maxFilesAllowed,
			autoUpload: true,
			maxFileSize: 5000000000,
			disableImageResize: /Android(?!.*Chrome)|Opera/.test(window.navigator.userAgent)
		}).on('fileuploadadd', function(e, data){
			maxFiles = maxFiles + 1;
			if(maxFiles < 2){
				console.log('add');
				data.context = $('<div/>').appendTo('#files');
		        $.each(data.files, function (index, file) {
		        	
		        	var node = $('<p/>')
		        	if(file.name.substring(file.name.length-3, file.name.length).toLowerCase() != "pdf"){
		        		alert('업로드 하신 파일명은 ' + file.name + '입니다. pdf파일만 업로드 가능 합니다.');
		        		
		        		if(maxFiles > 0){
		        			maxFiles = maxFiles - 1;
		        		}
		        	}else{
						node.append($('<span/>').text(file.name));
	                    
			            if (!index) {
			                node
			                    .append('<br>')
			            }
			            node.appendTo(data.context);
			            console.log("파일명 추출해보기 = " + file.name);
			            console.log("파일명 길이 추출 = " + file.name.length);
			            console.log("확장자 체크 = " + file.name.substring(file.name.length-3, file.name.length));
		        	}
		        });
			console.log("maxFiles == ==" + maxFiles);
			}else{
				alert("파일은 하나만 업로드 할 수 있습니다.");
				$('#fileupload').fileupload('disable');
				return false;
			}
		 }).on('fileuploadprocessalways', function (e, data) {
			 console.log('always');
		        var index = data.index,
		            file = data.files[index],
		            node = $(data.context.children()[index]);
		        if (file.preview) {
		            node
		                .prepend('<br>')
		                .prepend(file.preview);
		        }
		        if (file.error) {
		            node
		                .append('<br>')
		                .append(file.error);
		        }
		        if (index + 1 === data.files.length) {
		            data.context.find('button')
		                .text('Upload')
		                .prop('disabled', !!data.files.error);
		        }
		    }).on('fileuploadprogressall', function (e, data) {
		    	console.log('all');
		        var progress = parseInt(data.loaded / data.total * 100, 10);
		        $('#progress .bar').css(
		            'width',
		            progress + '%'
		        ); 
		    }).on('fileuploaddone', function (e, data) {
		    	console.log('done');
		    	console.log(data.result.files.message);
		    	if(data.result.files.message == ""){
		    		$('#titIf').attr('disabled', false);
		    		$('#writmanNm').attr('disabled', false);
		    		$('#sbjNt').attr('disabled', false);
		    		$('#keywordIf').attr('disabled', false);
		    		$('#metafregDt').attr('disabled', false);
		    	// JSON 값 받아서 셋팅
			    	$('#articleId').val(data.result.files.articleId);
		            $('#extNm').val(data.result.files.extNm);
		            $('#savepathIf').val(data.result.files.savepathIf);
		            $('#temppathIf').val(data.result.files.temppathIf);
		            $('#fileSizeNum').val(data.result.files.fileSizeNum);
		            $('#orgfileNm').val(data.result.files.orgfileNm);
		            $('#savefileNm').val(data.result.files.savefileNm);
		            $('#titIf').val(data.result.files.titIf);
		            $('#writmanNm').val(data.result.files.writmanNm);
		            $('#sbjNt').val(data.result.files.sbjNt);
		            $('#keywordIf').val(data.result.files.keywordIf);
		            $('#metafregDt').val(data.result.files.metafregDt);
		            $('#btn_IntOk').attr('disabled', false);
		    	}else{
		    		maxFiles = maxFiles -1;
		    		alert(data.result.files.message);
			        $('#progress .bar').css(
			            'width',
			            0 + '%'
			        ); 
			        $('#files').html("");
		    		return false;
		    	}
		       /*  $.each(data.result.files, function (index, file) {
		        	
		           var link = $('<a>')
		                .attr('target', '_blank')
		               	.prop('href', file.url); 
		            $(data.context.children()[index])
		                .wrap(link);
		       }); */
		     }).on('fileuploadfail', function (e, data) {
		    	 console.log('fail');
		        $.each(data.result.files, function (index, file) {
		            var error = $('<span/>').text(file.error);
		            $(data.context.children()[index])
		                .append('<br>')
		                .append(error);
		        });
		    }).prop('disabled', !$.support.fileInput)
		        .parent().addClass($.support.fileInput ? undefined : 'disabled'); 
		
	});
</script>  
</head>

<body>
	<div class="Wrap">

<!-- container // -->
		<div class="Container">
			<div class="contTit CompanyTit">
				<h2><img src="${pageContext.request.contextPath}/images/img/tit-pdfdoc.gif" alt="PDF문서" /></h2>
<!-- 				<p></p> -->
			</div>
			<div class="ContentArea">
			
				<!-- location // -->				
				<%@ include file="/WEB-INF/jsp/com/inc_location.jsp" %>
				<!-- // location -->
				
				<!-- content // -->
				<div class="content" id="content">
					<div class="serviceWrap">
						<div class="serviceContentWrap">
							<div class="serviceHeader">
								<div class="serviceHeaderImg">
									<p><img src="${pageContext.request.contextPath}/images/img/upload_img.jpg" alt="PDF문서 업로드" /></p>
								</div>
								<div class="serviceHeaderCont">
									<h3><img src="${pageContext.request.contextPath}/images/img/title-metaupload.gif" alt="PDF문서" /></h3>
									<p>PDF 업로드가 가능합니다. </p>
								</div>
							</div><!--// serviceHeader-->
					<!-- 표 시작 -->
					<div class="serviceBox">
						<form id="intForm" name="intForm" method="post" action="/user/docInsertOk.do">
					  		<input type="hidden" id="regptSeq" name="regptSeq" value="<c:out value='${lvo.party_seq }' />" />
					  		<input type="hidden" id="partySeq" name="partySeq" value="<c:out value='${lvo.party_seq }' />" />
					  		<input type="hidden" id="deptSeq" name="deptSeq" value="<c:out value='${lvo.group_seq }' />" />
					  		<input type="hidden" id="catSeq" name="catSeq" value="<c:out value='${dvo.catSeq }' />" />
					  		<input type="hidden" id="articleId" name="articleId"/>
					  		<input type="hidden" id="extNm" name="extNm"/>
					  		<input type="hidden" id="savepathIf" name="savepathIf"/>
					  		<input type="hidden" id="fileSizeNum" name="fileSizeNum"/>
					  		<input type="hidden" id="orgfileNm" name="orgfileNm"/>
					  		<input type="hidden" id="savefileNm" name="savefileNm"/>
					  		<input type="hidden" id="temppathIf" name="temppathIf" />
					  		<input type="hidden" id="docregaut_yn" name="docregaut_yn" value="<c:out value='${lvo.docregaut_yn }' />" />
					  		<input type="hidden" id="bizrole_cd" name="bizrole_cd" value="<c:out value='${lvo.bizrole_cd }' />" />
					  		
<!-- 						<h4><img src="/introTit01.gif" alt="" /></h4> -->
							<table summary="회원정보 입력" class="introTable2">
								<colgroup>
									<col width="20%" /><col width="70%" /><col width="10%" />
								</colgroup>
								<tbody>
									<tr>
										<th>PDF 파일 선택</th>
										<td>
										    <!-- The global progress bar -->
										    <div id="progress" class="progress progress-success progress-striped">
										        <div class="bar"></div>
										    </div>
										    <!-- The container for the uploaded files -->
										    <div id="files" class="files"></div>
										</td>
										<td>
											<span class="btn btn-success fileinput-button"  style="background:url(/images/img/bt_regist3.gif) left top; width:73px; height:25px; background-repeat:no-repeat">
										        <!-- <i class="icon-plus icon-white"></i> -->
										        <!-- The file input field used as target for the file upload widget -->
										        <input id="fileupload" type="file" name="files[]" style="background:url(/images/img/bt_regist3.gif) left top; width:73px; height:25px; background-repeat:no-repeat">
										    </span>
											<!--  <span class="btn btn-success fileinput-button" style="background:url(/images/img/bt_regist3.gif) left top; width:73px; height:25px; background-repeat:no-repeat"><img src="/images/img/bt_regist3.gif" border="0">
									        <i class="icon-plus icon-white"></i> 
									        <span>파일 추가...</span>
									        
									        The file input field used as target for the file upload widget
									        <input id="fileupload" type="file" name="files[]">
								    		</span>					     -->
										</td>
									</tr>
								</tbody>
							</table>
							 
<!-- 						<p style=" padding-top:20px; text-align:right;"><img src="${pageContext.request.contextPath}/images/img/bt_regist.gif" align="absmiddle" alt="자료등록"></p> -->

						<div class="serviceBox">							
							<table summary="회원정보 입력" class="introTable3">
								<colgroup>
									<col width="12%" /><col width="38%" /><col width="12%" /><col width="38%" />
								</colgroup>
								<tbody>
									<tr>
										<th colspan="4">PDF 문서 metadata</th>		
									</tr>								
									<tr>
										<th>문서제목</th>
										<td colspan="3" class="alignL"><div><input type="text" id="titIf" name="titIf" size="30" maxlength="40" disabled="disabled"  style="font-size:14px; height:13px; margin:0; font-family:맑은 고딕;"/></div></td>
										
								    </tr>
									<tr>
										<th><div>작성자</div></td>
										<td>&nbsp;&nbsp;&nbsp;<input type="text" id="writmanNm" name="writmanNm" size="30" maxlength="40" disabled="disabled"  style="font-size:14px; height:13px;margin:0 font-family:맑은 고딕;"/></td>											
										<th><div>주제</div></td>
										<td>&nbsp;&nbsp;&nbsp;<input type="text" id="sbjNt" name="sbjNt" size="30" maxlength="40" disabled="disabled"  style="font-size:14px; height:13px;margin:0 font-family:맑은 고딕;"/></td>			
																									
									</tr>
									<tr>
										<th><div>키워드</div></td>
										<td>&nbsp;&nbsp;&nbsp;<input type="text" id="keywordIf" name="keywordIf" size="30" maxlength="40" disabled="disabled" style="font-size:14px; height:13px;margin:0 font-family:맑은 고딕;"/></td>											
										<th><div>작성날짜</div></td>
										<td>&nbsp;&nbsp;&nbsp;<input type="text" id="metafregDt" name="metafregDt" size="30" OnKeyDown="this.blur(); return false;" disabled="disabled"  style="font-size:14px; height:13px;margin:0; font-family:맑은 고딕;"/></td>																		
									</tr>
									<tr class="bottom">
									  <td colspan="6"><div style="text-align:left;">* PDF 문서의 용량이 큰 경우 문서 업로드에 대한 시간이 다소 걸릴 수 있습니다. <br> * PDF 문서 업로드가 완료되면 자동으로 metadata가 화면에 나타납니다. 이후 metadata를 수정하여 주시기 바랍니다.</div></td>
							      </tr>																		
								</tbody>
							</table>		
						</div>		
							<p style=" padding-top:20px; text-align:right;">
								<img src="${pageContext.request.contextPath}/images/img/bt_regist.gif" id="btn_IntOk" onclick="docIntOk(); return false;" disabled="disabled" style="cursor:hand;">
								<img src="${pageContext.request.contextPath}/images/img/bt_cancel.gif" id="btn_IntCancel" value="취소" onclick="docIntCancel(); return false;" style="cursor:hand"/>
							</p>	
							</form>
						</div><!-- 표 끝 -->
						</div>
					</div>
				</div>
				<!-- // content -->
				
				<!-- 오른쪽 -->
<div class="DimArea notScroll">
<!-- 	<div class="ScrollBox">
 		<ul class="Promotion">
		        <li class="box"><a href="http://www.kogas.or.kr" target="blank" ><img src="${pageContext.request.contextPath}/images/img/kogas_ban2.gif" alt="" /></a></li>              
		</ul> 
	</div> -->
<!-- 	<div class="Bg"></div> -->
<!--  	<div class="Opener">
		<span class="Click Pro-open" onclick="javascript:OpenPro();"><img src="/btn-promotion-open.gif" alt="Open"/></span>
		<a class="Click Pro-close" href="#" onclick="javascript:ClosePro();"><img src="/btn-promotion-close.gif" alt="Close"/></a>
		<a href="#"><img src="/btn-content-top.gif" alt="top으로"/></a>
	</div> --> 
</div>
		<!-- 메뉴끝 -->	
</div>
</body>
</html>
	
	
 		
