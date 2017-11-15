<%@page import="model.ThongTinDatPhong_NV"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.ThongTinThuePhong"%>
<%@ page import="model.ThongTinDatPhong_NV" %>
<%@ page import="java.util.List"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Trang của nhân viên</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge,chrome=1">
<!-- Boostrap-->
<link rel="stylesheet" href="./CSS/bootstrap.min.css">
<script src="./JS/jquery-3.2.1.min.js"></script>
<script src="./JS/bootstrap.min.js"></script>
<!-- Glyphicons -->
<link rel="stylesheet" href="./CSS/font-awesome.min.css">
<!-- CSS -->
<link rel="stylesheet" href="./CSS/w3.css">
<!-- MY CSS -->
<link rel="stylesheet" href="./CSS/header-menu-footer.css" />
<link rel="stylesheet" href="./CSS/nhanvien.css" />
<!-- MY JS -->
<script src="./JS/include-html.js"></script>
</head>
<body>
	<!-- HEADER -->
	<header id="header"></header>

	<!-- MENU-LEFT -->
	<section id="menu"> </section>


	<!-- Hủy danh sách thuê phòng tạm thời sau khi giao dịch thuê phòng thành công -->
	<%
		List<ThongTinThuePhong> thongtinThuePhongTamThoi = (List<ThongTinThuePhong>) request.getSession()
				.getAttribute("thongtinThuePhongTamThoi");
		if (thongtinThuePhongTamThoi != null)
			request.getSession().removeAttribute("thongtinThuePhongTamThoi");
	%>
	<!-- Hủy danh sách đặt phòng của khách đặt khi khách nhận phòng -->
	<%
		List<ThongTinDatPhong_NV> thongtinDatPhong_NV = (List<ThongTinDatPhong_NV>) getServletContext()
				.getAttribute("thongtinDatPhong_NV");
		if (thongtinDatPhong_NV != null)
			getServletContext().removeAttribute("thongtinDatPhong_NV");
	%>
	<!-- Xóa mã code đặt phòng khi khách đã nhận phòng -->
	<%
		String maCodeDatPhong = (String)getServletContext().getAttribute("maCodeDatPhong");
		if(maCodeDatPhong!=null){
			getServletContext().removeAttribute("maCodeDatPhong");
		}
	%>
	<%
		List<ThongTinDatPhong_NV> thongtinDatPhongTamThoi = (List<ThongTinDatPhong_NV>) request.getSession()
				.getAttribute("thongtinDatPhongTamThoi");
		if (thongtinDatPhongTamThoi != null)
			request.getSession().removeAttribute("thongtinDatPhongTamThoi");
	%>

	<!-- CONTENT -->
	<section class="phan-noi-dung">
	<div class="row">
		<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6">
			<div class="div-square">
				<a href="tim-phong.jsp"> <i class="glyphicon glyphicon-search"></i>
					<h4>Tìm phòng</h4>
				</a>
			</div>
		</div>
		<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6">
			<div class="div-square">
				<a href="tim-phong.jsp"> <i class="glyphicon glyphicon-edit"></i>
					<h4>Đặt phòng</h4>
				</a>
			</div>
		</div>
		<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6">
			<div class="div-square">
				<a href="tim-phong.jsp"> <i class="glyphicon glyphicon-check"></i>
					<h4>Thuê phòng</h4>
				</a>
			</div>
		</div>
		<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6">
			<div class="div-square">
				<a href="#"> <i class="fa fa-money"></i>
					<h4>Lập hóa đơn</h4>
				</a>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6">
			<div class="div-square">
				<a href="tra-cuu-khach-dat.jsp"> <i
					class="glyphicon glyphicon-user"></i>
					<h4>Tra cứu khách đặt</h4>
				</a>
			</div>
		</div>
		<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6">
			<div class="div-square">
				<a href="tra-cuu-khach-hang.jsp"> <i class="fa fa-user-circle"></i>
					<h4>Tra cứu khách hàng</h4>
				</a>
			</div>
		</div>
		<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6">
			<div class="div-square">
				<a href="tra-cuu-dich-vu.jsp"> <i class="fa fa-shopping-bag"></i>
					<h4>Tra cứu dịch vụ</h4>
				</a>
			</div>
		</div>
		<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6">
			<div class="div-square">
				<a href="tra-cuu-phong.jsp"> <i class="glyphicon glyphicon-bed"></i>
					<h4>Tra cứu phòng</h4>
				</a>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6">
			<div class="div-square">
				<a href="#"> <i class="glyphicon glyphicon-shopping-cart"></i>
					<h4>Đền bù vật tư</h4>
				</a>
			</div>
		</div>
		<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6">
			<div class="div-square">
				<a href="#"> <i class="glyphicon glyphicon-list-alt"></i>
					<h4>Thống kê phòng</h4>
				</a>
			</div>
		</div>
		<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6">
			<div class="div-square">
				<a href="#"> <i class="glyphicon glyphicon-list-alt"></i>
					<h4>Thống kê dịch vụ</h4>
				</a>
			</div>
		</div>
		<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6">
			<div class="div-square">
				<a href="#"> <i class="glyphicon glyphicon-list-alt"></i>
					<h4>Thống kê vật tư</h4>
				</a>
			</div>
		</div>
	</div>
	</section>

	<!-- FOOTER -->

</body>
</html>