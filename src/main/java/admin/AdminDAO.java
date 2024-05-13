package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.GetConn;
import member.MemberVO;

public class AdminDAO {
	
	//GetConn getConn = GetConn.getInstance();
	
	private Connection conn = GetConn.getConn();
	// private Connection conn2 = GetConn.getConn(); 이렇게 새로 생성해도 싱글톤으로 만들었기때문에 conn과 같은 객체이다 !
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	MemberVO vo = null;	
	
	public void pstmtClose() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (Exception e) {}
		}
	}
	
	public void rsClose() {
		if(rs != null) {
			try {
				rs.close();
			} catch (Exception e) {} 
			finally {
				pstmtClose();
			}
		}
	}


	//회원 전체/부분 리스트
	public ArrayList<MemberVO> getMemberList(int level) {
		ArrayList<MemberVO> vos = new ArrayList<MemberVO>();
		try {
			if(level == 999) {
				sql = "select *, timestampdiff(day, lastDate, now()) as deleteDiff from member";
				pstmt = conn.prepareStatement(sql);
			}
			else {
				sql = "select *, timestampdiff(day, lastDate, now()) as deleteDiff  from member where level = ? order by idx desc";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, level);
			}
			rs = pstmt.executeQuery();
			
			MemberVO vo = null;
			while(rs.next()) {
				vo = new MemberVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setGender(rs.getString("gender"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setJob(rs.getString("job"));
				vo.setHobby(rs.getString("hobby"));
				vo.setPhoto(rs.getString("photo"));
				vo.setContent(rs.getString("content"));
				vo.setUserInfor(rs.getString("userInfor"));
				vo.setUserDel(rs.getString("userDel"));
				vo.setPoint(rs.getInt("point"));
				vo.setLevel(rs.getInt("level"));
				vo.setVisitCnt(rs.getInt("visitCnt"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setTodayCnt(rs.getInt("todayCnt"));
				
				vo.setDeleteDiff(rs.getInt("deleteDiff"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();			
		}
		return vos;
	}

	// 회원 등급 변경처리  
	public int setMemberLevelChange(int idx, int level) {
		int res = 0;
		try {
			if(level == 99) {
				sql = "update member set level = ?, userDel = 'OK', lastDate = now() where idx = ?";
			}
			else {				
				sql = "update member set level = ?, userDel = 'NO' where idx = ?";
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, level);
			pstmt.setInt(2, idx);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage()); 
		} finally {
			pstmtClose();
		}
		return res;
	}

	// 회원 DB에서 삭제처리하기
	public int MemberDeleteOk(int idx) {
		int res = 0;
		try {
			sql = "delete from member where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	//신규회원 건수
	public int getNewMemberListCount() {
		int mCount = 0;
		try {
			sql = "select count(idx) as cnt from member where level = 1";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			rs.next();
			mCount = rs.getInt("cnt");
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();			
		}
		return mCount;
	}

	// 선택한 회원 전체 등급 변경하기
	public int setSelectMemberLevelChange(String checkedItems, int level) {
		int res = 0;
		try {
			String[] checkedItemsArr = checkedItems.split("/");
			for(int i = 0; i < checkedItemsArr.length; i++) {				
				if(level == 99) {
					sql = "update member set level = ?, userDel = 'OK', lastDate = now() where idx = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, level);
					pstmt.setInt(2, Integer.parseInt(checkedItemsArr[i]));
					res = pstmt.executeUpdate();
				}
				else {				
					sql = "update member set level = ?, userDel = 'NO' where idx = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, level);
					pstmt.setInt(2, Integer.parseInt(checkedItemsArr[i]));
					res = pstmt.executeUpdate();
				}
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage()); 
		} finally {
			pstmtClose();
		}
		return res;
	}
	
}

