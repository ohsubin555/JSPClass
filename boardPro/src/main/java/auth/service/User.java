package auth.service;

import lombok.AllArgsConstructor;
import lombok.Getter;

//인증받은 사용자의 정보를 저장할 클래스. - 세션 "authUser"
@Getter
@AllArgsConstructor
public class User {

   private String id;
   private String name;
   // 권한
   // 정보

}