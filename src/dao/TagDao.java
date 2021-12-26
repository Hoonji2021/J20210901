package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class TagDao {
	private static TagDao instance;
	private TagDao() {}
	
	public static TagDao getInstance() {
		if(instance==null) {
			instance = new TagDao();
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
	
	public List<String> select(int pid) throws SQLException {
	      Connection conn = null;
	      Statement stmt = null;
	      ResultSet rs = null;
	      String sql = "select tag from tags where pid="+pid;
	      List<String> list = new ArrayList<String>();
	      
	      try {
	         conn=getConnection();
	         stmt=conn.createStatement();
	         rs=stmt.executeQuery(sql);
	         
	         while(rs.next()) {
	            list.add(rs.getString(1));
	         }
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }finally {
	         if(conn!=null) conn.close();
	         if(stmt!=null) stmt.close();
	         if(rs!=null) rs.close();
	      }
	   
	      return list;
	   }
	
	public int insertTag(Tag tag) throws SQLException {
		int result = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "insert into tags(pid,pseq,tag) values(?,?,?) ";
		
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, tag.getPid());
			pstmt.setInt(2, tag.getPseq());
			pstmt.setString(3, tag.getTag());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if(conn!=null) conn.close();
			if(pstmt!=null) pstmt.close();
		}
		
		
		return result;
	}

	public List<String> selectTag(List<Pic> list) throws SQLException {
		List<String> tagList = new ArrayList<String>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Iterator<Pic> iter = list.iterator();
		Pic pic = new Pic();
		int pid = 0;
		while(iter.hasNext()) {
			pic = (Pic)iter.next();
			pid = pic.pid;
			String sql = "select tag from tags where pid = ? and pseq = 1";
			
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, pid);
				rs = pstmt.executeQuery();
				if(rs.next()) {
				tagList.add(rs.getString(1));}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				if(conn!=null) conn.close();
				if(pstmt!=null) pstmt.close();
				if(rs!=null) rs.close();
			}
			
		}
		
		return tagList;
	}
	public int deleteTag(int pid) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete from tags where pid = ?";
		
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pid);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return result;
	}
}
