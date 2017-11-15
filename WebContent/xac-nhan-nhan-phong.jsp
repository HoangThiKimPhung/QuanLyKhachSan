<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import="java.util.List" %>
<%@ page import="model.ThongTinKhachDat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Xác nhận nhận phòng</title>
    <meta charset="UTF-8">
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
    <link rel="stylesheet" href="./CSS/them-don-dat-phong.css" />
    <!-- MY JS -->
    <script src="./JS/include-html.js"></script>
    <script src="./JS/xac-nhan-nhan-phong.js"></script>
</head>
<body>
    <!-- HEADER -->
    <header id="header"></header>

    <!-- MENU-LEFT -->
    <section id="menu"> </section>

    <!-- CONTENT -->
    <section class="phan-noi-dung">
        <h4>XÁC NHẬN NHẬN PHÒNG</h4>
        <!-- Thông tin khách đặt -->
        <%
        	List<ThongTinKhachDat> thongTinKDCu=(List<ThongTinKhachDat>)getServletContext().getAttribute("thongTinKDCu");

        	if(thongTinKDCu!=null)
        	{
        		getServletContext().removeAttribute("thongTinKDCu");
        	}
        %>
        <fieldset>
            <p style="font-weight: bold; text-decoration: underline">Thông tin khách đặt: </p>
            <div class="col-xs-12 col-sm-12 col-md-12">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="control-label col-xs-12 col-sm-4 col-md-2">Mã KH:</label>
                        <div class="col-xs-12 col-sm-8 col-md-4">
                            <input type="text" class="form-control" id="maKH" readonly>
                        </div>
                        <label class="control-label col-xs-12 col-sm-4 col-md-2">Họ tên:</label>
                        <div class="col-xs-12 col-sm-8 col-md-4">
                            <input type="text" class="form-control" id="hotenKH"
                            	value="<%= thongTinKDCu.get(0).getHoTenKD()%>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-12 col-sm-4 col-md-2">CMND:</label>
                        <div class="col-xs-12 col-sm-8 col-md-4">
                            <input type="text" class="form-control" id="CMND"
                            	value="<%= thongTinKDCu.get(0).getCMND()%>">
                        </div>
                        <label class="control-label col-xs-12 col-sm-4 col-md-2">SĐT:</label>
                        <div class="col-xs-12 col-sm-8 col-md-4">
                            <input type="text" class="form-control" id="SDT"
                            	value="<%= thongTinKDCu.get(0).getSDT()%>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-12 col-sm-4 col-md-2">Quốc tịch:</label>
                        <div class="col-xs-12 col-sm-8 col-md-4">
                            <input type="text" class="form-control" id="QuocTich"
                            	value="<%= thongTinKDCu.get(0).getQuocTich()%>">
                        </div>
                        <label class="control-label col-xs-12 col-sm-4 col-md-2">Địa chỉ:</label>
                        <div class="col-xs-12 col-sm-8 col-md-4">
                            <input type="text" class="form-control" id="DiaChi"
                            	value="<%= thongTinKDCu.get(0).getDiaChi()%>">
                        </div>
                    </div>
                </form>
                <div class="input-group-btn">
	                <button id="luu-thong-tin-KH"  class="btn btn-default">
	                    Lưu <i class="glyphicon glyphicon-ok"></i>
	                </button> 
	            </div>
            </div>
        </fieldset>

        <hr />
        <!-- Thông tin đặt phòng -->
        <fieldset>
            <p style="font-weight: bold; text-decoration: underline">Thông tin đặt phòng: </p>
            <div class="table-responsive">
                <table class="table" id="table-thong-tin-dat-phong">
                    <thead>
                        <tr>
                            <th>Loại phòng </th>
                            <th>Mã phòng</th>
                            <th>Ngày nhận phòng</th>
                            <th>Ngày trả phòng</th>
                            <th>Tiền phòng (USD)</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
			<div class="sumtien">
				<u><strong>Tổng tiền phòng (USD)</strong></u><span class="tongtien" style="font-weight: bold"></span>
			</div>
        </fieldset>
        
        <hr />
        <!-- Xác nhận thuê phòng -->
        <fieldset>
            <p style="font-weight: bold; text-decoration: underline">Xác nhận thuê phòng: </p>
            <div class="table-responsive">
                <table class="table" id="table-xac-nhan-thue-phong">
                    <thead>
                        <tr>
                            <th>Loại phòng </th>
                            <th>Mã phòng</th>
                            <th>Ngày nhận phòng</th>
                            <th>Ngày trả phòng</th>
                            <th>Tiền phòng (USD)</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
            <div class="input-group-btn">
            	<button id="chap-nhan-thue-phong" class="btn btn-default">
                    Xác nhận thuê phòng
                 </button>
            </div>
        </fieldset>
    </section>
</body>
</html>