import 'my_library.dart';

void main() {
  print('Домашнее задание 2.6.1:');

  int a = 15, b = 25;
  var dc = DelimetersCalculator();

  print('НОД = ${dc.gcd(a, b)}');
  print('НОК = ${dc.lcm(a, b)}');

  var factors = dc.primeFactors(308);

  print('Простые множители числа : $factors');

  print('\nДомашнее задание 2.6.2:');

  var bc = BinaryCalculator();

  String bin = bc.decToBin(2021);
  print('bin = $bin');

  var dec = bc.binToDec(bin);
  print('dec = $dec');

  print('\nДомашнее задание 2.6.3:');
  var numList = getNumFromString('Th1s 5tr1ng c0nt4ins numb3r5');
  print('Num list: $numList');

  print('\nДомашнее задание 2.6.4:');
  List<String> _collection = [
    'cat',
    'dog',
    'cow',
    'horse',
    'dog',
    'cow',
    'cow',
    'rooster',
    'cow',
    'hen',
    'hen',
    'hen',
    'hen',
    'cat',
    'hen',
    'cow',
    'hen',
    'hen',
  ];
  var _map = getMapOfOccurrences(_collection);
  print('Map вхождений: $_map');
}
