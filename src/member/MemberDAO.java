package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import member.MemberBean;

public class MemberDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";

	private Connection getConnection() throws Exception {
		Connection con = null;
		Context init = new InitialContext();
		DataSource ds =  (DataSource)init.lookup("java:comp/env/jdbc/jspbeginner");
		con = ds.getConnection();
		return con;
	}
	
	public int updateMember(MemberBean mBean){
		int check = 0;
		try {
			con = getConnection();
			sql = "select * from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mBean.getId());
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				if(mBean.getPasswd().equals(rs.getString("passwd"))){
					check = 1;
					sql = "update member set passwd=?, name=?, age=?, gender=?,"
							+" email=?, address=?, tel=?, mtel=?  where id=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, mBean.getPasswd());
					pstmt.setString(2, mBean.getName());
					pstmt.setInt(3, mBean.getAge());
					pstmt.setString(4, mBean.getGender());
					pstmt.setString(5, mBean.getEmail());
					pstmt.setString(6, mBean.getAddress());
					pstmt.setString(7, mBean.getTel());
					pstmt.setString(8, mBean.getMtel());
					pstmt.setString(9, mBean.getId());
					pstmt.executeUpdate();
				}else{
					check = 0;
				}
			}		
		} catch (Exception e) {
			System.out.println("updateBoard메소드 오류 : " + e);
		}finally {
			//자원해제
			if(rs!=null)try{rs.close();}catch(Exception err){err.printStackTrace();}
			if(pstmt!=null)try{pstmt.close();}catch(Exception err){err.printStackTrace();}
			if(con!=null)try{con.close();}catch(Exception err){err.printStackTrace();}				
		}
		return check;
	}
	
	
	
	public int userCheck(String id,String passwd){
		int check = -1;		
		try {
			con = getConnection();
			sql = "select * from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				if(passwd.equals(rs.getString("passwd"))){
					check = 1;
				}else{
					check = 0;
				}
			}else{
				check = -1;	
			}
		} catch (Exception e) {
			System.out.println("userCheck메소드 내부에서 오류 : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return check;
	}//userCheck()
	
	
	public int idCheck(String id){
		
		int check = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="";
		try {
			con = getConnection();
			sql = "select * from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				check = 1;
			}else{
				check = 0;
			}
		} catch (Exception e) {
			System.out.println("idCheck()메소드에서 오류 : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return check; 
	}//idCheck()
	
	
	
	public void insertMember(MemberBean memberBean){
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		try {
			con = getConnection();
			sql = "insert into member(id,passwd,name,reg_date,age,gender,email,address,tel,mtel)"
				+ "values(?,?,?,?,?,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberBean.getId());
			pstmt.setString(2, memberBean.getPasswd());
			pstmt.setString(3, memberBean.getName());
			pstmt.setTimestamp(4, memberBean.getReg_date());
			pstmt.setInt(5, memberBean.getAge());
			pstmt.setString(6, memberBean.getGender());
			pstmt.setString(7, memberBean.getEmail());
			pstmt.setString(8, memberBean.getAddress());
			pstmt.setString(9, memberBean.getTel());
			pstmt.setString(10, memberBean.getMtel());
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("insertMember메소드 내부에서 오류 : " + e);
		} finally {
			try {
				if(pstmt != null){
					pstmt.close();
				}
				if(con != null){
					con.close();
				}
			} catch (SQLException e) {				
				e.printStackTrace();
			}
		}
	}//insertMember()
	
	public MemberBean getMember(String id){
		MemberBean memberBean = null;
		try {
			con = getConnection();
			sql = "select * from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				memberBean = new MemberBean();
				memberBean.setId(rs.getString("id"));
				memberBean.setPasswd(rs.getString("passwd"));
				memberBean.setName(rs.getString("name"));
				memberBean.setReg_date(rs.getTimestamp("reg_date"));
				memberBean.setAge(rs.getInt("age"));
				memberBean.setGender(rs.getString("gender"));
				memberBean.setEmail(rs.getString("email"));
				memberBean.setAddress(rs.getString("address"));
				memberBean.setTel(rs.getString("tel"));
				memberBean.setMtel(rs.getString("mtel"));
			}
		} catch (Exception e) {		
			System.out.println("getMember메소드 내부 오류 : "+e);
		} finally {
			//자원해제
			if(rs!=null)try{rs.close();}catch(Exception err){err.printStackTrace();}
			if(pstmt!=null)try{pstmt.close();}catch(Exception err){err.printStackTrace();}
			if(con!=null)try{con.close();}catch(Exception err){err.printStackTrace();}
		}
		return memberBean;
	}//메소드 끝
	
	public List<MemberBean> getMember(String id,String pwd){
		
		List<MemberBean> memberlist = new ArrayList<MemberBean>();
		MemberBean memberBean = null;
		
		try {
			con = getConnection();
			sql = "select * from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				memberBean = new MemberBean();
				memberBean.setId(rs.getString("id"));
				memberBean.setPasswd(rs.getString("passwd"));
				memberBean.setName(rs.getString("name"));
				memberBean.setReg_date(rs.getTimestamp("reg_date"));
				memberBean.setAge(rs.getInt("age"));
				memberBean.setGender(rs.getString("gender"));
				memberBean.setEmail(rs.getString("email"));
				memberBean.setAddress(rs.getString("address"));
				memberBean.setTel(rs.getString("tel"));
				memberBean.setMtel(rs.getString("mtel"));
				
				memberlist.add(memberBean);
			}
		} catch (Exception e) {		
			System.out.println("getMember메소드 내부 오류 : "+e);
		} finally {
			//자원해제
			if(rs!=null)try{rs.close();}catch(Exception err){err.printStackTrace();}
			if(pstmt!=null)try{pstmt.close();}catch(Exception err){err.printStackTrace();}
			if(con!=null)try{con.close();}catch(Exception err){err.printStackTrace();}
		}
		return memberlist;
	}//메소드 끝
	
}//MemberDAO클래스 닫는 부분




