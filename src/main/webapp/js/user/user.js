function fnInit() {
    var message = $("#message").val();
    if (message != "") {
        alert(message);
    }
}
var re_mail = /^([\w\.-]+)@([a-z\d\.-]+)\.([a-z\.]{2,6})$/; // 이메일 검사식
function checkEmail(val){
	if(re_mail.test(val) != true) { // 이메일 검사
		return false;
	} 
	return true;
}
var re_tel = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;//전화번호 검사식
function checkTel(val){
	if(re_tel.test(val) != true) { // 이메일 검사
		return false;
	} 
	return true;
}
var chkNum=/^[0-9]*$/;
function checkNum(val){
	if(chkNum.test(val) != true) { // 이메일 검사
		return false;
	} 
	return true;
}
function regUser(){
	if(!checkNum($("#id_if").val())){
		alert("사번은 숫자만 입력가능합니다.");
		$("#id_if").focus();
		return false;
	}
	if($("#id_if").val() == ""){
		alert("사번을  입력해 주십시요.");
		$("#id_if").focus();
		return false;
	}
	if($("#id_if").val().length == 6){
		$("#id_if").val("19"+$("#id_if").val());
	}
	if($("#id_if").val().length != 8){
		alert("사번은 8자리입니다.");
		$("#id_if").focus();
		return false;
	}
	if($("#pw_if").val() == "" ){
		alert("비밀번호를  입력해 주십시요.");
		$("#pw_if").focus();
		return false;
	}
	if($("#pw_if").val().length < 6 ){
		alert("비밀번호는 6자리 이상으로 입력해주십시요.");
		$("#pw_if").focus();
		return false;
	}
	if($("#pw_if").val() != $("#pw_re").val()){
		alert("비밀번호를 동일하게 입력해 주십시요.");
		$("#pw_if").focus();
		return false;
	}
	if($("#user_nm").val().length == 0){
		alert("성명을 입력해주십시요.");
		$("#user_nm").focus();
		return false;
	}
	if($("#duty_if").val().length  == 0){
		alert("직급을 입력해주십시요..");
		$("#duty_if").focus();
		return false;
	}
	if($("#email_if").val().length  == 0){
		alert("이메일을 입력해주십시요.");
		$("#email_if").focus();
		return false;
	}
	if($("#tel_no_no").val().length  == 0){
		alert("전화번호를 입력해주십시요.");
		$("#tel_no_no").focus();
		return false;
	}
	if(!checkEmail($("#email_if").val())){
		alert('[Email 입력 오류] 유효한 이메일 주소를 입력해주십시요.');
		$("#email_if").focus();
		return false;
	}
	/*전화번호 패턴 체크 - 자유롭게 입력가능하도록 제거
	if(!checkTel($("#tel_no_no").val())){
		alert('[전화번호 입력 오류] 유효한 전화번호를 입력해주십시요.');
		$("#tel_no_no").focus();
		return false;
	}*/
	$('#joinUserForm').submit();
}
function fn_select_userDetail(){
	document.updateForm.submit();
}
function fn_update_user(){
	if($("#pw_if").val() == "" ){
		alert("비밀번호를  입력해 주십시요.");
		$("#pw_if").focus();
		return false;
	}
	if($("#pw_if").val().length < 6 ){
		alert("비밀번호는 6자리 이상으로 입력해주십시요.");
		$("#pw_if").focus();
		return false;
	}
	
	if($("#pw_if").val() != $("#pw_re").val()){
		alert("비밀번호를 동일하게 입력해 주십시요.");
		$("#pw_if").focus();
		return false;
	}
	if($("#duty_if").val().length  == 0){
		alert("직급을 입력해주십시요..");
		$("#duty_if").focus();
		return false;
	}
	if($("#email_if").val().length  == 0){
		alert("이메일을 입력해주십시요.");
		$("#email_if").focus();
		return false;
	}
	if($("#tel_no_no").val().length  == 0){
		alert("전화번호를 입력해주십시요.");
		$("#tel_no_no").focus();
		return false;
	}
	if(!checkEmail($("#email_if").val())){
		alert('[Email 입력 오류] 유효한 이메일 주소를 입력해주십시요.');
		$("#email_if").focus();
		return false;
	}
	$('#updateForm').attr('action','/user/UpdateUserProc.do');
	$('#updateForm').submit();
}
