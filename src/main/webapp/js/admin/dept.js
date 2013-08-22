function insertDept(){
	if($('#deptNm').val()==""){
		alert("그룹명을 입력해 주셔야 합니다.");
		return false;
	}else{
		
		$('#insertForm').attr('action','/admin/deptInsert.do');
		$('#insertForm').submit();
	}
}
function deleteDept(value){
	if(value=="1"){
		alert("미지정 그룹은 삭제할 수 없습니다.");
		return false;
	}else{
		if(confirm("정말 삭제하시겠습니까?")){
			$('#deptCd').val(value);
			$('#deleteForm').attr('action','/admin/deptDelete.do');
			$('#deleteForm').submit();
		}
	}
}
function goUser(){
	$('#insertForm').attr('action','/admin/userList.do');
	$('#insertForm').submit();
}