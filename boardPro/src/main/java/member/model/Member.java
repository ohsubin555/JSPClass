package member.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@Builder
@NoArgsConstructor
public class Member {

   private String id;
   private String name;
   private String password;
   private Date regDate;

   public boolean matchPassword(String pwd) {
      return password.equals(pwd);
   }

   public void changePassword(String newPwd) {
      this.password = newPwd;
   }

}
