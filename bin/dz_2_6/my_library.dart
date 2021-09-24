library dart_dasic_2_6;

import 'dart:math';

class Param {
  int _num1, _num2;

  Param(this._num1, this._num2);

  int get a => _num1;

  // Обмен значениями
  void swap() {
    int _tmp;

    _tmp = _num1;
    _num1 = _num2;
    _num2 = _tmp;
  }

  // Остаток от деления
  void modulo() {
    if (_num1 < _num2) swap();
    _num1 %= _num2;
    swap();
  }

  // Больше нуля
  bool aboveZero() {
    return _num2 > 0;
  }
}

class DelimetersCalculator {
  int gcd(int a, int b) {
    var param = Param(a, b);
    while (param.aboveZero()) {
      param.modulo();
    }
    return param.a;
  }

  int lcm(int a, int b) => (a / gcd(a, b) * b).toInt();

  List<int> primeFactors(double x) {
    List<int> factors = [];

    for (int i = 2; i <= sqrt(x); i++) {
      while (x % i == 0) {
        factors.add(i);
        x /= i;
      }
    }
    if (x != 1) {
      factors.add(x.toInt());
    }

    return factors;
  }
}