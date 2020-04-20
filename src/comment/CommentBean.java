package comment;

import java.sql.*;

public class CommentBean {
	
	public CommentBean(){}
	private int num; // ´ñ±Û ±Û¹øÈ£
	private int board_num; // °Ô½Ã±Û ¹øÈ£
	private String id; // ´ñ±Û ÀÛ¼ºÀÚ
	private Timestamp date; // ´ñ±Û ÀÛ¼ºÀÏ
	private String content; // ´ñ±Û ³»¿ë
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	
}
