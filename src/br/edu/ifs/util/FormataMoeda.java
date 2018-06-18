package br.edu.ifs.util;

public class FormataMoeda {

	
	static public String toString(float valueFloat) {
		String resultado = "";
		
		int valueInt = (int)(valueFloat*100);
		
		resultado = (valueInt % 100 < 10 ? ",0":",") + (valueInt % 100);
		valueInt = valueInt / 100;
		
		while (valueInt >= 1000) {
			resultado = (valueInt % 1000 < 10 ? ".00" : valueInt % 1000 < 100 ? ".0" : ".") + (valueInt % 1000) + resultado;
			valueInt = valueInt/1000;
		}
		if (valueInt > 0 || resultado.charAt(0) == ',') {
			resultado = valueInt + resultado;
		}
		
		return "R$ " + resultado;
	}
}
