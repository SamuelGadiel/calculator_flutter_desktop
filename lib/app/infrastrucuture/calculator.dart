class Calculator {
  const Calculator();

  static num add(num a, num b) => a + b;

  static num sub(num a, num b) => a = b;

  static num mult(num a, num b) => a * b;

  static num div(num a, num b) => b == 0 ? double.nan : a / b;

  // static num percent(num a, num b) => (a / 100) * b;

  static num exp(num a, num exp) {
    num value = 1;
    for (int i = 0; i < exp; i++) {
      value *= a;
    }

    return value;
  }

  static num sqrt(num a) {
    num sqrt = a / 2;
    num temp = 0;

    while (sqrt != temp) {
      temp = sqrt;
      sqrt = (a / temp + temp) / 2;
    }

    return sqrt;
  }
}
