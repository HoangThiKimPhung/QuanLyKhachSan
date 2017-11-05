<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8" />
    <title>Angel Hotel</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <link rel="stylesheet" href="./CSS/bootstrap.min.css">
    <link rel="stylesheet" href="./CSS/font-awesome.min.css">

    <script src="./JS/jquery-3.2.1.min.js"></script>
    <script src="./JS/bootstrap.min1.js"></script>

    <!--My CSS-->
    <link rel="stylesheet" href="./CSS/dangnhap.css">
    <link rel="stylesheet" href="./CSS/trangchu.css">
	<!-- Hello -->
    <!--My JS-->
    <script src="./JS/index.js"></script>
</head>
<body>
    <center>
        <div id="wrap">
            <div class="subMenu" style="position: absolute;top: 0px;">
                <div class="container">
                    <nav class="navbar navbar-default" role="navigation">
                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <a><img class="logo " src="./Images/logoks.png" alt="Angel Hotel"></a>
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <div class="navigation">
                                <ul class="nav navbar-nav navbar-left">
                                    <li><a href="#home" style="font-family:'avant_garde', sans-serif">TRANG CHỦ</a> </li>
                                    <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                                    <li><a href="#room">PHÒNG</a></li>
                                    <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                                    <li><a href="#portfolio">DỊCH VỤ</a></li>
                                </ul>
                                <ul class="nav navbar-nav navbar-right ">
                                    <li><a href="#contact" style="font-family:'avant_garde', sans-serif">LIÊN HỆ</a> </li>
                                    <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                                    <li><a href="login.jsp">ĐĂNG NHẬP</a></li>
                                    <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                                </ul>
                            </div>
                        </div>
                    </nav>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </center>

    <!--Banner-->
    <div id="home">
        <img src="./Images/banner.jpg" alt="Angel Hotel" style="height:700px" />
        <div class="hero-image">
            <div class="hero-text" style="margin:0">
                <h1 style="font-size:120px;color:white;">A N G E L</h1>
                <h3 style="font-family:'Brush Script MT';font-size:110px;">Hotel</h3>
                <a href="#container1" id="book1">Đặt phòng </a><span style="display:none;color:lightgray" id="hide1"> >></span>
            </div>
        </div>
    </div>

    <!--Reservation-->
    <div class="container" id="container1">
        <div class="row" style="margin:20px 50px">
            <div class="col-xs-12 col-sm-5 col-md-5">
                <div class="embed-responsive embed-responsive-16by9 wowload fadeInLeft">
                    <video style="width:100%" autoplay muted loop>
                        <source src="./Images/VideoHotel.mp4" type="video/mp4"> Your browser does not support the video tag.
                    </video>
                </div>
            </div><br>

            <div class="col-xs-12 col-sm-5 col-md-5">
                <h2 class="datphong" style="color:#0d875c">Đặt phòng</h2>
                <form role="form" class="wowload fadeInRight" action="KD_TimPhong" method="GET">
                    <div class="form-group">
                        <div class="col-sm-6" style="line-height: 35px">
                            Ngày nhận phòng: <input type="date" class="form-control" id="ngaynhanphong" name="ngaynhanphong"
                           					<%
			                        		if(getServletContext().getAttribute("ngaynhanphong") == null)
			                        		{
			                        			Date date = new Date();                        			  
			                        			String strDateFormat = "yyyy-MM-dd";                        			  
			                        			SimpleDateFormat simpleDateFormat = new SimpleDateFormat(strDateFormat);
				                        	%>
				                        		value= "<%=simpleDateFormat.format(date)%>"
				                        	<%
				                        		}
				                        		else
				                        		{
				                        	%>	                        
				                        		value= "<%=getServletContext().getAttribute("ngaynhanphong")%>"
				                        	<%
				                        		}
				                        	%>  
                            				 ><br>
                        </div>
                        <div class="col-sm-6" style="line-height: 35px">
                            Ngày trả phòng: <input type="date" class="form-control" id="ngaytraphong" name="ngaytraphong" 
                            				<%
			                        		if(getServletContext().getAttribute("ngaytraphong") == null)
			                        		{
			                        			Date date = new Date(new Date().getTime() + 60*60*24*1000);                        			  
			                        			String strDateFormat = "yyyy-MM-dd";                        			  
			                        			SimpleDateFormat simpleDateFormat = new SimpleDateFormat(strDateFormat);
				                        	%>
				                        		value= "<%=simpleDateFormat.format(date)%>"
				                        	<%
				                        		}
				                        		else
				                        		{
				                        	%>	                        
				                        		value= "<%=getServletContext().getAttribute("ngaytraphong")%>"
				                        	<%
				                        		}
				                        	%>  
                            				><br>
                        </div>
                    </div>
                    <div class="col-sm-4" style="float:right">
                        <button class="btn w3-button" type="submit" id="btntimphong">Tìm phòng</button>
                    </div>
                </form>
            </div>
        </div>
    </div><br>
    <div class="container"><hr style="font-size:15px" /></div>

    <!--Rooms-->
    <div class="container" style="padding: 0px 50px;" id="room">
        <h2 style="text-align: center;color: #0d875c">P H Ò N G</h2>
        <h4 style="text-align: center; font-size: 30px;color: #0d875c">__</h4><br>
        <div class="col-sm-5" style="padding: 70px 25px 25px 25px; text-align: center">
            <p>
                Những căn phòng đạt chất lượng 5 sao với đầy đủ tiện nghi, phòng rộng rãi, thoáng mát, chăn ấm, nệm êm, ánh đèn
                lung linh huyền ảo, màu sắc bắt mắt cùng với hướng nhìn ra biển tuyệt đẹp
            </p><br />
            <a href="#" id="book2">Xem phòng</a>
        </div>
        <div class="col-sm-1"></div>
        <div class=" wowload fadeInLeft col-sm-6">
            <video style="width:100%" autoplay muted loop>
                <source src="./Images/Video.mp4" type="video/mp4"> Your browser does not support the video tag.
            </video>
        </div>
    </div>

    <!--Services-->
    <div class="container" id="portfolio" style="padding:0px 35px">
        <h2 style="text-align: center;color: #0d875c;margin-top:90px">D Ị C H V Ụ</h2>
        <h4 style="text-align: center; font-size: 30px;color: #0d875c">__</h4><br>
        <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12" id="image1">
                <img src="./Images/pic1.jpg" style="width:100%;" alt="Free-Wifi">
                <div class="overlay">
                    <div class="text">
                        <h2>Free Wi-fi</h2>
                        <p>Check-in, lướt web, nộp báo cáo</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12" id="image2">
                <img src="./Images/pic2a.jpg" style="width:100%;" alt="Dining">
                <div class="overlay">
                    <div class="text">
                        <h2>Ăn tối</h2>
                        <p>Một bữa tối thịnh soạn cùng ly rượu vang thơm nồng bên ánh đèn lung linh </p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12" id="image3">
                <img src="./Images/pic3.jpg" style="width:100%;" alt="Drink">
                <div class="overlay">
                    <div class="text">
                        <h2>Thức uống</h2>
                        <p>Một ly cafe mỗi sáng thức dậy hay vài ly bia cùng bạn bè</p>
                    </div>
                </div>
            </div>
        </div><br />

        <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12" id="image4">
                <img src="./Images/pic4.jpg" style="width:100%;" alt="Pool">
                <div class="overlay">
                    <div class="text">
                        <h2>Thư giản</h2>
                        <p>Đắm mình trong làn nước trong xanh của hồ bơi hoặc thỏa sức với những cơn sóng của biển</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12" id="image5">
                <img src="./Images/pic5.jpg" style="width:100%;" alt="Spa">
                <div class="overlay">
                    <div class="text">
                        <h2>Spa</h2>
                        <p>Thư giãn với những dịch vụ massage và đắm chìm trong hương thơm của thảo dược</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12" id="image6">
                <img src="./Images/pic6.jpg" style="width:100%;" alt="Housekeeping">
                <div class="overlay">
                    <div class="text">
                        <h2>Giặt ủi</h2>
                        <p>Trắng sáng, thơm tho và thẳng thớm</p>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <div class="container" style="text-align:center">
        <button class="btn btn-lg" id="loadbtn">XEM THÊM</button>
    </div>
    <div class="container">
        <hr />
    </div>
    <!--Contact-->
    <div class="container" id="contact" style="padding-bottom: 64px">
        <h2 style="text-align: center;color: #0d875c">ĐẾN VỚI CHÚNG TÔI</h2>
        <h4 style="text-align: center; font-size: 30px;color: #0d875c">__</h4><br>
        <div class="row">
            <div class="col-lg-2 col-md-3 col-sm-3 col-xs-12"></div>
            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                <div id="googleMap">
                    <a href="https://www.google.com/maps/place/Hyatt+Regency+Danang+Resort+and+Spa/@16.0130941,108.2621455,17z/data=!4m5!3m4!1s0x314210cf6a42c159:0xaeb535cc2b736240!8m2!3d16.0131183!4d108.2637083"
                       target="googlemap"><img src="./Images/hyatt.PNG" alt="Hyatt Resort"></a>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12" style="line-height:45px;font-size:20px">
                <i class="fa fa-map-marker fa-fw w3-hover-text-black w3-xlarge w3-margin-right"></i> Da Nang, Vietnam<br>
                <i class="fa fa-phone fa-fw w3-hover-text-black w3-xlarge w3-margin-right"></i> Phone: +00 999999<br>
                <i class="fa fa-envelope fa-fw w3-hover-text-black w3-xlarge w3-margin-right"></i> Email: gmail@gmail.com<br>
                <a href="#home" class="btn btn-lg" id="btntop"><span class="glyphicon glyphicon-arrow-up"></span> To the top</a><br />

                <i class="fa fa-facebook-official w3-hover-opacity"></i>
                <i class="fa fa-instagram w3-hover-opacity"></i>
                <i class="fa fa-snapchat w3-hover-opacity"></i>
                <i class="fa fa-pinterest-p w3-hover-opacity"></i>
                <i class="fa fa-twitter w3-hover-opacity"></i>
                <i class="fa fa-linkedin w3-hover-opacity"></i>
            </div>
        </div>
    </div>
</body>
</html>