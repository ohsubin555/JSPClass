package article.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class ArticleContent {

   private Integer number;
   private String content;

}//null 일 수 있음.
