package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ActiveDao {
	private static ActiveDao instance;
	private ActiveDao() {}
	
	public static ActiveDao getInstance() {
		if(instance==null) {
			instance = new ActiveDao();
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
	
	public int insertActive(Active active) throws SQLException {
		int result=0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into actives values (?,?,?)";
		
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, active.getId());
			pstmt.setInt(2, active.getPid());
			pstmt.setInt(3, active.getType());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(conn!=null) conn.close();
			if(pstmt!=null) pstmt.close();
		}
		
		
		return result;
	}
	
	public void activeDownload(String id, int pid, int type) throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql1 = "select * from actives where id = ? and pid = ? and type = ?";
		String sql = "insert into actives values (?,?,?)";
		ResultSet rs = null;
		
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, id);
			pstmt.setInt(2, pid);
			pstmt.setInt(3, type);
			
			rs = pstmt.executeQuery();
			
			pstmt.close();
			
			if(!rs.next()) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setInt(2, pid);
				pstmt.setInt(3, type);
			
				pstmt.executeUpdate();
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if(pstmt != null)	pstmt.close();
			if(conn != null)	conn.close();
			if(rs!= null) rs.close();
		}
		
	}
	public void inserttype(int pid, String id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into actives values(?,?,1)";
		
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, pid);
			int n = pstmt.executeUpdate();
			if(n>0) {
				//코밋
				conn.commit();
				System.out.println("insert type 성공");
			}else {
			conn.rollback();
			System.out.println("insert type 실패");
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			if(conn!=null) conn.close();
			if(pstmt!=null) pstmt.close();
		
		}
		
	}
	
	public void deletetype(int pid, String id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete from actives where id=? and pid=? and type=1";
		 
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, pid);
			int n = pstmt.executeUpdate();
			if(n>0) {
				//코밋
				conn.commit();
				System.out.println("delete type 성공");
			}else {
			conn.rollback();
			System.out.println("delete type 실패");
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			if(conn!=null) conn.close();
			if(pstmt!=null) pstmt.close();
		
		}
		
		
	}
	public int deleteUtype(int pid, String id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int Aresult = 0;
		
		String sql = "delete from actives where pid=? and id=?";
		
		try {
			conn=getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pid);
			pstmt.setString(2, id);
			Aresult = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			if(conn!=null) conn.close();
			if(pstmt!=null) pstmt.close();
		}

		return Aresult;
	}
	public int findlike(int pid, String id) throws SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select type from actives where id=? and pid=?";
		int acttype = 0;
		
		
		try {
			conn=getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, pid);
			rs=pstmt.executeQuery();
			
			
			if(rs.next()) {
				int num = rs.getInt(1);
				System.out.println("rs.getInt(1)->"+rs.getInt(1));
				if(num==1) {
					acttype = 1;//좋아요 한적이 있음
				}else {
					acttype = 0;//좋아요 한적이 없음
				}
			}else {
				acttype=0; // sql문 실행 결과 없음(좋아요 한적이 없음)
			}
			System.out.println("ActDao findLike acttype ->"+acttype);
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			
		}finally {
			if(conn!=null) conn.close();
			if(pstmt!=null) pstmt.close();
			if(rs!=null) rs.close();
		}
		
		
		return acttype;
	}
	
	public void activeDownload(String id, int pid) throws SQLException{
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      
	      String sql = "insert into actives values (?,?,3)";
	      
	      try {
	         conn = getConnection();
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, id);
	         pstmt.setInt(2, pid);
	         
	         pstmt.executeUpdate();
	         
	      } catch (Exception e) {
	         System.out.println(e.getMessage());
	      }finally {
	         if(pstmt != null)   pstmt.close();
	         if(conn != null)   conn.close();
	      }
	      
	   } 
	public Active select(String id, int pid, int type) throws SQLException {
	      Active active = new Active();
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      
	      String sql = "select * from actives where id=? and pid=? and type=?";
	      
	      
	      try {
	         conn=getConnection();
	         pstmt=conn.prepareStatement(sql);
	         pstmt.setString(1, id);
	         pstmt.setInt(2, pid);
	         pstmt.setInt(3, type);
	         rs=pstmt.executeQuery();
	         if(rs.next()) {
	            active.setId(rs.getString("id"));
	            active.setPid(rs.getInt("pid"));
	            active.setType(rs.getInt("type"));
	            System.out.println("ad.select():active.getId()->"+active.getId());
	         }
	      } catch (SQLException e) {
	         System.out.println(e.getMessage());
	      }finally {
	         if(conn!=null) conn.close();
	         if(pstmt!=null) pstmt.close();
	         if(rs!=null) rs.close();
	      }
	      
	      return active;
	   }
	
}
