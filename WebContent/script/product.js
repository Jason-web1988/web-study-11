function productCheck(){
	if(document.frm.name.value.length==0){
		alert("상품명을 반드시 입력해야 합니다.");
		frm.name.focus();
		return false;
	}
	if(document.frm.price.value.length==0){
		alert("가격을 반드시 입력해야 합니다.");
		frm.pwd.focus();
		return false;
	}
	if (isNaN(document.frm.price.value)){
		alert("숫자를 입력해야 합니다.");
		frm.price.focus();
		return false
	}
	return true;
}
