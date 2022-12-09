function loadAdminPro(listorderid) {
	$.ajax({
		url: "/WebProject/admin/product/load",
		type: "get",
		data: {
			exist: listorderid
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

function loadAdminAdd() {
	$.ajax({
		url: "/WebProject/admin/product/addload",
		type: "get",
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

function loadAdminEditPro(proid) {
	$.ajax({
		url: "/WebProject/admin/product/editload",
		type: "get",
		data: {
			exist: proid
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

function loadAdminUser(userid) {
	$.ajax({
		url: "/WebProject/admin/account/load",
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
function loadAdminUserUpdate(userid) {
	$.ajax({
		url: "/WebProject/admin/account/updateload",
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

function loadAdminEditCate(cateid) {
	$.ajax({
		url: "/WebProject/admin/category/updateload",
		type: "get",
		data: {
			exist: cateid
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

function loadAdminCategoryAdd() {
	$.ajax({
		url: "/WebProject/admin/category/addload",
		type: "get",
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

function loadAdminEditStyle(styleid) {
	$.ajax({
		url: "/WebProject/admin/style/updateload",
		type: "get",
		data: {
			exist: styleid
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
function loadAdminStyleAdd() {
	$.ajax({
		url: "/WebProject/admin/style/addload",
		type: "get",
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


function loadAdminOrder(orderid) {
	$.ajax({
		url: "/WebProject/admin/order/view",
		type: "get",
		data: {
			exist: orderid
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

const $$ = document.querySelectorAll.bind(document);
var listLink = location.href;
var listItem = $$(".aside-menu .menu-item .menu-link");
var listLength = listItem.length;

var i = 0;
for (i; i < listLength; i++) {
	 listItem[i].classList.remove("active");
    if (listItem[i].href === listLink) {
        listItem[i].classList.add("active");
    }
}