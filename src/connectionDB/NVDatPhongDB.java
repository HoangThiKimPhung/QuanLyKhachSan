package connectionDB;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLType;
import java.util.List;

import model.ThongTinDatPhong_NV;

public class NVDatPhongDB {
	public static String MaKhachDatMoi(String user, String pass) {
		Connection conn = null;
		CallableStatement cstmt = null;

		try {
			conn = ConnectDB.ConnectDB_Role(user, pass);

			cstmt = conn.prepareCall("{?=call fn_TaoMaKhachDat()}");

			cstmt.registerOutParameter(1, java.sql.Types.CHAR);

			cstmt.execute();

			String maKD = cstmt.getString(1);

			return maKD;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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
		return null;
	}

	public static String ThemKhachDatMoi(String hoTenKD, String CMND, String DiaChi, String QuocTich, String SDT,
			String user, String pass) {

		Connection conn = null;
		CallableStatement cstmt = null;

		try {
			conn = ConnectDB.ConnectDB_Role(user, pass);
			if (conn == null) {
				System.out.println("connect null");
				return null;
			}
			String sql = "{call spThemKhachDatMoi(?,?,?,?,?,?)}";
			cstmt = conn.prepareCall(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

			cstmt.setString(1, hoTenKD);
			cstmt.setString(2, CMND);
			cstmt.setString(3, DiaChi);
			cstmt.setString(4, QuocTich);
			cstmt.setString(5, SDT);
			cstmt.registerOutParameter(6, java.sql.Types.CHAR);

			cstmt.executeUpdate();
			if (cstmt.getString(6) != null)
				return cstmt.getString(6);
			return null;

		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
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
		return null;
	}

	public static String KiemTraKhachDat(String CMND, String user, String pass) {
		Connection conn = null;
		CallableStatement cstmt = null;
		String kq = null;

		try {
			conn = ConnectDB.ConnectDB_Role(user, pass);
			if (conn == null) {
				System.out.println("connect null");
				return null;
			}
			String sql = "{call fn_KiemTraKhachHang(?)}";
			cstmt = conn.prepareCall(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

			cstmt.setString(1, CMND);

			cstmt.execute();
			kq = cstmt.getString(1);
			if (kq != null) {
				return kq;
			}
			return null;

		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
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
		return null;
	}

	public static int CapNhatKhachDat(String maKD, String hoTenKD, String CMND, String DiaChi, String QuocTich,
			String SDT, String user, String pass) {

		Connection conn = null;
		CallableStatement cstmt = null;

		try {
			conn = ConnectDB.ConnectDB_Role(user, pass);
			if (conn == null) {
				System.out.println("connect null");
				return 0;
			}
			String sql = "{call spCapNhatKhachDat(?,?,?,?,?,?)}";
			cstmt = conn.prepareCall(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

			cstmt.setString(1, maKD);
			cstmt.setString(2, hoTenKD);
			cstmt.setString(3, CMND);
			cstmt.setString(4, DiaChi);
			cstmt.setString(5, QuocTich);
			cstmt.setString(6, SDT);

			int k = cstmt.executeUpdate();
			if (k >= 1)
				return k;

		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
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
		return 0;
	}

	public static int ThemChiTietDatPhong(String maKD, String maPhong, String ngayNhanPhong, String ngayTraPhong,
			float tienCoc, String user, String pass) {

		Connection conn = null;
		CallableStatement cstmt = null;

		try {
			conn = ConnectDB.ConnectDB_Role(user, pass);
			if (conn == null) {
				System.out.println("connect null");
				return 0;
			}
			String sql = "{call spThemChiTietDatPhong(?,?,?,?,?,?)}";
			cstmt = conn.prepareCall(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

			cstmt.setString(1, maKD);
			cstmt.setString(2, maPhong);
			cstmt.setString(3, ngayNhanPhong);
			cstmt.setString(4, ngayTraPhong);
			cstmt.setFloat(5, tienCoc);
			cstmt.registerOutParameter(6, java.sql.Types.INTEGER);

			cstmt.executeUpdate();
			if (cstmt.getInt(6) != 0)
				return cstmt.getInt(6);
			return 0;

		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
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
		return 0;
	}

	public static int XoaChiTietDatPhong(String maKD, String maPhong, String ngayNhanPhong, String user, String pass) {

		Connection conn = null;
		CallableStatement cstmt = null;

		try {
			conn = ConnectDB.ConnectDB_Role(user, pass);
			if (conn == null) {
				System.out.println("connect null");
				return 0;
			}
			String sql = "{call spXoaChiTietDatPhong(?,?,?)}";
			cstmt = conn.prepareCall(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

			cstmt.setString(1, maKD);
			cstmt.setString(2, maPhong);
			cstmt.setString(3, ngayNhanPhong);

			int k = cstmt.executeUpdate();
			if (k >= 1)
				return k;

		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
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
		return 0;
	}

	public static int HuyGiaoDichDatPhong(String maKD, String user, String pass) {

		Connection conn = null;
		CallableStatement cstmt = null;

		try {
			conn = ConnectDB.ConnectDB_Role(user, pass);
			if (conn == null) {
				System.out.println("connect null");
				return 0;
			}
			String sql = "{call spXoaKhachDat(?)}";
			cstmt = conn.prepareCall(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

			cstmt.setString(1, maKD);

			cstmt.executeUpdate();

		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
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
		return 0;
	}

	public static int CapNhatChiTietDatPhong(String maKD, String maPhong, String ngayTraPhongCu, String ngayTraPhongMoi,
			String user, String pass) {

		Connection conn = null;
		CallableStatement cstmt = null;

		try {
			conn = ConnectDB.ConnectDB_Role(user, pass);
			if (conn == null) {
				System.out.println("connect null");
				return 0;
			}
			String sql = "{call spCapNhatChiTietDat(?,?,?,?)}";
			cstmt = conn.prepareCall(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

			cstmt.setString(1, maKD);
			cstmt.setString(2, maPhong);
			cstmt.setString(3, ngayTraPhongCu);
			cstmt.setString(4, ngayTraPhongMoi);

			int k = cstmt.executeUpdate();
			if (k >= 1)
				return k;

		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
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
		return 0;
	}

	public static int HuyDonDatPhong(String maKD, String maPhong, String ngayNhanPhong, String nguoiHuy, String user, String pass) {

		Connection conn = null;
		CallableStatement cstmt = null;

		try {
			conn = ConnectDB.ConnectDB_Role(user, pass);
			if (conn == null) {
				return 0;
			}
			String sql = "{call spHuyDonDatPhong(?,?,?,?,?)}";
			cstmt = conn.prepareCall(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

			cstmt.setString(1, maKD);
			cstmt.setString(2, maPhong);
			cstmt.setString(3, ngayNhanPhong);
			cstmt.setString(4, nguoiHuy);
			cstmt.registerOutParameter(5, java.sql.Types.BIT); 

			cstmt.executeUpdate();
			
			if(cstmt.getBoolean(5))
				return 1;
			else
				return 0;

		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
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
		return 0;
	}

	public static int XacNhanNhanPhong(String maKD, String maKH, String maPhong, String ngayNhanPhong, String ngayTraPhong, String user, String pass) {
		Connection conn = null;
		CallableStatement cstmt = null;

		try {
			conn = ConnectDB.ConnectDB_Role(user, pass);
			if (conn == null) {
				return 0;
			}
			String sql = "{call spXacNhanNhanPhong(?,?,?,?,?,?)}";
			cstmt = conn.prepareCall(sql, ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_READ_ONLY);

			cstmt.setString(1, maKD);
			cstmt.setString(2, maKH);
			cstmt.setString(3, maPhong);
			cstmt.setString(4, ngayNhanPhong);
			cstmt.setString(5, ngayTraPhong);
			cstmt.registerOutParameter(6, java.sql.Types.INTEGER);

			cstmt.executeUpdate();
			if (cstmt.getInt(6) == 1) {
				return 1;
			}
				
			return 0;

		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
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
		return 0;
	}
}
