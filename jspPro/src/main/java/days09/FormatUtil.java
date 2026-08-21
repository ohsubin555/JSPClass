package days09;

import java.text.DecimalFormat;

public class FormatUtil {
   public static String staticNumber(long price, String pattern) {
	   DecimalFormat df = new DecimalFormat(pattern);
	   return df.format(price);
   }
   public static String instanceNumber(long price, String pattern) {
	   DecimalFormat df = new DecimalFormat(pattern);
	   return df.format(price);
   }
}
