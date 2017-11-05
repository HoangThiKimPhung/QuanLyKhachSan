package controler;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import java.util.*;
import model.SoLuongPhongTrong;
import connectionDB.KDTimPhongDB;

@WebServlet("/KD_TimPhong")
public class KD_TimPhong extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public KD_TimPhong() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ngaynhanphong = request.getParameter("ngaynhanphong");
		String ngaytraphong = request.getParameter("ngaytraphong");
		getServletContext().setAttribute("ngaynhanphong", ngaynhanphong);
		getServletContext().setAttribute("ngaytraphong", ngaytraphong);
		response.sendRedirect("DatPhong.jsp");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String ngaynhanphong = request.getParameter("ngaynhanphong");
		String ngaytraphong = request.getParameter("ngaytraphong");
		
		PrintWriter out=response.getWriter();
		
		List<SoLuongPhongTrong> phongtrong;
		try {
			phongtrong = KDTimPhongDB.soPhongTrongTungLoai(ngaynhanphong, ngaytraphong);
//			for(SoLuongPhongTrong i:phongtrong) {
//				System.out.println(i.getMaLoaiPhong());
//			}
			if(!phongtrong.isEmpty()) {
				Gson gson=new Gson();
				//Convert List to Json
				String objectToReturn=gson.toJson(phongtrong);
				//Đưa Json trả về Ajax
				out.write(objectToReturn);
				out.flush();
			}
			else
			{
				System.out.println("danh sach trong");
				out.write("{\"check\":\"fail\"}");
			    out.flush();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
