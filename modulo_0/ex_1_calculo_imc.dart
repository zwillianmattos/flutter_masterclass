void main() {
  try {

    IMC imc = IMC(
      altura: 1.89,
      peso: 89.0,
    );

    print("IMC:${imc.calcular()}");
    print("Relatorio: ${imc.relatorio()}");
  } catch (e) {
    print(e);
  }
}

class IMC {
  double peso;
  double altura;
  IMC({required this.altura, required this.peso});

  double calcular() {
    return (peso / (altura * altura)).floorToDouble();
  }

  String relatorio() {
    double calculo = calcular();
    String resultado = '';
    if (calculo <= 18.5) {
        resultado = "Abaixo do peso (Magreza)";
    } else if (calculo <= 24.9) {
        resultado = "Peso Normal";
    } else if (calculo <= 29.9) {
        resultado = "Sobrepeso";
    } else if (calculo <= 34.9) {
        resultado = "Obesidade Grau I";
    } else if (calculo <= 40.0) {
        resultado = "Obesidade Grau II";
    } else {
        resultado = "Obesidade Grau III";
    }

    return resultado;
  }
}
