
function loadProjectToMajor(sel) {
	$.ajax({
		url: "/WebCNPM/DanhSach",
		type: "get",
		data: {
			exist: sel.value
		},
		success: function(data) {
			var row = document.getElementById("project_major");
			row.innerHTML = data;
		},
		error: function(xhr) { }
	})
};

function showinfo(studentid){
	$.ajax({
		url: "/WebCNPM/InformationUser",
		type: "get",
		data: {
			exist: studentid
		},
		success: function(data) {
			var row = document.getElementById("info"+studentid);
			row.innerHTML += data;
		},
		error: function(xhr) { }
	})
};

function infoStudentToSearch(param){
	$.ajax({
		url: "/WebCNPM/InformationUserToSearch",
		type: "get",
		data: {
			exist: param.value
		},
		success: function(data) {
			var row = document.getElementById("infoStudent");
			row.innerHTML = data;
		},
		error: function(xhr) { }
	})
}

function acceptStudentLeader(mssv){
	$("#studentLeader").val(mssv);
	$.ajax({
		url: "/WebCNPM/InformationUserToSearch",
		type: "get",
		data: {
			exist: mssv
		},
		success: function(data) {
			var row = document.getElementById("infoStudent");
			row.innerHTML = data;
		},
		error: function(xhr) { }
	})
}

function loadAdminAccountAdd() {
	$.ajax({
		url: "/WebCNPM/admin/user/add",
		type: "get",
		data: {
			exist: userid
		},
		success: function(data) {
			var row = document.getElementById("content");
			row.innerHTML += data;
			$(".closed-dongs").click(function() {
				$("div").remove(".showed");
			});

		},
		error: function(xhr) { }
	})
};

function myfun(){
	var a = document.getElementsByName('method-lecturer');
	var newvar = 0;
	var count;
	for (count=0; count < a.length; count++){
		if(a[count].checked==true){
			newvar = newvar+1;
		}
	}
	if (newvar >= 4){
		document.getElementById('notvalid').innerHTML = "Không chọn nhiều hơn 3 giảng viên";
		return false;
	}
}

function myfunProject(){
	var a = document.getElementsByName('method-project');
	var newvar = 0;
	var count;
	for (count=0; count < a.length; count++){
		if(a[count].checked==true){
			newvar = newvar+1;
		}
	}
	if (newvar >= 4){
		document.getElementById('notvalidProject').innerHTML = "Không chọn nhiều hơn 3 đề tài";
		return false;
	}
}