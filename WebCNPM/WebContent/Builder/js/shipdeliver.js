function loadInfo(listorderid) {
	$.ajax({
		url: "/WebProject/shipper/shipdeliver/load",
		type: "get",
		data: {
			exist: listorderid
		},
		success: function(data) {
			var row = document.getElementById("content");
			row.innerHTML += data;
			$(".closed-dong").click(function() {
				//$(".modal").removeClass("show");
				$(".modal").css("display", "none");
			});

		},
		error: function(xhr) { }
	})
};

function loadShippedInfo(listorderid) {
	$.ajax({
		url: "/WebProject/shipper/shipped/load",
		type: "get",
		data: {
			exist: listorderid
		},
		success: function(data) {
			var row = document.getElementById("content");
			row.innerHTML += data;
			$(".closed-dong").click(function() {
				//$(".modal").removeClass("show");
				$(".modal").css("display", "none");
			});

		},
		error: function(xhr) { }
	})
};



