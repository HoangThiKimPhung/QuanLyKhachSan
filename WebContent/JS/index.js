
$(document).ready(function () {
    $("#loadbtn").click(function (e) {
        e.preventDefault();
        text = '<br><div class="row"><div class="col-lg-4 col-md-4 col-sm-4 col-xs-12" id="image7"><img src= "./Images/pic7.jpg" style= "width:100%;" alt= "Gym" ><div class="overlay"><div class="text"><h2>Gym</h2><p>Thân hình quyến rũ săn chắc hay chỉ đơn giản là chạy bộ tập thể dục</p></div></div></div>'
            + '<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12" id="image8"><img src="./Images/pic8.jpg" style="width:100%;" alt="Bar" ><div class="overlay"><div class="text"><h2>Bar</h2><p>Lắc lư theo những điệu nhạc sôi động cùng thưởng thức ly Whisky tuyệt vời</p></div></div></div>'
            + '<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12" id="image9"><img src= "./Images/pic9.jpg" style= "width:100%;" alt= "Sea" ><div class="overlay"><div class="text"><h2>Lặn biển</h2><p>Những rạn san hô tuyệt đẹp cùng nhiều loài cá đủ màu sắc sẽ khiến bạn mê say</p></div></div></div></div>'

        $("#portfolio").append(text);
        $("#loadbtn").hide();
        
    });
    
    $("#btntimphong").click(function (e){
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
    	
    });});