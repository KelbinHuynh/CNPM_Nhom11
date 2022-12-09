
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