package article.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
//게시글 정보를 저장할 클래스 
@Getter
@AllArgsConstructor
public class Article {

   private Integer number;
   private Writer writer;  // id, name
   private String title;
   private Date regDate;
   private Date modifiedDate;
   private Integer readCount;

  
}
