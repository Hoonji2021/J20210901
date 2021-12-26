package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class PicDao {
	private static PicDao instance;
	private PicDao() {}
	
	public static PicDao getInstance() {
		if(instance==null) {
			instance = new PicDao();
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
	
	public Pic select(int pid) throws SQLException {
	      Connection conn = null;
	      Statement stmt = null;
	      ResultSet rs = null;
	      
	      String sql = "select * from pictures where pid="+pid;
	      Pic pic = new Pic();
	      try {
	         conn=getConnection();
	         stmt = conn.createStatement();
	         rs = stmt.executeQuery(sql);
	         
	         
	         if(rs.next()) {
	            pic.setPid(rs.getInt(1));
	            pic.setPsave(rs.getString("psave"));
	            pic.setPlike(rs.getInt("plike"));
	            pic.setPdown(rs.getInt("pdown"));
	            pic.setPcount(rs.getInt("pcount"));
	            pic.setId(rs.getString("id"));
	            pic.setP_date(rs.getDate("p_date"));
	            pic.setPcomment(rs.getString("pcomment"));
	           
	         }
	      } catch (SQLException e) {
	         System.out.println(e.getMessage());
	      }finally {
	         if(conn!=null) conn.close();
	         if(stmt!=null) stmt.close();
	         if(rs!=null) rs.close();
	      }
	   
	      return pic;
	   }

	   public void pcount(int pid) throws SQLException {
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      String sql = "update pictures set pcount=pcount+1 where pid=?";
	      
	      
	      try {
	         conn=getConnection();
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, pid);
	         pstmt.executeUpdate();
	         
	      } catch (SQLException e) {
	         System.out.println(e.getMessage());
	      }finally {
	         if(pstmt!=null) pstmt.close();
	         if(conn!=null) conn.close();
	      }
	      
	   }
	   
	// 첫 화면, 인덱스
	   public List<Pic> search() {
	      List<Pic> list = new ArrayList<Pic>();

	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;

	      String sql = "select PID, PCOUNT, P_DATE, PSAVE from (select * from pictures order by p_date desc) where rownum <= 16";
	      try {
	         conn = getConnection();
	         pstmt = conn.prepareStatement(sql);
	         rs = pstmt.executeQuery();

	         while (rs.next()) {
	            Pic pic = new Pic();
	            pic.setPid(rs.getInt("PID"));
	            pic.setP_date(rs.getDate("P_DATE"));
	            pic.setPcount(rs.getInt("PCOUNT"));
	            pic.setPsave(rs.getString("PSAVE"));
	            
	            list.add(pic);
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         try {
	            conn.close();
	            pstmt.close();
	            rs.close();
	         } catch (Exception e2) {
	            e2.printStackTrace();
	         }
	      }
	      return list;
	   }
	   
	   // 사진 검색 기능, 2페이지, 찐메인
//	   public List<Pic> search(String search, String searchPageNum) {
//	      List<Pic> list = new ArrayList<Pic>();
//	      
//	      Connection conn = null;
//	      PreparedStatement pstmt = null;
//	      ResultSet rs = null;
//	      int spn = Integer.parseInt(searchPageNum);
//	      
//	      String sql = "select l.* from (select a.*, rownum brwNum from (select p.PID, PCOUNT, P_DATE, PSAVE  from PICTURES p, (select PID from TAGS where TAG = ?) t where p.PID=t.PID order by P_DATE desc) a ) l where brwNum BETWEEN ? AND ?";
//	      try {
//	         conn = getConnection();
//	         pstmt = conn.prepareStatement(sql);
//	         pstmt.setString(1, search);
//	         pstmt.setInt(2, 1+(spn-1)*16);
//	         pstmt.setInt(3, spn*16);
//	         rs = pstmt.executeQuery();
//	         
//	         while(rs.next()) {
//	            Pic pic = new Pic();
//	            pic.setPid(rs.getInt("PID"));
//	            pic.setP_date(rs.getDate("P_DATE"));
//	            pic.setPcount(rs.getInt("PCOUNT"));
//	            pic.setPsave(rs.getString("PSAVE"));
//	            pic.setRownum(rs.getString("BRWNUM"));
//	            list.add(pic);
//	         }
//	      } catch (Exception e) {
//	         e.printStackTrace();
//	      } finally {
//	         try {
//	            conn.close();
//	            pstmt.close();
//	            rs.close();
//	         } catch (Exception e2) {
//	            e2.printStackTrace();
//	         }
//	      }
//	      return list;
//	   }
	   
	// 사진 검색 기능, 2페이지, 찐메인
	      public List<Pic> search(String search, String searchPageNum, int pid) {
	         List<Pic> list = new ArrayList<Pic>();
	         
	         int picNum = 16;
	         Connection conn = null;
	         PreparedStatement pstmt = null;
	         ResultSet rs = null;
	         int spn = Integer.parseInt(searchPageNum);
	         
	         String sql = "select l.* from (select a.*, rownum brwNum from (select p.PID, PCOUNT, P_DATE, PSAVE  from PICTURES p, (select PID from TAGS where TAG = ?) t where p.PID=t.PID order by P_DATE desc) a ) l where brwNum BETWEEN ? AND ?";
	         try {
	            conn = getConnection();
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, search);
	            pstmt.setInt(2, 1+(spn-1)*picNum);
	            pstmt.setInt(3, spn*picNum);
	            rs = pstmt.executeQuery();
	            
	            while(rs.next()) {
	               Pic pic = new Pic();
	               
	               if(rs.getInt("PID")!=pid) {
	               pic.setPid(rs.getInt("PID"));
	               pic.setP_date(rs.getDate("P_DATE"));
	               pic.setPcount(rs.getInt("PCOUNT"));
	               pic.setPsave(rs.getString("PSAVE"));
	               pic.setRownum(rs.getString("BRWNUM"));
	               list.add(pic);
	               }
	            }
	         } catch (Exception e) {
	            e.printStackTrace();
	         } finally {
	            try {
	               conn.close();
	               pstmt.close();
	               rs.close();
	            } catch (Exception e2) {
	               e2.printStackTrace();
	            }
	         }
	         
	         
	        
	         
	         return list;
	      }
	   
	   
	   
	   public int insertPictures(Pic picVO) {
		 	String psave = picVO.getPsave()!=null?picVO.getPsave():null;
			String id = picVO.getId()!=null?picVO.getId():null;
			String pcomment = picVO.getPcomment()!=null?picVO.getPcomment():null;
			if("".equals(psave) || "".equals(id) || "".equals(pcomment)) {
				return -1; 
			}
			
			Connection conn = null;	
			PreparedStatement pstmt= null;
			ResultSet rs = null;
			int new_pid = -1;
			String sql_pid = "SELECT nvl(max(pid),0) FROM pictures";
			String sql = "INSERT INTO PICTURES(PID,PSAVE,ID,P_DATE,PCOMMENT,PLIKE,PDOWN,PCOUNT)VALUES";
				   sql +="(?, ?, ?, sysdate, ?,0,0,0)";
				   
			int flag = -1;
			try {
				conn = getConnection();
				
				pstmt = conn.prepareStatement(sql_pid);
				rs = pstmt.executeQuery();
				rs.next();
				new_pid = rs.getInt(1) + 1;  
				
				
				rs.close();   
				pstmt.close();
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, new_pid);
				pstmt.setString(2, psave);
				pstmt.setString(3, id);
				pstmt.setString(4, pcomment);
				
				flag = pstmt.executeUpdate();
			
				
			} catch(Exception e) {
				System.out.println(e.getMessage()); 
			} finally {
				if (rs !=null) try { rs.close();} catch(Exception e) {}
				if (pstmt != null) try { pstmt.close();} catch(Exception e) {}
				if (conn !=null) try { conn.close();} catch(Exception e) {}
			}
			if(flag>0) return new_pid;
			else return flag;
		}
	
	   
	   
	   // 검색 사진 총 페이지 수
	      public int getTotalPage(String search) {
	         int tot = 0;
	         Connection conn = null;
	         PreparedStatement pstmt = null;
	         ResultSet rs = null;
	         String sql = "select count(*) from pictures where pid in (select pid from tags where tag=?)";
	         
	         try {
	            conn = getConnection();
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, search);
	            rs=pstmt.executeQuery();
	            if(rs.next()) {
	               tot=(rs.getInt(1) / 16);   
	               if(rs.getInt(1) / 16 != 0)
	                  tot++;
	               if(tot==0)
	            	   tot = 1;
	            }
	         } catch (Exception e) {
	            e.printStackTrace();
	         } finally {
	               try {
	                  if(rs != null) rs.close();
	                  if(pstmt != null) pstmt.close();
	                  if(conn != null) conn.close();
	               } catch (SQLException e) {
	                  e.printStackTrace();
	               }
	         }
	         return tot;
	      }
	      public int downloadCount(int pid) throws SQLException {
			   Connection conn = null;
			   PreparedStatement pstmt = null;
			   String sql = null;
			   
			   
			   
			   int result =0 ; 
				   sql = "update pictures set pdown = pdown+1 where pid = ?";
			   try {
				   conn = getConnection();
				   pstmt = conn.prepareStatement(sql);
				   pstmt.setInt(1, pid);
				   
				   result = pstmt.executeUpdate();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}finally {
				if(pstmt != null)	pstmt.close();
				if(conn != null)	conn.close();
			}
			   return result;
		   }// end of downloadCount
	      
	   // 업로드, 다운로드, 좋아요 사진 총 페이지 수
	      public int getTotalMyPage(int n, String id) {
	         int tot = 0;
	         Connection conn = null;
	         PreparedStatement pstmt = null;
	         ResultSet rs = null;
	         String sql = "select count(*) from pictures where pid in (select pid from actives where type = ? and id in (select id from members where id = ?))";
	         try {
	            conn = getConnection();
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setInt(1, n);
	            pstmt.setString(2, id);
	            rs = pstmt.executeQuery();
	            if (rs.next()) {
	               tot = (rs.getInt(1) / 16);
	               if (rs.getInt(1) / 16 != 0)
	                  tot++;
	               if (tot == 0)
	                  tot = 1;
	            }
	         } catch (Exception e) {
	            e.printStackTrace();
	         } finally {
	            try {
	               if (rs != null)
	                  rs.close();
	               if (pstmt != null)
	                  pstmt.close();
	               if (conn != null)
	                  conn.close();
	            } catch (Exception e) {
	               e.printStackTrace();
	            }
	         }
	         return tot;
	      }
	      
	      public List<Pic> myPage(int n, String id, String myPageNum) {
	          List<Pic> list = new ArrayList<Pic>();
	             
	             Connection conn = null;
	             PreparedStatement pstmt = null;
	             ResultSet rs = null;
	             int mpun = Integer.parseInt(myPageNum);
	             
	             String sql = "select z.*, brwNum from (select l.*, rownum brwNum from (select p.PID, PCOUNT, P_DATE, PSAVE from pictures p, (select * from actives where type = ? and id in (select id from members where id = ?)) b where p.pid=b.pid order by P_DATE desc) l) z where brwNum BETWEEN ? AND ?";
	             try {
	                conn = getConnection();
	                pstmt = conn.prepareStatement(sql);
	                pstmt.setInt(1, n);
	                pstmt.setString(2, id);
	                pstmt.setInt(3, 1+(mpun-1)*16);
	                pstmt.setInt(4, mpun*16);
	                rs = pstmt.executeQuery();
	                while(rs.next()) {
	                   Pic pic = new Pic();
	                   pic.setPid(rs.getInt("PID"));
	                   pic.setP_date(rs.getDate("P_DATE"));
	                   pic.setPcount(rs.getInt("PCOUNT"));
	                   pic.setPsave(rs.getString("PSAVE"));
	                   pic.setRownum(rs.getString("BRWNUM"));
	                   list.add(pic);
	                }
	             } catch (Exception e) {
	                e.printStackTrace();
	             } finally {
	                try {
	                   conn.close();
	                   pstmt.close();
	                   rs.close();
	                } catch (Exception e2) {
	                   e2.printStackTrace();
	                }
	             }
	             return list;
	       }
	       
	      public int addlike(int pid) throws SQLException {
	  		
	  		Connection conn = null;
	  		PreparedStatement pstmt = null;
	  		int n =0;
	  		String sql = "update pictures set plike=plike+1 where pid=?";
	  		
	  		try {
	  			conn = getConnection();
	  			pstmt=conn.prepareStatement(sql);
	  			pstmt.setInt(1, pid);
	  				n = pstmt.executeUpdate();
	  			if(n>0) {
	  				//코밋
	  				conn.commit();
	  				System.out.println("plike +1 성공");
	  			}else {
	  			conn.rollback();
	  			System.out.println("plike +1 실패");
	  			}
	  		} catch (SQLException e) {
	  			System.out.println(e.getMessage());
	  		}finally {
	  			if(conn!=null) conn.close();
	  			if(pstmt!=null) pstmt.close();
	  		}
	  		return n;
	  	}
	      
	      public int remlike(int pid) throws SQLException {
	  		Connection conn = null;
	  		PreparedStatement pstmt = null;
	  		int n = 0;
	  		String sql = "update pictures set plike=plike-1 where pid=?";
	  		
	  		try {
	  			conn = getConnection();
	  			pstmt=conn.prepareStatement(sql);
	  			pstmt.setInt(1, pid);
	  			n = pstmt.executeUpdate();
	  			if(n>0) {
	  				//코밋
	  				conn.commit();
	  				System.out.println("plike -1 성공");
	  			}else {
	  			conn.rollback();
	  			System.out.println("plike -1 실패");
	  			}
	  			
	  		} catch (SQLException e) {
	  			// TODO Auto-generated catch block
	  			e.printStackTrace();
	  		}finally {
	  			if(conn!=null) conn.close();
	  			if(pstmt!=null) pstmt.close();
	  		}
	  		return n;
	  		
	  	}

	  	public int pcommentUpdate(Pic pic, String id, int pid) throws SQLException {
	  		int result = 0;
	  		Connection conn= null;
	  		PreparedStatement pstmt = null;
	  		
	  		String sql = "update pictures set pcomment=? where id=? and pid=?";
	  		
	  		
	  		try {
	  			conn=getConnection();
	  			pstmt = conn.prepareStatement(sql);
	  			pstmt.setString(1, pic.getPcomment());
	  			pstmt.setString(2, id);
	  			pstmt.setInt(3, pid);
	  			result = pstmt.executeUpdate();
	  			
	  		} catch (SQLException e) {
	  			System.out.println(e.getMessage());
	  		}finally {
	  			if(conn!=null) conn.close();
	  			if(pstmt!=null) conn.close();
	  		}
	  		
	  		return result;
	  	}
	  	
	  	public int delete(int pid) throws SQLException {
			Connection conn = null;
			PreparedStatement pstmt = null;
			int Presult = 0;
			
			String sql = "delete from pictures where pid=?";
			
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, pid);
				Presult = pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}finally {
				if(conn!=null) conn.close();
				if(pstmt!=null) pstmt.close();
			}

			return Presult;
		}

		public int findLikeCnt(int pid) throws SQLException {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int likeCnt = 0;
			
			String sql = "select plike from pictures where pid=?";
		
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, pid);
				
				rs = pstmt.executeQuery();
				if(rs.next()) {
					likeCnt = rs.getInt("plike");
				}
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}finally {
				if(conn!=null) conn.close();
				if(pstmt!=null) pstmt.close();
				if(rs != null) rs.close();
			}
			
			return likeCnt;
		}

	  	
	  	
	  	
}
