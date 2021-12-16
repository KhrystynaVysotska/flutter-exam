import 'package:flutter/material.dart';
import 'dart:math';

class GridModel extends ChangeNotifier {
  final Map<int, int> gridState = {7: 0};

  void changeButtonPosition(int cell) {
    Random random = Random();
    int randomNumber = random.nextInt(15);
    while (randomNumber == cell) {
      randomNumber = random.nextInt(15);
    }
    gridState[randomNumber] = gridState[cell] ?? 0;
    gridState.remove(cell);

    notifyListeners();
  }
}