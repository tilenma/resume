package com.tilen.util;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DecimalFormat;

public class NumberUtil {	
	private static DecimalFormat df = new DecimalFormat("######.#######");
	private static DecimalFormat df2 = new DecimalFormat("######");
	private static DecimalFormat df3 = new DecimalFormat("0.00E00");
	private static DecimalFormat df4 = new DecimalFormat("######.####");
	private static int significantNo = 3;
	
	public static String format(Double aNumber){
		return df.format(aNumber);
	}
	public static String formatNoDecimal(Double aNumber){
		return df2.format(aNumber);
	}
	
	public static String formatScientific(BigDecimal aNumber){
		return df3.format(aNumber);
	}
	
	public static String formatCoordinates(BigDecimal aNumber){
		return df4.format(aNumber);
	}
	
	public static String formatPrecision(BigDecimal aNumber){
		BigDecimal bd = aNumber;
		
		int newScale = significantNo-bd.precision()+bd.scale();
		bd = bd.setScale(newScale, RoundingMode.HALF_UP);
		
		return bd.toString();
	}
	
	public static String convertToString(BigDecimal aBigDecimal,Integer aScale){
		BigDecimal output = aBigDecimal.setScale(aScale,RoundingMode.HALF_UP);
		
		return output.toString();
	}
}
