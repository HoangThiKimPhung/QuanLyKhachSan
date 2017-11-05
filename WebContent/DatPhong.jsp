<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="connectionDB.KDTimPhongDB" %>
<%@page import="java.util.List" %>
<%@page import="model.SoLuongPhongTrong" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page import="connectionDB.KDDatPhongDB" %>
<%@page import="model.ThongTinDatPhong" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Đặt Phòng</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<script src="./JS/jquery-3.2.1.min.js"></script>
<script src="./JS/bootstrap.min1.js"></script>
<script src="./JS/bootstrap-datepicker.js"></script>

<link rel="stylesheet" href="./CSS/bootstrap.min.css" />
<link rel="stylesheet" href="./CSS/font-awesome.min.css">
<link rel="stylesheet" href="./CSS/bootstrap-datepicker.css">

<!--My JS-->
<script src="./JS/datphong.js"></script>
<!--My CSS-->
<link rel="stylesheet" href="./CSS/datphong.css" />

</head>
<body>
	<!-- HEADER -->
	<div class="container" style="text-align: center">
		<img src="./Images/logo-hotel.png" alt="logo" class="logo">
	</div>
	
	<%
	  //Khởi tạo list Thông tin Đặt phòng để sử dụng cho việc thêm phòng đặt
	  List<ThongTinDatPhong> thongtindatphong = new ArrayList<ThongTinDatPhong>();
	  //Lưu danh sách vào application scope để thuận tiện cho việc thêm sửa
	  getServletContext().setAttribute("thongtindatphong", thongtindatphong);
	%>
	
	<!--Tìm phòng-->
	<div class="container">
		<div class="row" style="margin: 0">
			<div ng-view="" class="view-frame ng-scope">
				<div class="navbar-inverse skinned-bar affix-top ng-scope"
					role="banner" id="top-banner"
					style="margin-bottom: 10px; z-index: 90; min-height: 50px; border: 1px solid transparent; border-radius: 5px; background: #0d875c">
					<div class="hidden-xs">
						<form class="hidden-xs form-horizontal" style="padding: 0 5px 10px 5px; margin-top: 8px;">
							<div class="col-lg-12 col-md-12 col-sm-12" id="checkin-form">
								<label class="nav-label control-label pull-left">Ngày
									nhận phòng:</label>
								<input class="pull-left form-control" type="date" class="form-control" id="ngaynhanphong" name="ngaynhanphong" value="<%=getServletContext().getAttribute("ngaynhanphong") %>" style="width:150px">
								<label class="nav-label control-label pull-left"
									style="margin-left: 25px">Ngày trả phòng:</label>
								<input class="pull-left form-control" type="date" class="form-control" id="ngaytraphong" name="ngaytraphong" value="<%=getServletContext().getAttribute("ngaytraphong") %>" style="width:150px">
								<span class="pull-left" style="width: 10px;">&nbsp;</span>
								<button class="pull-left btn btn-main" id="findroom">Tìm phòng trống</button>
								<!--<div class="pull-right hidden-xs hidden-sm" style="margin-right: 3px; position: relative">
                                    <a class="btn btn-lg btn-success btn-cart" href="#" style="padding:6px 13px; margin-top:-4px;">
                                        <span class="pull-left" style="text-transform: uppercase;margin-right:3px;">Giỏ hàng</span>
                                        <span class="pull-left ng-binding ng-hide" style="text-transform: uppercase;margin-right:3px;"></span>
                                        <span class="pull-right" style="padding-left: 2px;">
                                            <img src="Images/img_cart.png" height="25">
                                        </span>
                                        <span class="badge pull-right ng-binding" style="color:white;background:red">0</span>
                                    </a>
                                </div>-->
							</div>
							<div class="clearfix"></div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<!--Thông tin phòng đơn-->
		<div class="panel-group" id="accordion">
			<!--Thông tin phòng chi tiết-->
			<div class="collapse" id="collapse1" style="padding-bottom: 10px">
				<div class="panel-body">
					<div class="col-sm-6" style="padding-top: 8px;">
						<div id="myCarousel1" class="carousel slide" data-ride="carousel">
							<!-- Indicators -->
							<ol class="carousel-indicators">
								<li data-target="#myCarousel1" data-slide-to="0" class="active"></li>
								<li data-target="#myCarousel1" data-slide-to="1"></li>
							</ol>

							<!-- Wrapper for slides -->
							<div class="carousel-inner">
								<div class="item active">
									<img src="./Images/roomdonzoom.jpg" alt="Phòng đơn"
										style="width: 100%;">
								</div>

								<div class="item">
									<img src="./Images/roomdon2zoom.jpg" alt="Phòng đơn1"
										style="width: 100%;">
								</div>
							</div>

							<!-- Left and right controls -->
							<a class="left carousel-control" href="#myCarousel1"
								data-slide="prev"> <span
								class="glyphicon glyphicon-chevron-left"></span> <span
								class="sr-only">Previous</span>
							</a> <a class="right carousel-control" href="#myCarousel1"
								data-slide="next"> <span
								class="glyphicon glyphicon-chevron-right"></span> <span
								class="sr-only">Next</span>
							</a>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="hidden-xs">
							<div class="pull-right glyphicon glyphicon-remove x-icon"></div>
							<div style="padding: 0 5px 0 5px;">
								<strong>Phòng đơn</strong> <span>giá chỉ từ<strong
									style="color: #0283df">&nbsp;500&nbsp;USD</strong></span>
							</div>
						</div>
						<div class="x-content hidden-xs x-detail">
							<div style="padding: 10px 5px;">Kích thước phòng 28 m2,
								thiết kế thanh lịch, phong cách với nội thất bằng gỗ tối màu.
								Tất cả các phòng đều có cửa sổ giúp khách hàng thư giãn với một
								bầu không khí trong lành.</div>
							<div style="padding: 0 5px 10px 5px;" class="hidden-xs  clearfix">
								<div>
									<b>Tiện nghi phòng</b>
								</div>
								<ul>
									<li class="col-md-6 ng-scope ng-binding">Máy điều hòa</li>
									<li class="col-md-6 ng-scope ng-binding">Bồn tắm</li>
									<li class="col-md-6 ng-scope ng-binding">Tivi truyền hình
										cáp</li>
									<li class="col-md-6 ng-scope ng-binding">Bộ bàn ghế</li>
									<li class="col-md-6 ng-scope ng-binding">Thẻ chìa khóa
										điện tử</li>
									<li class="col-md-6 ng-scope ng-binding">Điện thoại bàn</li>
									<li class="col-md-6 ng-scope ng-binding">Tủ lạnh</li>
									<li class="col-md-6 ng-scope ng-binding">Wifi</li>
									<li class="col-md-6 ng-scope ng-binding">Phòng không hút
										thuốc</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!--Thông tin phòng còn trống-->
			<div class="row pdon1" id="pdon1" style="">
				<div class="col-md-3 col-sm-3 hidden-xs hidden-sm" id="infodon1">
					<img src="./Images/roomdon.jpg" style="width: 100%" alt="Phong don"
						data-toggle="collapse" data-target="#collapse1" />
					<div class="bottom-right">
						<img src="./Images/img_zoom.png" />
					</div>
				</div>
				<div class="col-md-9">
					<div class="panel panel-default hidden-xs">
						<div class="panel-heading">
							<i class="fa fa-times-circle pull-left" id="btnhide1"
								style="font-size: 39px; color: red"></i> <strong
								class="pull-left">Phòng đơn</strong><br /> <strong
								style="color: red">Hết phòng</strong>
						</div>
						<div style="padding: 0 17px">
							<button class="pull-right btn btn-default btn-lg btn-cart"
								style="margin: 10px" disabled>Hết phòng</button>
						</div>
					</div>
				</div>
			</div>

			<!--Thông tin phòng còn trống-->
			<div class="row pdon2" id="pdon2" style="">
				<div class="col-md-3 col-sm-3 hidden-xs hidden-sm" id="infodon2">
					<img src="./Images/roomdon.jpg" style="width: 100%" alt="Phong don"
						data-toggle="collapse" data-target="#collapse1" />
					<div class="bottom-right">
						<img src="./Images/img_zoom.png" />
					</div>
				</div>
				<div class="col-md-9">
					<div class="panel panel-default hidden-xs">
						<div class="panel-heading pnl1">
							<i class="fa fa-check-circle pull-left" id="btnhide1"
								style="font-size: 39px; color: green"></i> <strong
								class="pull-left">Phòng đơn</strong><br /> Giá chỉ từ <strong
								style="color: #0283df">500 USD</strong> - <strong style="color: red" id="spcl1"></strong>
														
						</div>
						<div style="padding: 0 17px">
							<button
								class="pull-right btn btn-success btn-lg btn-cart add-to-cart"
								id="q1" data-name="Phòng đơn" data-price="500"
								style="margin: 10px" field="quantity1">Đặt phòng</button>
							<span class="pull-right" style="padding: 5px 50px 0 0">Số
								phòng</span><br />
							<div style="margin: 10px" id="bo1">
								<i class="fa fa-angle-right" aria-hidden="true"
									style="font-size: 12px; color: red"></i> <strong
									style="color: red; font-size: 12px"><i> Thanh toán
										trước 10% tiền thuê phòng</i></strong> <span
									style="text-align: center; padding-left: 100px" id="spdtd1"></span>
									 <input type="button" value="-"
									class="qtyminus1 btn btn-sm btn-spinner" field="quantity1"
									style="margin-left: 25px" /> <input type="text"
									name="quantity1" id="sl1" value="1" class="qty"
									style="width: 35px; text-align: center" readonly /> <input id=""
									type="button" value="+" class="qtyplus1 btn btn-sm btn-spinner"
									field="quantity1" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!--Thông tin phòng đôi-->
		<div class="panel-group" id="accordion">
			<!--Thông tin phòng chi tiết-->
			<div class="collapse" id="collapse2" style="padding-bottom: 10px">
				<div class="panel-body">
					<div class="col-sm-6" style="padding-top: 8px;">
						<div id="myCarousel2" class="carousel slide" data-ride="carousel">
							<!-- Indicators -->
							<ol class="carousel-indicators">
								<li data-target="#myCarousel2" data-slide-to="0" class="active"></li>
								<li data-target="#myCarousel2" data-slide-to="1"></li>
							</ol>

							<!-- Wrapper for slides -->
							<div class="carousel-inner">
								<div class="item active">
									<img src="./Images/roomdonzoom.jpg" alt="Phòng đôi"
										style="width: 100%;">
								</div>

								<div class="item">
									<img src="./Images/roomdon2zoom.jpg" alt="Phòng đôi1"
										style="width: 100%;">
								</div>
							</div>

							<!-- Left and right controls -->
							<a class="left carousel-control" href="#myCarousel2"
								data-slide="prev"> <span
								class="glyphicon glyphicon-chevron-left"></span> <span
								class="sr-only">Previous</span>
							</a> <a class="right carousel-control" href="#myCarousel2"
								data-slide="next"> <span
								class="glyphicon glyphicon-chevron-right"></span> <span
								class="sr-only">Next</span>
							</a>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="hidden-xs">
							<div class="pull-right glyphicon glyphicon-remove x-icon"></div>
							<div style="padding: 0 5px 0 5px;">
								<strong>Phòng đôi</strong> <span>giá chỉ từ<strong
									style="color: #0283df">&nbsp;700&nbsp;USD</strong></span>
							</div>
						</div>
						<div class="x-content hidden-xs x-detail">
							<div style="padding: 10px 5px;">Kích thước phòng 36 m2,
								thiết kế thanh lịch, phong cách với nội thất bằng gỗ tối màu.
								Tất cả các phòng đều có cửa sổ giúp khách hàng thư giãn với một
								bầu không khí trong lành.</div>
							<div style="padding: 0 5px 10px 5px;" class="hidden-xs  clearfix">
								<div>
									<b>Tiện nghi phòng</b>
								</div>
								<ul>
									<li class="col-md-6 ng-scope ng-binding">Máy điều hòa</li>
									<li class="col-md-6 ng-scope ng-binding">Bồn tắm</li>
									<li class="col-md-6 ng-scope ng-binding">Tivi truyền hình
										cáp</li>
									<li class="col-md-6 ng-scope ng-binding">Bộ bàn ghế</li>
									<li class="col-md-6 ng-scope ng-binding">Thẻ chìa khóa
										điện tử</li>
									<li class="col-md-6 ng-scope ng-binding">Điện thoại bàn</li>
									<li class="col-md-6 ng-scope ng-binding">Tủ lạnh</li>
									<li class="col-md-6 ng-scope ng-binding">Wifi</li>
									<li class="col-md-6 ng-scope ng-binding">Phòng không hút
										thuốc</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!--Thông tin phòng còn trống-->
			<div class="row pdoi1" id="pdoi1" style="">
				<div class="col-md-3 col-sm-3 hidden-xs hidden-sm" id="infodoi1">
					<img src="./Images/roomdon.jpg" style="width: 100%" alt="Phong doi"
						data-toggle="collapse" data-target="#collapse2" />
					<div class="bottom-right">
						<img src="./Images/img_zoom.png" />
					</div>
				</div>
				<div class="col-md-9">
					<div class="panel panel-default hidden-xs">
						<div class="panel-heading">
							<i class="fa fa-times-circle pull-left" id="btnhide2"
								style="font-size: 39px; color: red"></i> <strong
								class="pull-left">Phòng đôi</strong><br /> <strong
								style="color: red">Hết phòng</strong>
						</div>
						<div style="padding: 0 17px">
							<button class="pull-right btn btn-default btn-lg btn-cart"
								style="margin: 10px" disabled>Hết phòng</button>
						</div>
					</div>
				</div>
			</div>

			<!--Thông tin phòng còn trống-->
			<div class="row pdoi2" id="pdoi2" style="">
				<div class="col-md-3 col-sm-3 hidden-xs hidden-sm" id="infodoi2">
					<img src="./Images/roomdon.jpg" style="width: 100%" alt="Phong doi"
						data-toggle="collapse" data-target="#collapse2" />
					<div class="bottom-right">
						<img src="./Images/img_zoom.png" />
					</div>
				</div>
				<div class="col-md-9">
					<div class="panel panel-default hidden-xs">
						<div class="panel-heading pnl1">
							<i class="fa fa-check-circle pull-left" id="btnhide2"
								style="font-size: 39px; color: green"></i> <strong
								class="pull-left">Phòng đôi</strong><br /> Giá chỉ từ <strong
								style="color: #0283df">700 USD</strong> - <strong style="color: red" id="spcl2"></strong>
						</div>
						<div style="padding: 0 17px">
							<button
								class="pull-right btn btn-success btn-lg btn-cart add-to-cart"
								id="q2" data-name="Phòng đôi" data-price="700"
								style="margin: 10px" field="quantity2">Đặt phòng</button>
							<span class="pull-right" style="padding: 5px 50px 0 0">Số
								phòng</span><br />
							<div style="margin: 10px">
								<i class="fa fa-angle-right" aria-hidden="true"
									style="font-size: 12px; color: red"></i> <strong
									style="color: red; font-size: 12px"><i> Thanh toán
										trước 10% tiền thuê phòng</i></strong> <span
									style="text-align: center; padding-left: 100px" id="spdtd2"></span> <input type="button" value="-"
									class="qtyminus2 btn btn-sm btn-spinner" field="quantity2"
									style="margin-left: 25px" /> <input type="text"
									name="quantity2" id="sl2" value="1" class="qty"
									style="width: 35px; text-align: center" /> <input name=""
									type="button" value="+" class="qtyplus2 btn btn-sm btn-spinner" id="plus2" 
									field="quantity2" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!--Thông tin phòng tập thể-->
		<div class="panel-group" id="accordion">
			<!--Thông tin phòng chi tiết-->
			<div class="collapse" id="collapse3" style="padding-bottom: 10px">
				<div class="panel-body">
					<div class="col-sm-6" style="padding-top: 8px;">
						<div id="myCarousel3" class="carousel slide" data-ride="carousel">
							<!-- Indicators -->
							<ol class="carousel-indicators">
								<li data-target="#myCarousel3" data-slide-to="0" class="active"></li>
								<li data-target="#myCarousel3" data-slide-to="1"></li>
							</ol>

							<!-- Wrapper for slides -->
							<div class="carousel-inner">
								<div class="item active">
									<img src="./Images/roomttzoom.jpg" alt="Phòng tt"
										style="width: 100%;">
								</div>

								<div class="item">
									<img src="./Images/roomttzoom.jpg" alt="Phòng tt"
										style="width: 100%;">
								</div>
							</div>

							<!-- Left and right controls -->
							<a class="left carousel-control" href="#myCarousel3"
								data-slide="prev"> <span
								class="glyphicon glyphicon-chevron-left"></span> <span
								class="sr-only">Previous</span>
							</a> <a class="right carousel-control" href="#myCarousel3"
								data-slide="next"> <span
								class="glyphicon glyphicon-chevron-right"></span> <span
								class="sr-only">Next</span>
							</a>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="hidden-xs">
							<div class="pull-right glyphicon glyphicon-remove x-icon"></div>
							<div style="padding: 0 5px 0 5px;">
								<strong>Phòng tập thể</strong> <span>giá chỉ từ<strong
									style="color: #0283df">&nbsp;1200&nbsp;USD</strong></span>
							</div>
						</div>
						<div class="x-content hidden-xs x-detail">
							<div style="padding: 10px 5px;">Kích thước phòng 48 m2,
								thiết kế thanh lịch, phong cách với nội thất bằng gỗ tối màu.
								Tất cả các phòng đều có cửa sổ giúp khách hàng thư giãn với một
								bầu không khí trong lành.</div>
							<div style="padding: 0 5px 10px 5px;" class="hidden-xs  clearfix">
								<div>
									<b>Tiện nghi phòng</b>
								</div>
								<ul>
									<li class="col-md-6 ng-scope ng-binding">Máy điều hòa</li>
									<li class="col-md-6 ng-scope ng-binding">Bồn tắm</li>
									<li class="col-md-6 ng-scope ng-binding">Tivi truyền hình
										cáp</li>
									<li class="col-md-6 ng-scope ng-binding">Bộ bàn ghế</li>
									<li class="col-md-6 ng-scope ng-binding">Thẻ chìa khóa
										điện tử</li>
									<li class="col-md-6 ng-scope ng-binding">Điện thoại bàn</li>
									<li class="col-md-6 ng-scope ng-binding">Tủ lạnh</li>
									<li class="col-md-6 ng-scope ng-binding">Wifi</li>
									<li class="col-md-6 ng-scope ng-binding">Phòng không hút
										thuốc</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!--Thông tin phòng còn trống-->
			<div class="row ptt1" id="ptt1" style="">
				<div class="col-md-3 col-sm-3 hidden-xs hidden-sm" id="infott1">
					<img src="./Images/roomtt.jpg" style="width: 100%" alt="Phong tt"
						data-toggle="collapse" data-target="#collapse3" />
					<div class="bottom-right">
						<img src="./Images/img_zoom.png" />
					</div>
				</div>
				<div class="col-md-9">
					<div class="panel panel-default hidden-xs">
						<div class="panel-heading">
							<i class="fa fa-times-circle pull-left" id="btnhide3"
								style="font-size: 39px; color: red"></i> <strong
								class="pull-left">Phòng tập thể</strong><br /> <strong
								style="color: red">Hết phòng</strong>
						</div>
						<div style="padding: 0 17px">
							<button class="pull-right btn btn-default btn-lg btn-cart"
								style="margin: 10px" disabled>Hết phòng</button>
						</div>
					</div>
				</div>
			</div>

			<!--Thông tin phòng còn trống-->
			<div class="row ptt2" id="ptt2" style="">
				<div class="col-md-3 col-sm-3 hidden-xs hidden-sm" id="infott2">
					<img src="./Images/roomtt.jpg" style="width: 100%" alt="Phong tt"
						data-toggle="collapse" data-target="#collapse3" />
					<div class="bottom-right">
						<img src="./Images/img_zoom.png" />
					</div>
				</div>
				<div class="col-md-9">
					<div class="panel panel-default hidden-xs">
						<div class="panel-heading">
							<i class="fa fa-check-circle pull-left" id="btnhide3"
								style="font-size: 39px; color: green"></i> <strong
								class="pull-left">Phòng tập thể</strong><br /> Giá chỉ từ <strong
								style="color: #0283df">1200 USD</strong> - <strong style="color: red" id="spcl3"></strong>
						</div>
						<div style="padding: 0 17px">
							<button
								class="pull-right btn btn-success btn-lg btn-cart add-to-cart"
								id="q3" data-name="Phòng tập thể" data-price="1200"
								style="margin: 10px" field="quantity3">Đặt phòng</button>
							<span class="pull-right" style="padding: 5px 50px 0 0">Số
								phòng</span><br />
							<div style="margin: 10px">
								<i class="fa fa-angle-right" aria-hidden="true"
									style="font-size: 12px; color: red"></i> <strong
									style="color: red; font-size: 12px"><i> Thanh toán
										trước 10% tiền thuê phòng</i></strong> <span
									style="text-align: center; padding-left: 100px" id="spdtd3"></span> <input type="button" value="-"
									class="qtyminus3 btn btn-sm btn-spinner" field="quantity3"
									style="margin-left: 25px" /> <input type="text"
									name="quantity3" id="sl3" value="1" class="qty"
									style="width: 35px; text-align: center" /> <input name=""
									type="button" value="+" class="qtyplus3 btn btn-sm btn-spinner" id="plus3"  
									field="quantity3" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!--Giỏ hàng-->
		<div class="panel-group" id="tablephong">
			<h4 style="color: #0d875c; margin-left: 10px">
				<strong><u>Giỏ hàng:</u></strong>
			</h4>
			<table class="table table-striped" id="table-products">
				<thead>
					<tr>
						<th>Loại phòng</th>
						<th>Đơn giá/ngày</th>
						<th>Số lượng</th>
						<th>Ngày nhận phòng</th>
						<th>Ngày trả phòng</th>
						<th>Thành tiền (USD)</th>
					</tr>
				</thead>
				<tbody id="tbodyid"></tbody>
			</table>
		</div>
		<br />
		<form class="myform" action="datphong-thongtinKD.jsp">
			<input type="submit" class="pull-right btn btn-main btn-lg"
				id="btnxacnhan" value="Xác nhận đặt phòng">
			<h3 style="text-align: center">
				<u>Tổng tiền cần phải trả (USD):</u><strong class="tongtien"> 0</strong>
			</h3>
		</form>
	</div>
</body>
</html>

<!-- <script>
	function deleteRow(r) {
		var i = r.parentNode.parentNode.rowIndex;
		document.getElementById("table-products").deleteRow(i);
		var rows = document.getElementById("table-products")
				.getElementsByTagName("tbody")[0].getElementsByTagName("tr").length;
		if (rows == 0) {
			$(':input[type="submit"]').prop('disabled', true); //Không có đặt phòng thì Disable button xác nhận
		}
	}
</script> -->
<!--<script>
    // Định nghĩa một mảng các phần tử sẽ bỏ vào giỏ hàng
    var shoppingCartItems = [];
    //Reset lại table đặt phòng
    sessionStorage["shopping-cart-items"] = JSON.stringify(shoppingCartItems);
    $("#table-products > tbody").html("");

    $(document).ready(function () {
        // Kiểm tra nếu đã có sessionStorage["shopping-cart-items"] hay chưa?
        if (sessionStorage["shopping-cart-items"] != null) {
        shoppingCartItems = JSON.parse(sessionStorage["shopping-cart-items"].toString());
    }

        // Hiển thị thông tin từ giỏ hàng
        displayShoppingCartItems();
    });


    // Sự kiện click các button có class=".add-to-cart"
    $(".add-to-cart").click(function () {
        var button = $(this); // Lấy đối tượng button mà người dùng click
        var id = button.attr("id"); // id của sản phẩm là id của button
        var name = button.attr("data-name"); // name của sản phẩm là thuộc tính data-name của button
        var price = button.attr("data-price"); // price của sản phẩm là thuộc tính data-price của button

        // Số lượng phòng
        fieldName = button.attr('field');
        // Get its current value
        var quantity = parseInt($('input[name=' + fieldName + ']').val());
        if (quantity > 0) {
            var item = {
                name: name,
                price: price,
                quantity: quantity
            };
            shoppingCartItems.push(item);
            // Lưu thông tin vào sessionStorage
            sessionStorage["shopping-cart-items"] = JSON.stringify(shoppingCartItems); // Chuyển thông tin mảng shoppingCartItems sang JSON trước khi lưu vào sessionStorage
            // Gọi hàm hiển thị giỏ hàng
            displayShoppingCartItems();
        }
    });

    // Xóa hết giỏ hàng shoppingCartItems
    $("#button-clear").click(function () {
        shoppingCartItems = [];
    sessionStorage["shopping-cart-items"] = JSON.stringify(shoppingCartItems);
        $("#table-products > tbody").html("");
    });


    // Hiển thị giỏ hàng ra table
    function displayShoppingCartItems() {
        if (sessionStorage["shopping-cart-items"] != null) {
        shoppingCartItems = JSON.parse(sessionStorage["shopping-cart-items"].toString()); // Chuyển thông tin từ JSON trong sessionStorage sang mảng shoppingCartItems.

    $("#table-products > tbody").html("");
            // Duyệt qua mảng shoppingCartItems để append từng item dòng vào table
            $.each(shoppingCartItems, function (index, item) {
                var htmlString = "";
                htmlString += "<tr>";
                htmlString += "<td>" + item.name + "</td>";
                htmlString += "<td>" + item.price + "</td>";
                htmlString += "<td>" + item.quantity + "</td>";
                htmlString += "<td>" + item.price * item.quantity + "</td>";
                htmlString += "<td>" +'<a class="delete-row" onclick="deleteRow(this)">Hủy</a>'+"</td>";
                htmlString += "</tr>";

                $("#table-products > tbody:last").append(htmlString);

            });
        }
    }

    function deleteRow(r) {
        var i = r.parentNode.parentNode.rowIndex;
        document.getElementById("table-products").deleteRow(i);
    }
</script>-->