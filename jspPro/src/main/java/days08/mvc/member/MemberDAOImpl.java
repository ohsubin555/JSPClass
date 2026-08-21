package days08.mvc.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import days08.mvc.member.MemberDTO;

public class MemberDAOImpl implements MemberDAO {

    private Connection conn = null;

    public MemberDAOImpl(Connection conn) {
        this.conn = conn;
    }

    @Override
    public MemberDTO login(String id, String passwd) throws SQLException {
        String sql = "SELECT seq, id, name, role "
                   + "FROM tbl_member "
                   + "WHERE id = ? AND passwd = ?";
        
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        MemberDTO dto = null;

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, passwd);
            
            rs = pstmt.executeQuery();

            if (rs.next()) {
                dto = new MemberDTO();
                dto.setSeq(rs.getLong("seq"));
                dto.setId(rs.getString("id"));
                dto.setName(rs.getString("name"));
                dto.setRole(rs.getString("role"));
            }
        } finally {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
        }

        return dto; // 일치하는 회원이 없으면 null이 리턴됨
    }
}