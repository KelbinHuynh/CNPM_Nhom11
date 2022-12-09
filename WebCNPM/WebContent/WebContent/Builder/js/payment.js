function loadInfo(delivery) {
	$.ajax({
		url: "/WebProject/payment/load",
		type: "get",
		data: {
			exist: delivery
		},
		success: function(data) {
			var row = document.getElementById("bill");
			row.innerHTML = data;
			$(".closed-dong").click(function() {
				//$(".modal").removeClass("show");
				$(".modal").css("display", "none");
			});

		},
		error: function(xhr) { }
	})
};