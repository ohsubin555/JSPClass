package days04;

import java.util.Collections;

public class Test {
	
	private static String makePlaceholders(int count) {
	       return String.join(",", Collections.nCopies(count, "?"));
	   }

	public static void main(String[] args) {
		System.out.println(makePlaceholders(5));

	}

}
