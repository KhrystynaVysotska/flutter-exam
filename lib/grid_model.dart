import 'package:flutter/material.dart';
import 'dart:math';
import 'button.dart';

class GridModel extends ChangeNotifier {
  final List<Button> buttons = [];
  final Map<int, Button> gridState = {};

  void _initializeGridState() {
    buttons.clear();
    gridState.clear();

    Button newButton = Button(
      id: 0,
      cellIndex: 7,
      color: Colors.green,
    );

    buttons.add(newButton);
    gridState[7] = newButton;

    notifyListeners();
  }

  GridModel() {
    _initializeGridState();
  }

  int _chooseRandomFreeCell() {
    Random random = Random();
    int randomNumber = random.nextInt(15);
    while (gridState.containsKey(randomNumber)) {
      randomNumber = random.nextInt(15);
    }
    return randomNumber;
  }

  Button getButtonInCell(int cell) {
    return gridState[cell]!;
  }

  bool shouldBeCloned() {
    Random random = Random();
    int randomNumber = random.nextInt(100);
    if (randomNumber >= 0 && randomNumber < 25) {
      return true;
    }
    return false;
  }

  void changeButtonPosition(int cell) {
    Button buttonClicked = gridState[cell]!;

    if (gridState.length == 15) {
      if (buttonClicked.id != 0) {
        buttonClicked.color = Colors.grey;
      } else {
        _initializeGridState();
      }
    } else {
      int newCell = _chooseRandomFreeCell();

      buttonClicked.cellIndex = newCell;
      gridState[newCell] = buttonClicked;
      gridState.remove(cell);

      if (shouldBeCloned()) {
        newCell = _chooseRandomFreeCell();

        Button newButton = Button(
          id: buttons.length,
          cellIndex: newCell,
          color: Colors.red,
        );

        buttons.add(newButton);
        gridState[newCell] = newButton;
      }
    }

    notifyListeners();
  }
}
