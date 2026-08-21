package jspPro;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.regex.Pattern;

import org.doit.domain.DeptVO;

public class Sample {
     
	 public static void main(String[] args) {
		System.out.println();
		ArrayList<DeptVO> list = new ArrayList<DeptVO>();
		list.forEach((dvo) -> {
			System.out.printf("<option value='%d'>%s<option>\n"
					, dvo.getDeptno(), dvo.getDname());
		});
		
				
	}
	
}
