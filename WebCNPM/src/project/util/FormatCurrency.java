package project.util;

import java.text.NumberFormat;
import java.util.Locale;

public class FormatCurrency {
	public String formatCurrency(int n) {
		Locale localeVN = new Locale("vi", "VN");
	    NumberFormat currencyVN = NumberFormat.getCurrencyInstance(localeVN);
	    String str1 = currencyVN.format(n);
	    return str1;
	}
}
