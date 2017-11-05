<%@page import="javafx.scene.control.Alert"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8" />
    <title>Đặt phòng thành công</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <script src="./JS/jquery-3.2.1.min.js"></script>
    <script src="./JS/bootstrap.min.js"></script>

    <link rel="stylesheet" href="./CSS/bootstrap.min.css" />
    <link rel="stylesheet" href="./CSS/font-awesome.min.css">
    <!-- My CSS-->
    <!-- My JS -->
    <script src="./JS/datphong-thanhcong.js"></script>
</head>
<body style="font-family:'Times New Roman';padding: 20px">
    <!-- HEADER -->
    <div class="container" style="text-align:center">
        <img src="./Images/logo-hotel.png" alt="logo" class="logo">
    </div><br />

    <div class="container" style="border:2px solid beige">
    	<h1 style="text-align:center"><strong>Chúc mừng bạn đã đặt phòng thành công!</strong></h1>
    	<h3 class="makhachdat"><u>Mã khách đặt của bạn là:</u><span style="color:red">&nbsp;&nbsp;<%=getServletContext().getAttribute("maKD") %></span><i style="color:red; font-size:17px">&nbsp;&nbsp;(Khi đến nhận phòng vui lòng đọc mã khách đặt hoặc CMND)</i></h3><br/>
    	<div>
    		<table class="table table" id="table-products" style="font-size:25px">
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
          </div><br/>
          <h4><strong><u>TỔNG CỘNG:</u><span id="tongtien"></span></strong></h4><br/>
          <i style="color:red; font-size:19px">Vui lòng đến nhận phòng đúng ngày đã đặt</i><br/>
          <h3 style="text-align:center">Chân thành cảm ơn quý khách!</h3>
    </div>
  
</body>
</html>