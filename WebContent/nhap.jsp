<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Search Employee</title>
        <script src="./JS/jquery-1.10.2.min.js"></script>       
        <style>
            th{ 
                background: rgba(0, 135, 255, 0.46);
            }
            .text-center{ 
                text-align: center;
            }
            .trOnColor{ 
                background: rgba(0, 121, 128, 0.23);
            }
        </style>
        <script type="text/javascript">
        
        $(function () {
        	
        	$('.demo').click(function(){
        		$.ajax({
                    type: "GET",
                    url: "nhap2",
                    data: {
                        name: "Phụng",
                        age: "23",
                        nguoiyeu: "Thiện"
                    }
                });
        	});

            $('.search').click(function () {
                var name = $("#name").val();
                $.ajax({
                    type: "GET",
                    url: "nhap", //Tên servlet
                    data: {name: name},  //Gán giá trị vào name mục đich để servlet nhận được Parameter
                    dataType: "json",
                    success: function (result) {
                        //Lấy size của list này
                        var listSize = Object.keys(result).length;
                        //Nếu List lấy từ Dao là null thì thông báo Not found và return
                        if (result.check == "fail") {
                            $('#message').text("List isEmpty! Name not found!");
                            $('#message').css('color', 'red');
                            return;
                        }
                        //Nếu list tồn tại thì reset thông điệp cảnh báo về rỗng và loop dữ liệu hiển thị ra table
                        if (listSize > 0) {
                            $('#message').text("");
<<<<<<< HEAD
=======
                            console.log(listSize);
>>>>>>> 0bdc73af5da830da558b7129529f5cccf7f480ea
                            //Khai báo table kiểu global để sử dụng ngoài fuction này
                            table = document.getElementById("row");
                            for (i = 0; i < listSize; i++) {
                                var row = table.insertRow(i);

                                var cell = row.insertCell(0);
                                var cell1 = row.insertCell(1);
                                var cell2 = row.insertCell(2);
                                var cell3 = row.insertCell(3);

                                cell.innerHTML = result[i].maLoaiPhong; 
                                cell1.innerHTML = result[i].loaiPhong; 
                                cell2.innerHTML = result[i].maPhong;
                                cell3.innerHTML = result[i].tienPhong;
								//maLoaiPhong, loaiPhong, maPhong, tienPhong muốn lấy giá trị nào 
								//thì lấy như cấu trúc của 1 struct
                                
                                
                                // Thêm class vào tr
                                row.className += 'trOnColor';// class có tên trOnColor
                                // Thêm class vào td
                                cell.className += 'text-center'; // Class có tên text-center
                                // Thêm class vào td tạo kích thước width cho từng cột
                                cell1.className += 'text-center';
                                cell2.className += 'text-center';
                                cell3.className += 'text-center';
                            }
                        }

                    }
                });
            });
            //Reset table về trạng thái không có bản ghi nào
            $('.search').click(function () {
                var trLength = table.getElementsByTagName("tr").length;
                if (trLength > 0) {
                    for (i = 0; i < trLength; i++) {
                        table.deleteRow(0);
                    };
                }
            });
        });
        
        </script>
</head>
 <body>
        <p id="message" align="left"></p> <!--Hiển thị thông báo không tìm thấy bản ghi   -->
            Name<input type="text" id="name" name="name"/> 
            <input type="button" class="search" value="Search" />
            <input type="button" class="demo" value="Demo" />
        <table border="1px" width="500px">
            <thead>
                <tr>
                    <th>Mã loại phòng</th>
                    <th>Loại phòng</th>
                    <th>Mã phòng</th>
                    <th>Phí thuê</th>
                </tr>
            </thead>
            <tbody id="row">
            <!--Dữ liệu sẽ được thêm mới bằng việc thêm các thẻ <tr> <td> và giá trị bắt đầu từ id=row  -->
            </tbody>
        </table>
    </body>
</html>