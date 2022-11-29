// ignore_for_file: avoid_print

import 'dart:io';

void main() {
  stdout.writeln("========Tugas Ke-1========");
  tugas1(List<int> angka) {
    var newList = [];

    for (int i = 0; i < angka.length; i++) {
      var save = 1;
      for (int j = 0; j < angka.length; j++) {
        if (i == j) {
          continue;
        }

        save = save * angka[j];
        // print("$test");
        // print("");
      }
      newList.add(save);
    }
    print("$newList");
  }

  tugas1([2, 6, 5, 3]);

  print("");

  print("========Tugas Ke-2========");

  String reversedWord(String input) => input.split('').reversed.join('');

  bool isPalindrome(String input) {
    String reversed = reversedWord(input);
    if (reversed != input) {
      return false;
    }
    return true;
  }

  tugas2(String input) {
    String reversed = reversedWord(input);
    bool check = isPalindrome(input);

    stdout.writeln(reversed);

    if (check == true) {
      check = true;
      stdout.writeln("$check");
    } else {
      check = false;
      stdout.writeln("$check");
    }
    stdout.write("Kata yang telah dibalik: $reversed");
    stdout.writeln("");
  }

  tugas2("civic");
  stdout.writeln("");
  tugas2("civil");
  stdout.writeln("");
}
