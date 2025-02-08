class StringCalculator {
  StringCalculator._();
  static final StringCalculator _instance = StringCalculator._();
  factory StringCalculator() => _instance;

  // Method to add numbers
  int add(String numbers) {
    // If the string is empty, return 0
    List<int> negatives = [];
    if (numbers.isEmpty) {
      return 0;
    }
    RegExp regExp = RegExp(r'-?\d+');
    final matches = regExp.allMatches(numbers).toList();
    final numberList = matches
        .map((match) => int.tryParse(match.group(0) ?? "0") ?? 0)
        .toList();
    // Initialize a variable to store the sum of the numbers
    int sum = 0;
    // Loop through the list of numbers
    for (int number in numberList) {
      // Convert the string to an integer and add it to the sum
      if (number < 0) {
        negatives.add(number);
      }

      sum += number;
    }
    if (negatives.length > 1 && negatives.isNotEmpty) {
      throw Exception(
          "Negative numbers are not allowed ${negatives.join(",")}");
    } else if (negatives.isNotEmpty) {
      throw Exception("Negative number is not allowed");
    }
    // Return the sum
    return sum;
  }
}
