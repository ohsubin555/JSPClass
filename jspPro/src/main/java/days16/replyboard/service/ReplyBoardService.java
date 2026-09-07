package days16.replyboard.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import days16.replyboard.domain.ReplyBoardDTO;
import days16.replyboard.persistence.ReplyBoardDAO;

public class ReplyBoardService {
	// 1. 싱글톤
	private ReplyBoardService() {}      
	private static ReplyBoardService instance = null;  
	public static ReplyBoardService getInstance() {   
		if(   instance == null  ) {
			instance = new ReplyBoardService();
		}
		return instance;
	}

	public List<ReplyBoardDTO> select(){
		//
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			ReplyBoardDAO dao = ReplyBoardDAO.getInstance();
			List<ReplyBoardDTO> list = null;
			list = dao.selectList(con);
			return list;
		} catch (NamingException | SQLException e) { 
			//e.printStackTrace();  syso("ListService.select() 에러 : ")
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}

	public int write( ReplyBoardDTO dto ){
		//
		Connection con = null;
		int rowCount = 0;
		try {
			con = ConnectionProvider.getConnection();
			ReplyBoardDAO dao = ReplyBoardDAO.getInstance();

			con.setAutoCommit(false);  // 트랜잭션 처리 
			// 동일한 그룹 내에 부모 스탭보다 큰 게시글의 스탭을 모두 1 증가
			if (dto.getDepth() != 0) {
	            dao.updateRefStep(con, dto.getRef(), dto.getStep()-1);
	         } // if 
          
			rowCount = dao.insert(con, dto);
			con.commit();
		} catch (NamingException | SQLException e) {
			JdbcUtil.rollback(con);
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
		return rowCount;
	}

	// 
	public ReplyBoardDTO selectOne(int num){
		//
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			ReplyBoardDAO dao = ReplyBoardDAO.getInstance();
			// 1 + 2  트랜잭션 처리 또는 로그 서비스
			con.setAutoCommit(false);         
			// 1. 조회수 증가
			dao.updateReadCount(con, num);
			// 2. 해당 게시글 정보
			ReplyBoardDTO dto = null;
			dto = dao.selectOne(con, num);
			con.commit();         
			return dto;
		} catch (NamingException | SQLException e) { 
			JdbcUtil.rollback(con);         
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}

}
