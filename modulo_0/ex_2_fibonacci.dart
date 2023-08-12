int fibonacci(int n) {
  if (n <= 0) {
    return 0;
  } else if (n == 1) {
    return 1;
  } else {
    return fibonacci(n - 1) + fibonacci(n - 2);
  }
}

void main() {
  try {
    print('Sequência de Fibonacci com 32 termos:');
    for (int i = 0; i < 32; i++) {
      print(fibonacci(i));
    }
  } catch (e) {
    print(e);
  }
}
