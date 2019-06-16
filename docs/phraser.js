function openHowto() {
	window.open(
		'howto.html',
		'howto',
		'width=400, height=450, menubar=no, location=yes, resizable=yes, scrollbars=yes, status=yes'
	);
}

function setData(){
	document.getElementById("form1").reset();
	var txt = document.getElementById("JApl").ValueOut();
	document.getElementById("t1").value = txt;
}

function sendV(){
	var message = document.getElementById("t1").value;
	var return_str = document.getElementById("JApl").ValueIn(message);
	document.getElementById("t1").value = return_str;
}
