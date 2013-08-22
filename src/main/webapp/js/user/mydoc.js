function searchMyDoc(){
	
	if($('#docSeq').val() == ''){
		$('#docSeq').val('0');
	}
	
	if($('#titIf').val()== ""){
		alert("제목을 입력해 주세요.");
		return false;
	}

	$('#searchForm').attr('action','/user/myDocList.do');
	$('#searchForm').submit();
	
}
function docDel(values1, values2){
	if(confirm("정말 삭제하시겠습니까?")){ 
		$('#docSeq').val(values1);
		$('#articleId').val(values2);
		$('#detailForm').attr('action','/user/myDocDel.do');
		$('#detailForm').submit();
	}
	
}
function docUpt(values){
	$('#docSeq').val(values);
	$('#detailForm').attr('action','/user/myDocUpt.do');
	$('#detailForm').submit();
}
function docList(){
	$('#detailForm').attr('action','/user/myDocList.do');
	$("#detailForm").submit();
}

function docView(values){
	$('#docSeq').val(values);
	$('#searchForm').attr('action','/user/myDocView.do');
	$('#searchForm').submit();
}

function suggestInsert(){
	$('#sgtForm').attr('action','/user/suggestInsert.do');
	$('#sgtForm').submit();
}

function docIntOk(){
	$('#intForm').attr('action','/user/docInsertOk.do');
	$('#intForm').submit();
}
function docUptOk(){
	if(confirm("정말 수정하시겠습니까?")){
		if($('#uptTitIf').val()==""){
			alert("글 제목을 입력하셔야 합니다.");
			return false;
		}
		$('#uptForm').attr('action','/user/myDocUptOk.do');
		$('#uptForm').submit();
	}
}
//첨부파일다운
function downLoadFile(articleId){
	$("#articleId").val(articleId);
	$("#detailForm").attr("action","/com/downloadFile.do");
	$("#detailForm").submit();
};
function docCancel(){
	$('#uptForm').attr('action','/user/myDocView.do');
	$('#uptForm').submit();
}
function fnOrderViewCnt(){
	$('#orderViewCnt').val("on");
	$('#orderDownCnt').val("off");
	$('#orderDt').val("off");
	$('#searchForm').attr('action','/user/myDocList.do');
	$('#searchForm').submit();
};

function fnOrderDownCnt(){
	$('#orderViewCnt').val("off");
	$('#orderDownCnt').val("on");
	$('#orderDt').val("off");
	$('#searchForm').attr('action','/user/myDocList.do');
	$('#searchForm').submit();
};

function fnOrderDt(){
	$('#orderViewCnt').val("off");
	$('#orderDownCnt').val("off");
	$('#orderDt').val("on");
	$('#searchForm').attr('action','/user/myDocList.do');
	$('#searchForm').submit();
};

function goCatUpt(){
var frm = document.popupForm;
	
	window.open('','uptCat','width=300,height=500,scrollbars=yes');
	frm.target = 'uptCat';
	frm.action = '/user/docCatUpt.do';
	frm.submit();
};