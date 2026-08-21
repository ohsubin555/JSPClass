package article.service;

import java.util.Map;

import article.model.Writer;

import lombok.AllArgsConstructor;
import lombok.Getter;
@Getter
@AllArgsConstructor
//글쓰기시 입력할 값을 저장할 클래스. [Record]
public class WriteRequest {

	private Writer writer;
	private String title;
	private String content;

	public void validate(Map<String, Boolean> errors) {
		if (title == null || title.trim().isEmpty()) {
			errors.put("title", Boolean.TRUE);
		}
	}
}
