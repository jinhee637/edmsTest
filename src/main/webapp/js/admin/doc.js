function searchDoc(){
	if($('#docSeq').val() == ''){
		$('#docSeq').val('0');
	}
	
	if($('#all').val()==""){
		$('#allSearch').val("N");
		if($('#titSearch').is(':checked') == false){
			if($('#writmanSearch').is(':checked') == false){
				if($('#sbjSearch').is(':checked') == false){
					if($('#keywordSearch').is(':checked') == false){
						alert('검색 옵션을 하나라도 선택하셔야 합니다');
						return false;
					}
				}
			}
		}
	}else{
		$('#allSearch').val("Y");
	}
	
	if($('#titSearch').is(':checked') == true){
		if($('#titIf').val()== ""){
			alert("제목을 입력해 주세요.");
			return false;
		}
	}
	
	if($('#writmanSearch').is(':checked') == true){
		if($('#writmanNm').val()== ""){
			alert("작성자를 입력해 주세요.");
			return false;
		}
	}
	
	if($('#sbjSearch').is(':checked') == true){
		if($('#sbjNt').val()== ""){
			alert("주제를 입력해 주세요.");
			return false;
		}
	}
	
	if($('#keywordSearch').is(':checked') == true){
		if($('#keywordIf').val()== ""){
			alert("키워드를 입력해 주세요.");
			return false;
		}
	}

	$('#searchForm').attr('action','/admin/docList.do');
	$('#searchForm').submit();
}

function allDoc(){
	$('#allSearch').val("N");
	$('#all').val("");
	$('#chk_tit').val("N");
	$('#titSearch').attr('checked', false);
	$('#titIf').val("");
	$('#chk_writman').val("N");
	$('#writmanSearch').attr('checked', false);
	$('#writmanNm').val("");
	$('#chk_sbj').val("N");
	$('#sbjSearch').attr('checked', false);
	$('#sbjNt').val("");
	$('#chk_keyword').val("N");
	$('#keywordSearch').attr('checked', false);
	$('#keywordIf').val("");
	$('#orderViewCnt').val("off");
	$('#orderDownCnt').val("off");
	$('#orderDt').val("on");
	
	$('#searchForm').attr('action','/admin/docList.do');
	$('#searchForm').submit();
}

function fnOrderViewCnt(){
	$('#orderViewCnt').val("on");
	$('#orderDownCnt').val("off");
	$('#orderDt').val("off");
	$('#searchForm').attr('action','/admin/docList.do');
	$('#searchForm').submit();
}
function fnOrderDownCnt(){
	$('#orderDownCnt').val("on");
	$('#orderViewCnt').val("off");
	$('#orderDt').val("off");
	$('#searchForm').attr('action','/admin/docList.do');
	$('#searchForm').submit();
}
function fnOrderDt(){
	$('#orderDt').val("on");
	$('#orderDownCnt').val("off");
	$('#orderViewCnt').val("off");
	$('#searchForm').attr('action','/admin/docList.do');
	$('#searchForm').submit();
}
function docView(values){
	$('#docSeq').val(values);
	$('#searchForm').attr('action','/admin/docView.do');
	$('#searchForm').submit();
}

function docDel(values1, values2){
	if(confirm("정말 삭제하시겠습니까?")){ 
		$('#docSeq').val(values1);
		$('#articleId').val(values2);
		$('#detailForm').attr('action','/admin/docDel.do');
		$('#detailForm').submit();
	}
	
}
function docUpt(values){
	$('#docSeq').val(values);
	$('#detailForm').attr('action','/admin/docUpt.do');
	$('#detailForm').submit();
}
function docList(){
	$('#detailForm').attr('action','/admin/docList.do');
	$('#detailForm').submit();
}
function docUptOk(){
	if(confirm("정말 수정하시겠습니까?")){
		if($('#uptTitIf').val()==""){
			alert("글 제목을 입력하셔야 합니다.");
			return false;
		}
		$('#uptForm').attr('action','/admin/docUptOk.do');
		$('#uptForm').submit();
	}
}

//첨부파일다운
function downLoadFile(articleId){
	$("#articleId").val(articleId);
	$("#detailForm").attr("action","/com/downloadFile.do");
	$("#detailForm").submit();
}

function docCancel(){
	$('#uptForm').attr('action','/admin/docView.do');
	$('#uptForm').submit();
}

function goCatUpt(){
	var frm = document.popupForm;
	
	window.open('','uptCat','width=300,height=500,scrollbars=yes');
	frm.target = 'uptCat';
	frm.action = '/admin/docCatUpt.do';
	frm.submit();
}