function searchCategoryDoc(){
	if($('#docSeq').val() == ''){
		$('#docSeq').val('0');
	}
	if($('#titIf').val()== ""){
		alert("검색어를 입력해 주세요.");
		return false;
	}else{
		$('#searchForm').attr('action','/user/categoryDocList.do');
		$('#searchForm').submit();
	}
};

function searchMetaDoc(){
	
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

	$('#searchForm').attr('action','/user/metaDocList.do');
	$('#searchForm').submit();
	
};

function allMetaDoc(){
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
	
	$('#searchForm').attr('action','/user/metaDocList.do');
	$('#searchForm').submit();
};

function docList(values){
	
	$('#regptNm').val("");
	$('#regptSeq').val("");
	
	if(values == "category"){
		$('#detailForm').attr('action','/user/categoryDocList.do');
	}else if(values == "meta"){
		$('#detailForm').attr('action','/user/metaDocList.do');
	}else{
		alert("구분 값이 없습니다.");
		return false;
	}
	$("#detailForm").submit();
};

function docView(values){
	$('#docSeq').val(values);
	$('#searchForm').attr('action','/user/docView.do');
	$('#searchForm').submit();
};

function suggestInsert(){
	if($('#sgtDc').val()==""){
		alert('의견 내용을 입력하셔야 합니다.');
		return false;
	}
	
	$('#sug').val("Y");
	$('#sgtForm').attr('action','/user/suggestInsert.do');
	$('#sgtForm').submit();
};

function docIntOk(){
	if($('#titIf').val()==""){
		alert('문서 제목을 입력하셔야 합니다.');
		return false;
	}
	
	$('#intForm').attr('action','/user/docInsertOk.do');
	$('#intForm').submit();
};

//첨부파일다운
function downLoadFile(articleId){
	$("#articleId").val(articleId);
	$("#detailForm").attr("action","/com/downloadFile.do");
	$("#detailForm").submit();
};

function docIntCancel(){
	if($('#articleId').val() == ""){
		$('#articleId').val("0");
	}
	$('#titIf').val("");
	
	$('#intForm').attr('action', '/user/docInsertCancel.do');
	$('#intForm').submit();
}

