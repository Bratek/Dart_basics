import 'my_library.dart';

void main() {
  print('Домашнее задание 2.6.1:');

  int a = 15, b = 25;
  var dc = DelimetersCalculator();

  print('НОД = ${dc.gcd(a, b)}');
  print('НОК = ${dc.lcm(a, b)}');

  var factors = dc.primeFactors(308);

  print('Простые множители числа : $factors');
}
