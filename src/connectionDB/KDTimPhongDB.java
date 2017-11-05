package connectionDB;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.SoLuongPhongTrong;;

public class KDTimPhongDB {
	public static List<SoLuongPhongTrong> soPhongTrongTungLoai(String ngaynhanphong, String ngaytraphong) throws SQLException
	{
		Connection conn=null;
		CallableStatement cstmt=null;
		String maLoaiPhong, tenLoaiPhong;
		int soPhongTrong;
		float donGia;
		
		try {
			conn=ConnectDB.getConnect_sa();
			if (conn == null) {
	            return null;
	        }
			
			String sql= "{call spKhachDatTimPhong(?,?)}";
			cstmt=conn.prepareCall(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			
			cstmt.setString(1, ngaynhanphong);
			cstmt.setString(2, ngaytraphong);
			
			ResultSet kq=cstmt.executeQuery();
			
			
			List<SoLuongPhongTrong> dsPhongTrong= new ArrayList<SoLuongPhongTrong>();
			while(kq.next()) {
				maLoaiPhong=kq.getString("maLoaiPhong");
				//System.out.println(maPhong);
				tenLoaiPhong=kq.getString("loaiPhong");
				//System.out.println(maLoaiPhong);
				soPhongTrong=kq.getInt("SoPhongTrongTheoLoaiPhong");
				//System.out.println(loaiPhong);
				donGia=kq.getFloat("donGia");		
				//System.out.println(tienPhong);
				
				dsPhongTrong.add(new SoLuongPhongTrong(maLoaiPhong,tenLoaiPhong,soPhongTrong,donGia));				
				 
			}			
			
			kq.close();	
			return dsPhongTrong; 
			
		}finally {
            try {
                if (conn != null) {
                    conn.close();
                }
                if (cstmt != null) {
                    cstmt.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
	}
}
