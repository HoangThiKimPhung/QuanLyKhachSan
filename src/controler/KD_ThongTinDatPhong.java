package controler;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import connectionDB.KDDatPhongDB;
import connectionDB.KDTimPhongDB;

import java.util.*;

import model.SoLuongPhongTrong;
import model.ThongTinDatPhong;

@WebServlet("/KD_ThongTinDatPhong")
public class KD_ThongTinDatPhong extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public KD_ThongTinDatPhong() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Lấy thông tin đặt phòng
		String maloaiphong = request.getParameter("maloaiphong");
		int sophong = Integer.parseInt(request.getParameter("sophong"));
		String ngaynhanphong = request.getParameter("ngaynhanphong");
		String ngaytraphong = request.getParameter("ngaytraphong");
		float tiencoc = Float.parseFloat(request.getParameter("tiencoc"));
		

//		System.out.println(maloaiphong);
//		System.out.println(sophong);
//		System.out.println(ngaynhanphong);
//		System.out.println(ngaytraphong);
//		System.out.println(tiencoc);
		
		//Lấy dsThongTinDatPhong được lưu trong application scope ra
		List<ThongTinDatPhong> thongtindatphong= (List<ThongTinDatPhong>)getServletContext().getAttribute("thongtindatphong");
		//Thêm thông tin phòng mới thuê vào
		thongtindatphong.add(new ThongTinDatPhong(maloaiphong, sophong, ngaynhanphong, ngaytraphong, tiencoc));
//		for(ThongTinDatPhong i :thongtindatphong) {
//			System.out.println(i.getMaLoaiPhong());
//			System.out.println(i.getSoPhong());
//			System.out.println(i.getNgayNhanPhong());
//			System.out.println(i.getNgayTraPhong());
//			System.out.println(i.getTienCoc());
//			System.out.println("------");
//			System.out.println("Đã lưu thành công phòng ");
//		}
	}
	
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Lấy thông tin phòng vừa xóa khỏi Bảng Chi tiết đặt phòng
		String maloaiphong = request.getParameter("maloaiphong");
		int sophong = Integer.parseInt(request.getParameter("sophong"));
		String ngaynhanphong = request.getParameter("ngaynhanphong");
		String ngaytraphong = request.getParameter("ngaytraphong");
		float tiencoc = Float.parseFloat(request.getParameter("tiencoc"));
//		System.out.println("=======");
//		System.out.println("=======");
//		System.out.println(maloaiphong);
//		System.out.println(sophong);
//		System.out.println(ngaynhanphong);
//		System.out.println(ngaytraphong);
//		System.out.println(tiencoc);
			
//		//Lấy dsThongTinDatPhong được lưu trong application scope ra
		List<ThongTinDatPhong> thongtindatphong = (List<ThongTinDatPhong>)getServletContext().getAttribute("thongtindatphong");
		
		//Tìm phòng muốn xóa trong dsThongTinPhongThue và xóa đi
		int n=thongtindatphong.size();
		for(int i=0; i<n; i++) {
			ThongTinDatPhong p=thongtindatphong.get(i);
			if(p.getMaLoaiPhong().equals(maloaiphong) && p.getSoPhong() == sophong && p.getTienCoc() == tiencoc) 				 
			{ 
				thongtindatphong.remove(i);
				System.out.println("Đã xóa thành công phòng ");
				break;
			}				
		}
//		System.out.println("=======");
//		for(ThongTinDatPhong i :thongtindatphong) {
//			System.out.println(i.getMaLoaiPhong());
//			System.out.println(i.getSoPhong());
//			System.out.println(i.getNgayNhanPhong());
//			System.out.println(i.getNgayTraPhong());
//			System.out.println(i.getTienCoc());
//		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out=response.getWriter();
		
		List<ThongTinDatPhong> thongtindatphong = (List<ThongTinDatPhong>)getServletContext().getAttribute("thongtindatphong");
		int n = thongtindatphong.size();
		int phongdon = 0, phongdoi = 0, phongtt = 0;
		for(int i=0; i<n; i++) {
			ThongTinDatPhong p=thongtindatphong.get(i);
			if(p.getMaLoaiPhong().equals("1"))
			{ 
				phongdon+=p.getSoPhong();
			}
			if(p.getMaLoaiPhong().equals("2"))
			{ 
				phongdoi+=p.getSoPhong();
			}
			if(p.getMaLoaiPhong().equals("3"))
			{ 
				phongtt+=p.getSoPhong();
			}
//			System.out.println(phongdon);
//			System.out.println(phongdoi);
//			System.out.println(phongtt);
		}
		
		if(!thongtindatphong.isEmpty()) {
			Gson gson = new Gson();
			//Convert List to Json
			String objectToReturn=gson.toJson(thongtindatphong);
			//Đưa Json trả về Ajax
			out.write(objectToReturn);
			out.flush();
		}else
		{
			System.out.println("danh sach trong");
			out.write("{\"check\":\"fail\"}");
		    out.flush();
		}
		
	}
	
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<ThongTinDatPhong> thongtindatphong = (List<ThongTinDatPhong>)getServletContext().getAttribute("thongtindatphong");
		thongtindatphong.clear();
	}
	
	protected void doHead(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Lấy thông tin phòng vừa xóa khỏi Bảng Chi tiết đặt phòng
		int phongdon = Integer.parseInt(request.getParameter("phongdon"));
		int phongdoi = Integer.parseInt(request.getParameter("phongdoi"));
		int phongtt = Integer.parseInt(request.getParameter("phongtt"));
		String ngaynhanphong = request.getParameter("ngaynhanphong");
		String ngaytraphong = request.getParameter("ngaytraphong");
		String hoten = request.getParameter("hoten");
		String CMND = request.getParameter("CMND");
		String diachi = request.getParameter("diachi");
		String quoctich = request.getParameter("quoctich");
		String SDT = request.getParameter("SDT");
//		System.out.println(phongdon);
//		System.out.println(phongdoi);
//		System.out.println(phongtt);
//		System.out.println(ngaynhanphong);
//		System.out.println(ngaytraphong);
//		System.out.println(tiencoc);
//		System.out.println(hoten);
//		System.out.println(CMND);
//		System.out.println(diachi);
//		System.out.println(quoctich);
//		System.out.println(SDT);
//		System.out.println(rows);

		String maKD = KDDatPhongDB.TaoMaKhachDat();
		request.getServletContext().setAttribute("maKD", maKD);
		
		int k = KDDatPhongDB.ThemKhachDatMoi(maKD, hoten, CMND, diachi, quoctich, SDT);
		if(k>=1) {
		
			int j; 
			boolean flag=false;
			
			for(j=0; j<phongdon; j++) {
				String maphong = KDDatPhongDB.ChonMaPhongChoKhachDat(ngaynhanphong, ngaytraphong, "1");
				float tiencoc = KDDatPhongDB.TienCocCuaMotPhong(maphong, ngaynhanphong, ngaytraphong);
				int b1 = KDDatPhongDB.ChiTietDatPhong(maKD, maphong, ngaynhanphong, ngaytraphong, tiencoc);
				if(b1<=0) {
					System.out.println("Không thêm được chi tiết đặt phòng!");
					break;
				}
				else {
					flag=true;
					System.out.println("Thêm thành công!");
				}
			}
			for(j=0; j<phongdoi; j++) {
				String maphong = KDDatPhongDB.ChonMaPhongChoKhachDat(ngaynhanphong, ngaytraphong, "2");
				float tiencoc = KDDatPhongDB.TienCocCuaMotPhong(maphong, ngaynhanphong, ngaytraphong);
				int b2 = KDDatPhongDB.ChiTietDatPhong(maKD, maphong, ngaynhanphong, ngaytraphong, tiencoc);
				if(b2<=0) {
					System.out.println("Không thêm được chi tiết đặt phòng!");
					break;
				}
				else {
					flag=true;
					System.out.println("Thêm thành công!");
				}
			}
			for(j=0; j<phongtt; j++) {
				String maphong = KDDatPhongDB.ChonMaPhongChoKhachDat(ngaynhanphong, ngaytraphong, "3");
				float tiencoc = KDDatPhongDB.TienCocCuaMotPhong(maphong, ngaynhanphong, ngaytraphong);
				int b3 = KDDatPhongDB.ChiTietDatPhong(maKD, maphong, ngaynhanphong, ngaytraphong, tiencoc);
				if(b3<=0) {
					System.out.println("Không thêm được chi tiết đặt phòng!");
					break;
				}
				else {
					flag=true;
					System.out.println("Thêm thành công!");
				}
			}
			
			response.setContentType("application/json;charset=UTF-8");
		    request.setCharacterEncoding("utf-8");
	        
		    PrintWriter out=response.getWriter();
		    
			if(flag)
			{	
				System.out.println("OKK!");
				out.write("{\"check\":\"ok\"}");
			    out.flush();
			}
			else
			{
				out.write("{\"check\":\"fail\"}");
			    out.flush();
			}
		}
		else {
			System.out.println("Không thể thêm KD mới!");
		}
		
				
	}
}
