package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class MemberDao {
	private static MemberDao instance;
	private MemberDao() {}
	
	public static MemberDao getInstance() {
		if(instance==null) {
			instance = new MemberDao();
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
	
	public Member member_select(String id) throws SQLException {
		Member member= null;
		
		if(id==null) return null;
		
		Connection conn= null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from members where id = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member = new Member();
				member.setId(rs.getString(1));
				member.setPasswd(rs.getString(2));
				member.setName(rs.getString(3));
				member.setPhone(rs.getString(4));
				member.setEmail(rs.getString(5));
				member.setNickname(rs.getString(6));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			if(conn!=null) conn.close();
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
		}
		
		return member;
	}
	public int memberCheck(String id, String passwd) throws SQLException {
		int result = 1;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select id, passwd, state from members where id = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(1).equals(id)) {
					if(rs.getString(2).equals(passwd)) {
						result = 1;
					}else {result=0;}
				}
				
			}else {result=-1;}
			
			if(rs.getInt(3)==3) {
				result=2;
			}else if(rs.getInt(3)==1) {
				result=3;
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			if(conn!=null) conn.close();
			if(pstmt!=null)pstmt.close();
			if(rs!=null)rs.close();
		}
		
		
		return result;
	}
	public int updateInfo(Member member) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = "update members set passwd=?, name=?, phone=?, email=?, nickname=? where id=?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getPasswd());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getPhone());
			pstmt.setString(4, member.getEmail());
			pstmt.setString(5, member.getNickname());
			pstmt.setString(6, member.getId());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if(pstmt != null)	pstmt.close();
			if(conn != null)	conn.close();
		}
		return result;
	}
	
	public int deletemember(String id, String passwd) throws SQLException {
		Connection conn = null; PreparedStatement pstmt= null;
		int result = 0;			
		String sql="update members set state=3  where id=? and passwd=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			result = pstmt.executeUpdate();// 완성sql을 ,db에서 가지고가서 실행-> 성공하면 result=1, 아니면 result=0
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return result;

	}
	
	public int member_state(String id) throws SQLException {
		
		int state=2;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select state from members where id = ?";
		
		if(id==null) {
			return state;
		}
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				state = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(conn!=null) conn.close();
			if(pstmt!=null) pstmt.close();
			if(rs!=null) rs.close();
		}
		
		return state;
	}
	
	public int insertMember(Member member) throws SQLException {
		int result = 0;
		Connection conn = null;
		String sql = "insert into members values(?,?,?,?,?,?,sysdate,?)"; 
		PreparedStatement pstmt = null; 
//		System.out.println("여기가 다오다!!!!");
		try { 
			// DBCP 이용한 연결 
			conn  = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPasswd());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getPhone());
			pstmt.setString(5, member.getEmail()); 
			pstmt.setString(6, member.getNickname()); 
			pstmt.setInt(7, member.getState()); 
			result = pstmt.executeUpdate();
			System.out.println("result->"+result);
			System.out.println("Memberdao->회원가입 성공!");
		} catch(Exception e) { 
			System.out.println(e.getMessage());
		
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		
		return result;
	}
	public String findMember(String name, String phone) throws SQLException {
		String id = null;
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		try {
			
			String sql="select id from members where name=? and phone=?";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, name);
			pstmt.setString(2, phone);
			
			rs = pstmt.executeQuery();
				
			if(rs.next())
				id=rs.getString(1);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if(conn!=null) conn.close();
			if(pstmt!=null) pstmt.close();
			if(rs!=null) rs.close();
		}
		
		return id;
	}
	public String findMember(String id, String phone, String email) throws SQLException{
		String passwd = null;
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		try {
			
			String sql="select passwd from members where id=? and phone=? and email=?";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, phone);
			pstmt.setString(3, email);
			
			rs = pstmt.executeQuery();
				
			if(rs.next())
				passwd=rs.getString(1);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if(conn!=null) conn.close();
			if(pstmt!=null) pstmt.close();
			if(rs!=null) rs.close();
		}
		
		return passwd;
	}
}
