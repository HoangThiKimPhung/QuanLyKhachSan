package controler;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.sun.org.apache.xalan.internal.xsltc.compiler.util.CompareGenerator;

import connectionDB.NVTraCuuDB;
import model.ThongTinDatPhong_NV;
import java.util.*;
import java.text.*;

@WebServlet("/KD_XacNhanNhanPhong")
public class KD_XacNhanNhanPhong extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public KD_XacNhanNhanPhong() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<ThongTinDatPhong_NV> thongtinDatPhong_NV = (List<ThongTinDatPhong_NV>) getServletContext()
				.getAttribute("thongtinDatPhong_NV");

		response.setContentType("application/json;charset=UTF-8");
		request.setCharacterEncoding("utf-8");

		PrintWriter out = response.getWriter();
		
		if (!thongtinDatPhong_NV.isEmpty()) {
			
			//System.out.println("Tìm kiếm khách hàng thành công");
		    //Import gson-2.2.2.jar
		    Gson gson = new Gson();
		    String objectToReturn = gson.toJson(thongtinDatPhong_NV); //Convert List -> Json
		    out.write(objectToReturn); //Đưa Json trả về Ajax
		    out.flush();
		}
		else
		{
			//System.out.println("Không có kết quả");
			out.write("{\"check\":\"fail\"}");
		    out.flush();
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String maCodeDatPhong = (String)getServletContext().getAttribute("maCodeDatPhong");
		
		List<ThongTinDatPhong_NV> thongtinDatPhong_NV = (List<ThongTinDatPhong_NV>) getServletContext()
				.getAttribute("thongtinDatPhong_NV");
		
		
		String maKH = (String)request.getParameter("maKH");
		
		Date date=new Date();
		DateFormat formater= new SimpleDateFormat("yyyy-MM-dd");
		String today=formater.format(date);
		
		response.setContentType("application/json;charset=UTF-8");
	    request.setCharacterEncoding("utf-8");
        
	    PrintWriter out=response.getWriter();
		
	    boolean flag=false;
		for(int i=0; i<thongtinDatPhong_NV.size(); i++) {

//			System.out.println(today);
			int a = thongtinDatPhong_NV.get(i).getNgayNhanPhong().compareTo(today);
			if(a==0) {

				int kq = connectionDB.NVDatPhongDB.XacNhanNhanPhong((String)thongtinDatPhong_NV.get(i).getMaKD(), maKH, (String)thongtinDatPhong_NV.get(i).getMaPhong(), (String)thongtinDatPhong_NV.get(i).getNgayNhanPhong(), (String)thongtinDatPhong_NV.get(i).getNgayTraPhong(),
						(String)request.getSession().getAttribute("user"), 
						(String)request.getSession().getAttribute("pass"));
				
				if(kq==1)
					flag=true;
				
				
			}
		}
		
		if(flag) {
			out.write("{\"check\":\"ok\"}");
		    out.flush();
		}
		else {
			out.write("{\"check\":\"fail\"}");
		    out.flush();
		}
		
		
	}

}
