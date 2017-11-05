package model;

public class ThongTinDatPhong {
	private String maLoaiPhong;
	private int soPhong;
	private String ngayNhanPhong;
	private String ngayTraPhong;
	private float tienCoc;
	
	public ThongTinDatPhong(String maLoaiPhong, int soPhong,
								String ngayNhanPhong, String ngayTraPhong, float tienCoc) {
		this.maLoaiPhong=maLoaiPhong;
		this.soPhong=soPhong;
		this.ngayNhanPhong=ngayNhanPhong;
		this.ngayTraPhong=ngayTraPhong;
		this.tienCoc=tienCoc;
	}
	
	public ThongTinDatPhong() {
		
	}

	public String getMaLoaiPhong() {
		return maLoaiPhong;
	}

	public void setMaLoaiPhong(String maLoaiPhong) {
		this.maLoaiPhong = maLoaiPhong;
	}

	public int getSoPhong() {
		return soPhong;
	}

	public void setSoPhong(int soPhong) {
		this.soPhong = soPhong;
	}

	public String getNgayNhanPhong() {
		return ngayNhanPhong;
	}

	public void setNgayNhanPhong(String ngayNhanPhong) {
		this.ngayNhanPhong = ngayNhanPhong;
	}

	public String getNgayTraPhong() {
		return ngayTraPhong;
	}

	public void setNgayTraPhong(String ngayTraPhong) {
		this.ngayTraPhong = ngayTraPhong;
	}

	public float getTienCoc() {
		return tienCoc;
	}

	public void setTienCoc(float tienCoc) {
		this.tienCoc = tienCoc;
	}
	
}
