import 'dart:async';
import 'dart:io';

void main() async {
  int firstNumber = int.parse(await prompt('İlk sayıyı giriniz: '));
  int secondNumber = int.parse(await prompt('İkinci sayıyı giriniz: '));

  await Future.delayed(Duration(seconds: 3));

  int sum = firstNumber + secondNumber;
  print('$firstNumber ve $secondNumber sayılarının toplamı: $sum');
}

Future<String> prompt(String message) {
  print(message);
  String? input = stdin.readLineSync();
  if (input != null) {
    return Future.value(input);
  } else {
    return Future.value("");
  }
}
