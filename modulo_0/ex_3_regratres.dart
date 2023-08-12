
double? regraDeTres({double? valor1, double? valor2, double? valor3, double? valor4}) {
  if (valor1 == null) {
    return (valor4! * valor2!) / valor3!;
  } else if (valor2 == null) {
    return (valor3! * valor1) / valor4!;
  } else if (valor3 == null) {
    return (valor4! * valor2) / valor1;
  } else if (valor4 == null) {
    return (valor3 * valor1) / valor2;
  } else {
    throw ArgumentError("Forneça exatamente 3 valores e deixe 1 vazio.");
  }
}

void main() {
  double? resultado = regraDeTres(
    valor2: 2,
    valor3: 3,
    valor4: 9,
  );
  print("Resultado: $resultado");
}
