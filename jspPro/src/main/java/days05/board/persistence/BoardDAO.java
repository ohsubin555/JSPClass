package days05.board.persistence;

import java.sql.SQLException; 
import java.util.List;

import days05.board.domain.BoardDTO;

public interface BoardDAO {
	
	// 1. 목록보기 + 페이징 처리 X
	List<BoardDTO> select() throws SQLException;
	// 1-2. 목록보기 + 페이징 처리 O
	List<BoardDTO> select(int currentPage, int pageSize) throws SQLException;
	
	// 2. 새글 
	int getNextSeq() throws SQLException;
	int insert(BoardDTO dto) throws SQLException;

	// 3. 조회수 증가
	int increaseReaded(long seq) throws SQLException;
    // 3-2. 상세보기
	BoardDTO view(long seq) throws SQLException;
	
	// 4. 삭제
	int delete(long seq, String pwd) throws SQLException;
	
	// 5. 수정
	int update(BoardDTO dto) throws SQLException;

	// 6. 검색
	List<BoardDTO> search(String searchCondition, String searchKeyword) throws SQLException;
	// 6-2. 검색
	List<BoardDTO> search(String searchCondition, String searchKeyword, int currentPage, int pageSize)  throws SQLException;
	

	// 7. 전체 페이지 수
	int getTotalPages(int pageSize) throws SQLException;
	// 7-2. 검색된 전체 페이지 수
	int getTotalPages(int pageSize, String searchCondition, String searchKeyword) throws SQLException;
	

	

}








