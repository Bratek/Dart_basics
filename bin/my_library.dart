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
    var _param = Param(a, b);
    while (_param.aboveZero()) {
      _param.modulo();
    }
    return _param.a;
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

class BinaryCalculator {
  String decToBin(int dec) {
    String _bin = '';

    while (dec > 1) {
      _bin = (dec % 2).toString() + _bin;
      dec = dec ~/ 2;
    }

    _bin = dec.toString() + _bin;
    return _bin;
  }

  int binToDec(String bin) {
    int dec = 0;

    for (int i = bin.length - 1, k = 0; i >= 0; i--, k++) {
      if (bin[i] == '1') {
        dec += pow(2, k).toInt();
      }
    }

    return dec;
  }
}

List<num> getNumFromString(String str) {
  List<num> _numList = [];

  str.split("").forEach((item) {
    if ('0123456789'.contains(item)) {
      _numList.add(num.parse(item));
    }
  });

  return _numList;
}

Map<String, int> getMapOfOccurrences(List<String> collection) {
  Map<String, int> _map = {};

  for (var element in collection) {
    _map.putIfAbsent(
        element.toString(), () => getCountOfOccurrences(element, collection));
  }
  return _map;
}

int getCountOfOccurrences(String word, List<String> collection) {
  int _count = 0;

  for (var element in collection) {
    if (element == word) _count++;
  }
  return _count;
}

Set<int> getNumbersFromCollection(List<String> collection) {
  Map<String, int> _pattern = {
    'zero': 0,
    'one': 1,
    'two': 2,
    'three': 3,
    'four': 4,
    'five': 5,
    'six': 6,
    'seven': 7,
    'eight': 8,
    'nine': 9
  };
  Set<int> _numbers = {};

  for (String elem in collection) {
    if (_pattern.containsKey(elem)) {
      _numbers.add(_pattern[elem]!.toInt());
    }
  }
  return _numbers;
}
