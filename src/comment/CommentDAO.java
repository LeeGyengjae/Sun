package comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import board.BoardBean;

public class CommentDAO {
	
	Connection con = null;
	PreparedStatement pstmt  = null;
	ResultSet rs = null;		
	String sql = "";
	
	private Connection getConnection() throws Exception {		
		Connection con = null;
		Context init = new InitialContext();
		DataSource ds = 
				(DataSource)init.lookup("java:comp/env/jdbc/jspbeginner");
		con = ds.getConnection();
		return con;
	}//getConnection�޼ҵ� �ݴ� �κ�	
	
	
	public void insertComment(CommentBean commentBean,int board_num){		

		int num = 0;
		try{
			con = getConnection();
			sql = "select max(num) from comment";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){//�˻��� �����Ͱ� ���� �ϸ�?
				num = rs.getInt(1) + 1; //���� ���� ��� �ִ�۹�ȣ + 1
			}else{//�˻��� ���� ������?
				num = 1; //���� ���� ��� 
			}
			
			sql = "insert into comment "
				+ "(num,board_num,id,date,content) "
				+ "values(?,?,?,?,?)"; 
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);//��� ��ȣ
			pstmt.setInt(2, board_num);//����� �޸� �Խñ� ��ȣ
			pstmt.setString(3, commentBean.getId());//��� �� �̿����� ID
			pstmt.setTimestamp(4, commentBean.getDate());
			pstmt.setString(5, commentBean.getContent());//��� ����
			
			pstmt.executeUpdate();
			
		}catch(Exception e){
			System.out.println("insertComment�޼ҵ� ���ο��� ����:" + e);
		}finally {
			if(rs!=null)try{rs.close();}catch(Exception err){err.printStackTrace();}
			if(pstmt!=null)try{pstmt.close();}catch(Exception err){err.printStackTrace();}
			if(con!=null)try{con.close();}catch(Exception err){err.printStackTrace();}
		}		
	}//insertBoard�޼ҵ� �ݴ� �κ�
	
	public int getCommentCount(int board_num){
		int count = 0;
		try {
			con = getConnection();
			sql = "select count(*) from comment where board_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			rs = pstmt.executeQuery();
			if(rs.next()){
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getCommentCount()�޼ҵ� ���� : " + e);
		} finally {
			if(rs!=null)try{rs.close();}catch(Exception err){err.printStackTrace();}
			if(pstmt!=null)try{pstmt.close();}catch(Exception err){err.printStackTrace();}
			if(con!=null)try{con.close();}catch(Exception err){err.printStackTrace();}
		}
		return count;
	}
	
	
		public List<CommentBean> getCommentList(int board_num){
			
			List<CommentBean> commnetList = new ArrayList<CommentBean>();
			
			try{
				con = getConnection();
				sql = "select * from comment where board_num=? order by num asc";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, board_num);
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					CommentBean commentBean = new CommentBean();
					//rs => BoardBean��ü�� �������� ����
					commentBean.setNum(rs.getInt("num"));
					commentBean.setBoard_num(rs.getInt("board_num"));
					commentBean.setId(rs.getString("id"));
					commentBean.setDate(rs.getTimestamp("date"));
					commentBean.setContent(rs.getString("content"));
					commnetList.add(commentBean);
				}//while��			
				
			}catch(Exception err){
				System.out.println("getBoardList�޼ҵ� ���ο��� ���� : " + err);
			}finally {
				//�ڿ�����
				if(rs!=null)try{rs.close();}catch(Exception err){err.printStackTrace();}
				if(pstmt!=null)try{pstmt.close();}catch(Exception err){err.printStackTrace();}
				if(con!=null)try{con.close();}catch(Exception err){err.printStackTrace();}
			}
			return commnetList;//ArrayList��ȯ
		}

		//������ �۹�ȣ�� ��۾� id�� �Ű������� ���� �޾�.. ����� DELETE���� �ϴ� �޼ҵ�
		public int deleteComment(int num, String id){
			int check = 0;
			try{
				con = getConnection();
				sql = "select id from comment where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				//�˻�
				rs = pstmt.executeQuery();
				
				if(rs.next()){//�˻��� ���� ���� �ϸ�				
					if(id.equals(rs.getString("id"))){
						sql = "delete from comment where num=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, num);
						//DELETE����
						pstmt.executeUpdate();
						check = 1;
					}else{
						return check;
					}
				}	
			}catch(Exception err){
				System.out.println("deleteComment()�޼ҵ� ���� ���� : "+err);
			}finally {
				if(rs!=null)try{rs.close();}catch(Exception err){err.printStackTrace();}
				if(pstmt!=null)try{pstmt.close();}catch(Exception err){err.printStackTrace();}
				if(con!=null)try{con.close();}catch(Exception err){err.printStackTrace();}	
			}
			
			return check;
		}//deleteComment() ��
		
		
}//CommentDAO ��
