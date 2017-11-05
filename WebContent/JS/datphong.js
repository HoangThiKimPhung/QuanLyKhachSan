$(document).ready(function () {
    //Lấy số hàng của bảng
    //var rows = document.getElementById("table-products").getElementsByTagName("tbody")[0].getElementsByTagName("tr").length;
    //Tổng tiền
    var sum = 0;
    var max1 = 0, max2 = 0, max3 = 0; //Số phòng được đặt tối đa
    var maloaiphong = 0;
    var maloaiphongphuchoi = 0;
    
    //Disable button xác nhận
    $("#btnxacnhan").prop('disabled', true);
    
    var ngaynhanphong = $("#ngaynhanphong").val();
    var ngaytraphong = $("#ngaytraphong").val();            
    
    $.ajax({
    	type: "POST", //method
        url: "KD_TimPhong?ngaynhanphong="+ngaynhanphong+"&ngaytraphong="+ngaytraphong,
        dataType: "json",
        success: function (result) {
        	//Lấy size của list số phòng trống theo từng loại phòng được trả về
            var n = Object.keys(result).length;
            if(n>0){
            	for(i=0; i<n; i++){
            		if(result[i].maLoaiPhong == 1 && result[i].soPhongTrong == 0){ //Hết phòng
            			$("#pdon2").hide();
            			$("#pdon1").show();
            		}
            		else if(result[i].maLoaiPhong == 1 && result[i].soPhongTrong > 0){
            			$("#pdon1").hide();
            			$("#pdon2").show();
            			max1 = result[i].soPhongTrong;
            			$("#spcl1").text("Chỉ còn lại " + result[i].soPhongTrong + " phòng");
            			$("#spdtd1").text("Số phòng đặt tối đa: " + result[i].soPhongTrong);
            		}
            		
            		if(result[i].maLoaiPhong == 2 && result[i].soPhongTrong == 0){ //Hết phòng
            			$("#pdoi2").hide();
            			$("#pdoi1").show();
            		}
            		else if(result[i].maLoaiPhong == 2 && result[i].soPhongTrong > 0){
            			$("#pdoi1").hide();
            			$("#pdoi2").show();
            			max2 = result[i].soPhongTrong;
            			$("#spcl2").text("Chỉ còn lại " + result[i].soPhongTrong + " phòng");
            			$("#spdtd2").text("Số phòng đặt tối đa: " + result[i].soPhongTrong);
            		}
            		
            		if(result[i].maLoaiPhong == 3 && result[i].soPhongTrong == 0){ //Hết phòng
            			$("#ptt2").hide();
            			$("#ptt1").show();
            		}
            		else if(result[i].maLoaiPhong == 3 && result[i].soPhongTrong > 0){
            			$("#ptt1").hide();
            			$("#ptt2").show();
            			max3 = result[i].soPhongTrong;
            			$("#spcl3").text("Chỉ còn lại " + result[i].soPhongTrong + " phòng");
            			$("#spdtd3").text("Số phòng đặt tối đa: " + result[i].soPhongTrong);
            		}
            	}
            }
            else
        	{
            	console.log("n<0");
        	}
        }
    });
    
   
    //Show chi tiết thông tin phòng
    $("#infodon1").click(function () {
        $("#collapse1").toggle();
    });
    $("#infodon2").click(function () {
        $("#collapse1").toggle();
    });
    $("#btnhide1").click(function () {
        $("#collapse1").hide();
    });

    $("#infodoi1").click(function () {
        $("#collapse2").toggle();
    });
    $("#infodoi2").click(function () {
        $("#collapse2").toggle();
    });
    $("#btnhide2").click(function () {
        $("#collapse2").hide();
    });

    $("#infott1").click(function () {
        $("#collapse3").toggle();
    });
    $("#infott2").click(function () {
        $("#collapse3").toggle();
    });
    $("#btnhide3").click(function () {
        $("#collapse3").hide();
    });

    //Button + clicked
    $('.qtyplus1').click(function (e) {
        // Stop acting like a button
        e.preventDefault();
        // Get the field name
        fieldName = $(this).attr('field');
        // Get its current value
        var currentVal = parseInt($('input[name=' + fieldName + ']').val());
        // If is not undefined
        if (!isNaN(currentVal) && currentVal < max1) {
            // Increment
            $('input[name=' + fieldName + ']').val(currentVal + 1);
        } else{
            // Otherwise put a 0 there
            $('input[name=' + fieldName + ']').val(1);
        }
    });
    //Button - clicked
    $('.qtyminus1').click(function (e) {
        // Stop acting like a button
        e.preventDefault();
        // Get the field name
        fieldName = $(this).attr('field');
        // Get its current value
        var currentVal = parseInt($('input[name=' + fieldName + ']').val());
        // If it isn't undefined or its greater than 0
        if (!isNaN(currentVal) && currentVal > 1) {
            // Decrement one
            $('input[name=' + fieldName + ']').val(currentVal - 1);
        } else{
            // Otherwise put a 0 there
            $('input[name=' + fieldName + ']').val(1);
        }
    });

    //Button + clicked
    $('.qtyplus2').click(function (e) {
        // Stop acting like a button
        e.preventDefault();
        // Get the field name
        fieldName = $(this).attr('field');
        // Get its current value
        var currentVal = parseInt($('input[name=' + fieldName + ']').val());
        
        // If is not undefined
        if (!isNaN(currentVal) && currentVal < max2) {
            // Increment
            $('input[name=' + fieldName + ']').val(currentVal + 1);
        } else {
            // Otherwise put a 0 there
            $('input[name=' + fieldName + ']').val(1);
        }
    });
    //Button - clicked
    $('.qtyminus2').click(function (e) {
        // Stop acting like a button
        e.preventDefault();
        // Get the field name
        fieldName = $(this).attr('field');
        // Get its current value
        var currentVal = parseInt($('input[name=' + fieldName + ']').val());
        // If it isn't undefined or its greater than 0
        if (!isNaN(currentVal) && currentVal > 1) {
            // Decrement one
            $('input[name=' + fieldName + ']').val(currentVal - 1);
        } else {
            // Otherwise put a 0 there
            $('input[name=' + fieldName + ']').val(1);
        }
    });

    //Button + clicked
    $('.qtyplus3').click(function (e) {
        // Stop acting like a button
        e.preventDefault();
        // Get the field name
        fieldName = $(this).attr('field');
        // Get its current value
        var currentVal = parseInt($('input[name=' + fieldName + ']').val());
        // If is not undefined
        if (!isNaN(currentVal) && currentVal < max3) {
            // Increment
            $('input[name=' + fieldName + ']').val(currentVal + 1);
        } else {
            // Otherwise put a 0 there
            $('input[name=' + fieldName + ']').val(1);
        }
    });
    //Button - clicked
    $('.qtyminus3').click(function (e) {
        // Stop acting like a button
        e.preventDefault();
        // Get the field name
        fieldName = $(this).attr('field');
        // Get its current value
        var currentVal = parseInt($('input[name=' + fieldName + ']').val());
        // If it isn't undefined or its greater than 0
        if (!isNaN(currentVal) && currentVal > 1) {
            // Decrement one
            $('input[name=' + fieldName + ']').val(currentVal - 1);
        } else {
            // Otherwise put a 0 there
            $('input[name=' + fieldName + ']').val(1);
        }
    });

    //Thêm vào giỏ hàng 
    $(".add-to-cart").click(function (e) {
    	e.preventDefault();
        
        var button = $(this); // Lấy đối tượng button mà người dùng click
        var id = button.attr("id"); // id của sản phẩm là id của button
        var name = button.attr("data-name"); // name của sản phẩm là thuộc tính data-name của button
        var price = button.attr("data-price"); // price của sản phẩm là thuộc tính data-price của button
        var tiencoc = 0;

        //format ngày nhận phòng và ngày trả phòng
        var ngayNhan = new Date($('#ngaynhanphong').val());
        dayNhan = ngayNhan.getDate();
        monthNhan = ngayNhan.getMonth() + 1;
        yearNhan = ngayNhan.getFullYear();
        
        var ngayTra = new Date($('#ngaytraphong').val());
        dayTra = ngayTra.getDate();
        monthTra = ngayTra.getMonth() + 1;
        yearTra = ngayTra.getFullYear()
        
        var songaydat = dayTra - dayNhan;
        
        // Số lượng phòng
        fieldName = button.attr('field');
        // Get its current value
        var quantity = parseInt($('input[name=' + fieldName + ']').val());

        if (quantity > 0) {
        	tiencoc = price * quantity * 0.1 * songaydat;
        		
            $("#table-products > tbody:last").append(
            		$('<tr>').append(
            				$('<td>').text(name)
            				).append(
            				$('<td>').text(price)
            				).append(
            				$('<td>').text(quantity)
            				).append(
            				$('<td>').text([dayNhan, monthNhan, yearNhan].join('/'))
            				).append(
            				$('<td>').text([dayTra, monthTra, yearTra].join('/'))
            				).append(
            				$('<td>').text(price * quantity * songaydat)
            				).append(
            				$('<td>').append(
            					$('<a>').text('Hủy').css('cursor', 'pointer').click(function (e){
            						e.preventDefault();
                                    if (confirm('Bạn có chắc chắn muốn hủy đặt phòng này không?')) {
                                    	
                                    	//Lấy số phòng, loại phòng và số tiền mà khách vừa hủy
                                        var loaiPhongPhucHoi = $(this).closest('tr').find('td:nth-child(1)').text();
                                        var soPhongPhucHoi = $(this).closest('tr').find('td:nth-child(3)').text();
                                        var ngayNhanPhong = $(this).closest('tr').find('td:nth-child(4)').text();
                                        var ngayTraPhong = $(this).closest('tr').find('td:nth-child(5)').text();
                                        var tongTienGiam = $(this).closest('tr').find('td:nth-child(6)').text();
                                        
                                    	sum-=parseFloat(tongTienGiam);
                                        $(".tongtien").text(" " + sum);
                                        
                                        //Thêm lại số phòng trống vào loại phòng tương ứng
                                        if(loaiPhongPhucHoi == "Phòng đơn"){
                                        	if(ngayNhanPhong == [dayNhan, monthNhan, yearNhan].join('/') && ngayTraPhong == [dayTra, monthTra, yearTra].join('/')){
                                        		max1 = max1 + parseInt(soPhongPhucHoi);
                                        		maloaiphongphuchoi = 1;
                                        		
	                                        	if($("#sl1").val()==0){
	                                        		$("#sl1").val(1);
	                                        		$("#q1").attr('disabled', false);
	                                        		$(".qtyplus1").prop('disabled', false);
	                                        		$(".qtyminus1").prop('disabled', false);
	                                        	}
                                        	}
                                        }
                                        
                                        if(loaiPhongPhucHoi == "Phòng đôi"){
                                        	if(ngayNhanPhong == [dayNhan, monthNhan, yearNhan].join('/') && ngayTraPhong == [dayTra, monthTra, yearTra].join('/')){
                                        		max2 = max2 + parseInt(soPhongPhucHoi);
                                        		maloaiphongphuchoi = 2;
                                        		
	                                        	if($("#sl2").val()==0){
	                                        		$("#sl2").val(1);
	                                        		$("#q2").prop('disabled', false);
	                                        		$(".qtyplus2").prop('disabled', false);
	                                        		$(".qtyminus2").prop('disabled', false);
	                                        	}
                                        	}
                                        }
                                        
                                        if(loaiPhongPhucHoi == "Phòng tập thể"){
                                        	if(ngayNhanPhong == [dayNhan, monthNhan, yearNhan].join('/') && ngayTraPhong == [dayTra, monthTra, yearTra].join('/')){
                                        		max3 = max3 + parseInt(soPhongPhucHoi);
                                        		maloaiphongphuchoi = 3;
                                        	
	                                        	if($("#sl3").val()==0){
	                                        		$("#sl3").val(1);
	                                        		$("#q3").prop('disabled', false);
	                                        		$(".qtyplus3").prop('disabled', false);
	                                        		$(".qtyminus3").prop('disabled', false);
	                                        	}
                                        	}
                                        }
                                        
                                        $.ajax({
                                            type: "DELETE",
                                            url: "KD_ThongTinDatPhong?maloaiphong="+maloaiphongphuchoi+"&sophong="+quantity+"&ngaynhanphong="+ngayNhan+"&ngaytraphong="+ngayTra+"&tiencoc="+tiencoc
                                        }); 
                                        
                                    	$(this).closest('tr').remove();
                                    }

                                    if($("#table-products").find('tr').length == 1){
                                    	$("#btnxacnhan").prop('disabled', true);
                                    }
                                    
            					})
            			)
            	)
            )
            
            if(id=="q1"){
            	max1-=quantity;
            	maloaiphong = 1;
            	if(max1==0){
            		$("#sl1").val(0);
            		$("#q1").prop('disabled', true);
            		$(".qtyplus1").prop('disabled', true);
            		$(".qtyminus1").prop('disabled', true);
            	}
            	else{
            		$("#sl1").val(1);
            	}
            }
            else if(id=="q2"){
            	max2-=quantity;
            	maloaiphong = 2;
            	if(max2==0){
            		$("#sl2").val(0);
            		$("#q2").prop('disabled', true);
            		$(".qtyplus2").prop('disabled', true);
            		$(".qtyminus2").prop('disabled', true);
            	}
            	else{
            		$("#sl2").val(1);
            	}
            }
            else if(id=="q3"){
            	max3-=quantity;
            	maloaiphong = 3;
            	if(max3==0){
            		$("#sl3").val(0);
            		$("#q3").prop('disabled', true);
            		$(".qtyplus3").prop('disabled', true);
            		$(".qtyminus3").prop('disabled', true);
            	}
            	else{
            		$("#sl3").val(1);
            	}
            }
            
            //Thêm thông tin đặt phòng vào List
            $.ajax({
            	type: "GET",
            	url: "KD_ThongTinDatPhong",
            	data: {
            		maloaiphong: maloaiphong,
            		sophong: quantity,
            		ngaynhanphong: ngayNhan,
            		ngaytraphong: ngayTra,
            		tiencoc: tiencoc
            	}
            });
            
        }
        
        if ($("#table-products").find('tr').length > 1) {
            $("#btnxacnhan").prop('disabled', false); //Enable button xác nhận khi có đặt phòng
        }
        
        //Tổng tiền phải trả
        sum+=parseFloat(price * quantity * songaydat);
        $(".tongtien").text(" " + sum);
    });
    
    $("#findroom").click(function (e) {
    	e.preventDefault();
    	var ngayNhanPhong = new Date($("#ngaynhanphong").val());
        var ngayTraPhong = new Date($("#ngaytraphong").val());

        var d = new Date();
        var ngayHienTai = new Date(d.getFullYear(), d.getMonth(), d.getDate());
        
        if (ngayNhanPhong == "Invalid Date" || ngayTraPhong == "Invalid Date"){
            alert("Nhập đầy đủ ngày nhận phòng và ngày trả phòng!!!");
            e.preventDefault();
        }
        else if (ngayNhanPhong >= ngayTraPhong){
            alert("Ngày nhận phòng và ngày trả phòng không hợp lệ!!!");
            e.preventDefault();
        }
        else if (ngayNhanPhong < ngayHienTai){
            alert("Ngày nhận phòng phải lớn hơn hoặc bằng ngày hiện tại!!!");
            e.preventDefault();
        }
        else{
        	var ngaynhanphong = $("#ngaynhanphong").val();
            var ngaytraphong = $("#ngaytraphong").val();            
            
            $("#tbodyid").empty();
            sum = 0;
            $(".tongtien").text(" " + sum);
            $("#btnxacnhan").prop('disabled', true);
            
            $.ajax({
            	type: "POST", //method
                url: "KD_TimPhong?ngaynhanphong="+ngaynhanphong+"&ngaytraphong="+ngaytraphong,
                dataType: "json",
                success: function (result) {
                	//Lấy size của list số phòng trống theo từng loại phòng được trả về
                    var n = Object.keys(result).length;
                    if(n>0){
                    	for(i=0; i<n; i++){
                    		if(result[i].maLoaiPhong == 1 && result[i].soPhongTrong == 0){ //Hết phòng
                    			$("#pdon2").hide();
                    			$("#pdon1").show();
                    		}
                    		else if(result[i].maLoaiPhong == 1 && result[i].soPhongTrong > 0){
                    			$("#pdon1").hide();
                    			$("#pdon2").show();
                    			max1 = result[i].soPhongTrong;
                    			$("#spcl1").text("Chỉ còn lại " + result[i].soPhongTrong + " phòng");
                    			$("#spdtd1").text("Số phòng đặt tối đa: " + result[i].soPhongTrong);
                    			$("#sl1").val(1);
                        		$("#q1").prop('disabled', false);
                        		$(".qtyplus1").prop('disabled', false);
                        		$(".qtyminus1").prop('disabled', false);
                    		}
                    		
                    		if(result[i].maLoaiPhong == 2 && result[i].soPhongTrong == 0){ //Hết phòng
                    			$("#pdoi2").hide();
                    			$("#pdoi1").show();
                    		}
                    		else if(result[i].maLoaiPhong == 2 && result[i].soPhongTrong > 0){
                    			$("#pdoi1").hide();
                    			$("#pdoi2").show();
                    			max2 = result[i].soPhongTrong;
                    			$("#spcl2").text("Chỉ còn lại " + result[i].soPhongTrong + " phòng");
                    			$("#spdtd2").text("Số phòng đặt tối đa: " + result[i].soPhongTrong);
                    			$("#sl2").val(1);
                        		$("#q2").prop('disabled', false);
                        		$(".qtyplus2").prop('disabled', false);
                        		$(".qtyminus2").prop('disabled', false);
                    		}
                    		
                    		if(result[i].maLoaiPhong == 3 && result[i].soPhongTrong == 0){ //Hết phòng
                    			$("#ptt2").hide();
                    			$("#ptt1").show();
                    		}
                    		else if(result[i].maLoaiPhong == 3 && result[i].soPhongTrong > 0){
                    			$("#ptt1").hide();
                    			$("#ptt2").show();
                    			max3 = result[i].soPhongTrong;
                    			$("#spcl3").text("Chỉ còn lại " + result[i].soPhongTrong + " phòng");
                    			$("#spdtd3").text("Số phòng đặt tối đa: " + result[i].soPhongTrong);
                    			$("#sl3").val(1);
                        		$("#q3").prop('disabled', false);
                        		$(".qtyplus3").prop('disabled', false);
                        		$(".qtyminus3").prop('disabled', false);
                    		}
                    	}
                    }
                    else
                	{
                    	console.log("n<0");
                	}
                }
            });
            
            $.ajax({
            	type: "PUT", //method
                url: "KD_ThongTinDatPhong",
                dataType: "json"
            });
        }
    });
});
