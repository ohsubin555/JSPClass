package days08.mvc.member;

public class MemberDTO {
    private long seq;
    private String id;
    private String passwd;
    private String name;
    private String role;

    public MemberDTO() {}

    public MemberDTO(long seq, String id, String passwd, String name, String role) {
        this.seq = seq;
        this.id = id;
        this.passwd = passwd;
        this.name = name;
        this.role = role;
    }

    // Getter / Setter
    public long getSeq() { return seq; }
    public void setSeq(long seq) { this.seq = seq; }

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getPasswd() { return passwd; }
    public void setPasswd(String passwd) { this.passwd = passwd; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }
}