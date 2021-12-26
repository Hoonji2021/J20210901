package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ReplyDao {

	private static ReplyDao instance;
	private ReplyDao() {}
		
	public static ReplyDao getInstance() {
		if(instance==null) {
			instance = new ReplyDao();
		}
		return instance;
	}
	
	private Connection getConnection() {
		Connection conn = null;
		
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)
					ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}
	
	public List<Reply> select(int pid) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from replys where pid=? order by prseq desc";
		List<Reply> list = new ArrayList<Reply>();
		
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, pid);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				Reply reply = new Reply();
				reply.setPid(rs.getInt("pid"));
				reply.setPrseq(rs.getInt("prseq"));
				reply.setId(rs.getString("id"));
				reply.setReply(rs.getString("reply"));
				reply.setPr_date(rs.getDate("pr_date"));
				list.add(reply);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			if(conn!=null) conn.close();
			if(pstmt!=null) pstmt.close();
			if(rs!=null) rs.close();
		}
		
		return list;
	}

	public int insertReply(String id, int pid, String reply) throws SQLException {
		System.out.println("여기는 ReplyDao의 insertReply메서드");
		System.out.println("id->"+id);
		System.out.println("pid->"+pid);
		System.out.println("reply->"+reply);
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into replys values(?,prseq.nextval,?,?,sysdate)";
		
		
		try {
			conn=getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pid);
			pstmt.setString(2, id);
			pstmt.setString(3, reply);
			result = pstmt.executeUpdate();
			System.out.println("댓글 insert 성공");

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			if(conn!=null) conn.close();
			if(pstmt!=null) pstmt.close();
		}
		
		return result;
	}

	public Reply selectReply(int prseq, String id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from replys where prseq=? and id=?";
		Reply reply = new Reply();
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, prseq);
			pstmt.setString(2, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				reply.setId(rs.getString("id"));
				reply.setPid(rs.getInt("pid"));
				reply.setPrseq(rs.getInt("prseq"));
				reply.setReply(rs.getString("reply"));
				reply.setPr_date(rs.getDate("pr_date"));
			}
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			if(conn!=null) conn.close();
			if(pstmt!=null) pstmt.close();
			if(rs!=null) rs.close();
		}
		
		return reply;
	}

	public int updateReply(String reply, int prseq) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "update replys set reply=? where prseq=?";
		
		
		try {
			conn=getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reply);
			pstmt.setInt(2, prseq);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			if(conn!=null) conn.close();
			if(pstmt!=null) pstmt.close();
		}
		
		
		return result;
	}

	public int deleteReply(int prseq) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "delete from replys where prseq=?";
		
		try {
			conn=getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, prseq);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			if(conn!=null) conn.close();
			if(pstmt!=null) pstmt.close();
		}
		
		return result;
	}
		
}
