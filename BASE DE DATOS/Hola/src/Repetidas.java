import java.util.Scanner;

public class Repetidas {

	public static void main(String[] args) {
		Scanner lector = new Scanner(System.in);
		System.out.println("Ingrese el mensaje cifrado");
		String cadena = lector.nextLine();

		String[] cad = cadena.split(" ");
		String cadena_final = "";
		for (int i = 0; i < cad.length; i++) {
			String cadena_obtenida = cad[i];
			char a = caracterRepetido(cadena_obtenida);
			cadena_final += a;
		}
		System.out.println("El mensaje oculto es: ");
		System.err.println(cadena_final + "");
		lector.close();
	}

	public static char caracterRepetido(String cadena) {
		int contador = 0;
		char caracter = 0;
		char bandera_rp = 'N';
		String cadena_aux = cadena;
		while (cadena.length() != 0) {
			int contadorAux = 0;
			for (int j = 1; j < cadena.length(); j++) {
				if (cadena.charAt(0) == cadena.charAt(j)) {
					contadorAux++;
					bandera_rp = 'S';
				}
			}
			if (contadorAux > contador && contadorAux==1) {
				contador = contadorAux;
				caracter = cadena.charAt(0);
			}
			cadena = cadena.replaceAll(cadena.charAt(0) + "", "");
		}
		if (bandera_rp == 'N') {
			int num = cadena_aux.length() - 1;
			caracter = cadena_aux.charAt(num);
		}
		return caracter;
	}
}