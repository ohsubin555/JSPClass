package days08.mvc.member;

import java.sql.SQLException;

import days08.mvc.member.MemberDTO;

public interface MemberDAO {
    // 로그인 검증: ID와 비밀번호가 맞으면 MemberDTO 반환, 틀리면 null 반환
    MemberDTO login(String id, String passwd) throws SQLException;
}