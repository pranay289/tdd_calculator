import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_calculator/string_calculator.dart';

void main() {
  late StringCalculator stringCalculator;

  setUp(() {
    stringCalculator = StringCalculator();
  });
  test("String addition with delimeter", () {
    expect(stringCalculator.add("//;\n1;2"), 3);
  });
  test("String addition with comma seperated", () {
    expect(stringCalculator.add("1,2"), 3);
  });
  test("String addition with multiple negative numbers", () {
    expect(stringCalculator.add("1\n2,3"), 6);
  });
  test("String addition with negative number", () {
    expect(stringCalculator.add("1\n2,-3"),
        throwsA(isA<Exception>().having((data) => data.toString(), "", "")));
  });

  test("String addition with multiple negative numbers", () {
    expect(stringCalculator.add("1\n2,-3,-8"),
        throwsA(isA<Exception>().having((data) => data.toString(), "", "")));
  });
}
