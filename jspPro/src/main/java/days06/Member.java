package days06;

import java.io.Serializable;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;
// JAVA Beans
// 자바빈 규약
@Getter
@Setter
public class Member implements Serializable {
	
   /**
	 * 
	 */
	private static final long serialVersionUID = 1808734751366884235L;
   private String id;
   private String name;
   private String passwd;
   private String email;
   private Date registerDate;
   
}
