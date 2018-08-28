/**
 * 게시판 사이트에 관련된 함수들을 모아둔 파일
 */
function isNull(obj, msg) {
	if(obj.value == "") {
		alert(msg);
		obj.focus();
		return true;
	}
	return false;
}

function checkExt(obj) {
	
	var forbid = ['exe', 'java', 'jsp', 'js', 'class'];
	var fileName = obj.value;
	var ext = fileName.substring(fileName.lastIndexOf('.')+1)
	
	for(var i = 0; i<forbid.length; i++) {
		if(forbid[i] === ext){
			alert(ext + "파일은 업로드 정책에 위배됩니다")
			return true;
		}
	}
	
	return false;
}