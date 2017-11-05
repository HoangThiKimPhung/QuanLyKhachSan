<%@page import="javafx.scene.control.Alert"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8" />
    <title>Nhập thông tin cá nhân</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <script src="./JS/jquery-3.2.1.min.js"></script>
    <script src="./JS/bootstrap.min.js"></script>

    <link rel="stylesheet" href="./CSS/bootstrap.min.css" />
    <link rel="stylesheet" href="./CSS/font-awesome.min.css">
    <!-- My CSS-->
    <link rel="stylesheet" href="./CSS/datphong-thongtinKH.css">
    <!-- My JS -->
    <script src="./JS/datphong-thongtinKD.js"></script>
</head>
<body style="font-family:'Times New Roman';padding: 20px">
    <!-- HEADER -->
    <div class="container" style="text-align:center">
        <img src="./Images/logo-hotel.png" alt="logo" class="logo">
    </div><br />

    <div class="thongtin">
        <div class="row" style="margin-left:0">
            <!--Giỏ hàng-->
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" style="margin-right:50px; border:1px solid beige">
                <div class="panel-group" id="tablephong">
                    <h4 style="color:#0d875c;margin-left:10px"><strong><u>Giỏ hàng:</u></strong></h4>
                    <table class="table table" id="table-products">
                        <thead>
                            <tr>
                                <th>Loại phòng</th>
                                <th>Số lượng</th>
                                <th>Thành tiền (USD)</th>
                                <th>Ngày nhận phòng</th>
                                <th>Ngày trả phòng</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
                <h4><strong><u>TỔNG CỘNG:</u><span id="tongtien"></span></strong></h4>
                <button class="pull-right btn btn-main btn-lg" id="btntrolai">Thay đổi đặt phòng</button>
            </div>

            
            <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12">
                <form class="form">
                    <!--Thông tin cá nhân-->
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" style="padding-left:0">
                        <strong style="color:#0d875c;font-size:20px;line-height:50px">THÔNG TIN CÁ NHÂN</strong>
                        <div class="form-group">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <input type="text" name="hoten" id="hoten" placeholder="* Họ và tên" class="form-control" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <input type="text" name="CMND" id="CMND" placeholder="* CMND" class="form-control" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <input type="text" name="diachi" id="diachi" placeholder="* Địa chỉ" class="form-control" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <input type="text" name="quoctich" id="quoctich" placeholder="* Quốc tịch" class="form-control" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <input type="text" name="SDT" id="SDT" placeholder="* SDT" class="form-control" required />
                            </div>
                        </div>

                    </div>

                    <!--Thanh toán-->
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <strong style="color:#0d875c;font-size:20px;line-height:50px">THANH TOÁN</strong>
                        <hr style="margin-top:0" />
                        <strong style="color:red;font-size:17px">TIỀN CỌC (bằng 10% tiền thuê phòng): <span id="tiencoc"></span></strong><br />
                        <input type="text" class="form-control" id="sotiencoc" placeholder="* Mời bạn nhập đúng số tiền" style="margin-top:20px" required />
                    </div>

                    <button class="pull-right btn btn-main btn-lg" id="btnthanhtoan">Hoàn tất đặt phòng</button>
                </form>
            </div>
        </div>
    </div>
  
</body>
</html>