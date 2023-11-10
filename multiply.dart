import 'dart:async';
import 'dart:io';

void main() async {
  List<int> numbers = await promptList('Virgülle ayırarak tam sayıların bir listesini girin: ');

  List<int> modifiedList = await multiplyList(numbers);

  print('Değiştirilmiş liste: $modifiedList');
}

Future<List<int>> multiplyList(List<int> numbers) async {
  List<Future<int>> modifiedNumbers = numbers.map((number) => multiply(number)).toList();

  List<int> result = await Future.wait(modifiedNumbers);
  return result;
}

Future<int> multiply(int number) async {
  return await Future(() => number * 2);
}

Future<List<int>> promptList(String message) async {
  print(message);
  String? input = await Future(() => stdin.readLineSync());
  if (input != null) {
    List<String> numberStrings = input.split(',');
    List<int> numbers = [];
    for (String numberString in numberStrings) {
      numbers.add(int.parse(numberString.trim()));
    }
    return numbers;
  } else {
    return [];
  }
}
