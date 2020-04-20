package gallery;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class GalleryDAO {
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	
	
		private Connection getConnection() throws Exception {
			Connection con = null;
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/jspbeginner");
			con = ds.getConnection();
			return con;
		}
		
		
		
		
		
		
		public int updateGallery(GalleryBean gbean){
			int check = 0;
			
			try {
				con = getConnection();
				sql = "select passwd from gallery where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, gbean.getNum());
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					if(gbean.getPasswd().equals(rs.getString("passwd"))){
						check = 1;
						sql = "update gallery set name=?, subject=?, content=? where num=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, gbean.getName());
						pstmt.setString(2, gbean.getSubject());
						pstmt.setString(3, gbean.getContent());
						pstmt.setInt(4, gbean.getNum());
						pstmt.executeUpdate();
						
					}else{
						check = 0;
					}
				}
				
				
			} catch (Exception e) {
				System.out.println("updateGallery硫붿냼�뱶 �삤瑜� : " + e);
			}finally{
				//�옄�썝�빐�젣
				if(rs!=null)try{rs.close();}catch(Exception err){err.printStackTrace();}
				if(pstmt!=null)try{pstmt.close();}catch(Exception err){err.printStackTrace();}
				if(con!=null)try{con.close();}catch(Exception err){err.printStackTrace();}
				
			}
			return check;
			
		}
		
		
		
		public int deleteGallery(int num,String passwd){
			
			int check = 0;
			try {
				con = getConnection();
				sql = "select passwd from gallery where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);				
				rs = pstmt.executeQuery();
				if(rs.next()){
					if(passwd.equals(rs.getString("passwd"))){
						check=1;
						sql = "delete from gallery where num=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, num);
						pstmt.executeUpdate();
					}else{
						check=0;
					}
				}
			} catch (Exception err) {
				err.printStackTrace();
			}finally{
				if(rs!=null)try{rs.close();}catch(Exception err){err.printStackTrace();}
				if(pstmt!=null)try{pstmt.close();}catch(Exception err){err.printStackTrace();}
				if(con!=null)try{con.close();}catch(Exception err){err.printStackTrace();}
			}
			return check;
		}
		
		

		public GalleryBean getGallery(int num){
			
			GalleryBean galleryBean = null;
			try {
				con = getConnection();
				sql = "select * from gallery where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
				if(rs.next()){
					galleryBean = new GalleryBean();
					galleryBean.setContent(rs.getString("content"));
					galleryBean.setDate(rs.getTimestamp("date"));
					galleryBean.setFile(rs.getString("file"));
					galleryBean.setIp(rs.getString("ip"));
					galleryBean.setName(rs.getString("name"));
					galleryBean.setNum(rs.getInt("num"));
					galleryBean.setPasswd(rs.getString("passwd"));
					galleryBean.setReadcount(rs.getInt("readcount"));
					galleryBean.setSubject(rs.getString("subject"));
							
				}
			}catch (Exception e) {
				e.printStackTrace();
			}finally{
				if(rs!=null)try{rs.close();}catch(Exception err){err.printStackTrace();}
				if(pstmt!=null)try{pstmt.close();}catch(Exception err){err.printStackTrace();}
				if(con!=null)try{con.close();}catch(Exception err){err.printStackTrace();}
			}
			return galleryBean;
		}
		
		
		
		public void updateReadCount(int num){
			
			try {
				con = getConnection();
				sql = "update gallery set readcount=readcount+1 where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				if(rs!=null)try{rs.close();}catch(Exception err){err.printStackTrace();}
				if(pstmt!=null)try{pstmt.close();}catch(Exception err){err.printStackTrace();}
				if(con!=null)try{con.close();}catch(Exception err){err.printStackTrace();}
			}
		}
		
		
		
		public List<GalleryBean> getGalleryList(int startRow,int pageSize){
			
			List<GalleryBean> galleryList = new ArrayList<GalleryBean>();
			try {
				con = getConnection();
				sql = "select * from gallery order by num desc limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, startRow);				
				pstmt.setInt(2, pageSize);		
				rs = pstmt.executeQuery();
				while (rs.next()){
					GalleryBean gBean = new GalleryBean();
					gBean.setContent(rs.getString("content"));
					gBean.setDate(rs.getTimestamp("date"));
					gBean.setFile(rs.getString("file"));
					gBean.setIp(rs.getString("ip"));
					gBean.setName(rs.getString("name"));
					gBean.setNum(rs.getInt("num"));
					gBean.setPasswd(rs.getString("passwd"));
					gBean.setReadcount(rs.getInt("readcount"));
					gBean.setSubject(rs.getString("subject"));
					galleryList.add(gBean);
				}
			} catch (Exception err) {
				System.out.println("getGalleryList()메소드 오류 : " +err);
			}finally{
				if(rs!=null)try{rs.close();}catch(Exception err){err.printStackTrace();}
				if(pstmt!=null)try{pstmt.close();}catch(Exception err){err.printStackTrace();}
				if(con!=null)try{con.close();}catch(Exception err){err.printStackTrace();}
			}
			return galleryList;
		}
		
		
		
		public int getGalleryCount(){
			int count = 0;
			try {
				con = getConnection();
				sql = "select count(*) from gallery";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()){
					count = rs.getInt(1);
				}
			} catch (Exception e) {
				System.out.println("getGalleryCount()메소드 오류 : "+ e);
			}finally{
				if(rs!=null)try{rs.close();}catch(Exception err){err.printStackTrace();}
				if(pstmt!=null)try{pstmt.close();}catch(Exception err){err.printStackTrace();}
				if(con!=null)try{con.close();}catch(Exception err){err.printStackTrace();}
			}
			return count;
		}
		
		
		
		public void insertGallery(GalleryBean gbean){
			int num = 0;
			try {
				con = getConnection();
				sql = "select max(num) from gallery";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()){
					num = rs.getInt(1) + 1;
				}else{
					num = 1;
				}
				sql = "insert into gallery "
						+"(num,name,passwd,subject,"
						+"content,file,"
						+"readcount,date,ip)"
						+"values(?,?,?,?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setString(2, gbean.getName());
				pstmt.setString(3, gbean.getPasswd());
				pstmt.setString(4, gbean.getSubject());
				pstmt.setString(5, gbean.getContent());
				pstmt.setString(6, gbean.getFile());
				pstmt.setInt(7, 0);
				pstmt.setTimestamp(8, gbean.getDate());
				pstmt.setString(9, gbean.getIp());
				pstmt.executeUpdate();
			} catch (Exception e) {
				System.out.println("insertGallery()메소드 오류 : "+e);
			}finally{
				if(rs!=null)try{rs.close();}catch(Exception err){err.printStackTrace();}
				if(pstmt!=null)try{pstmt.close();}catch(Exception err){err.printStackTrace();}
				if(con!=null)try{con.close();}catch(Exception err){err.printStackTrace();}
			}
			
			
		}
		
		
		
		
}



















