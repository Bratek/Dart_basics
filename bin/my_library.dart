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

class BinaryCalculator {
  String decToBin(int dec) {
    String bin = '';

    while (dec > 1) {
      bin = (dec % 2).toString() + bin;
      dec = dec ~/ 2;
    }

    bin = dec.toString() + bin;
    return bin;
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
  List<num> numList = [];

  str.split("").forEach((item) {
    if ('0123456789'.contains(item)) {
      numList.add(num.parse(item));
    }
  });

  return numList;
}

Map<String, int> getMapOfOccurrences(List<String> collection) {
  Map<String, int> map = {};

  for (var element in collection) {
    map.putIfAbsent(
        element.toString(), () => getCountOfOccurrences(element, collection));
  }
  return map;
}

int getCountOfOccurrences(String word, List<String> collection) {
  int count = 0;

  for (var element in collection) {
    if (element == word) count++;
  }
  return count;
}

Set<int> getNumbersFromCollection(List<String> collection) {
  Map<String, int> pattern = {
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
  Set<int> numbers = {};

  for (String elem in collection) {
    if (pattern.containsKey(elem)) {
      numbers.add(pattern[elem]!.toInt());
    }
  }
  return numbers;
}

class Point {
  double _x;
  double _y;
  double _z;

  Point(this._x, this._y, this._z);

  //Единичный вектор. Направление от (0.0.0) задается параметром vector
  factory Point.unitVector(Point vector) {
    double distVector =
        sqrt(pow(vector.x, 2) + pow(vector.y, 2) + pow(vector.z, 2));
    return Point(
        vector.x / distVector, vector.y / distVector, vector.z / distVector);
  }

  factory Point.random() {
    Random rand = Random();
    return Point(rand.nextDouble(), rand.nextDouble(), rand.nextDouble());
  }

  factory Point.zero() {
    return Point(0, 0, 0);
  }

  double get x => _x;
  double get y => _y;
  double get z => _z;

  double distanceTo(Point another) {
    final double distance = sqrt(pow(another.x - _x, 2) +
        pow(another.y - _y, 2) +
        pow(another.z - _z, 2));

    return distance;
  }
}

double areaOfTeiangle(Point p1, Point p2, Point p3) {
  double a = p1.distanceTo(p2);
  double b = p2.distanceTo(p3);
  double c = p3.distanceTo(p1);
  double p = (a + b + c) / 2;
  double s = sqrt(p * (p - a) * (p - b) * (p - c));

  return s;
}

extension AdditionalFunction on num {
  double rootOfDegree(int degree) {
    double eps = 0.001;
    double original = toDouble();
    double rn = original;
    double root = rn / degree;

    if (degree % 2 == 0 && isNegative) {
      throw ArgumentError('Отрицательное основание');
    }

    while ((root - rn).abs() >= eps) {
      rn = original;
      for (int i = 1; i < degree; i++) {
        rn = rn / root;
      }
      root = (rn + root) / 2;
    }
    return root;
  }
}
