import 'grid_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Button extends StatelessWidget {
  Button({
    Key? key,
    required this.id,
    required this.color,
    required this.cellIndex,
  }) : super(key: key);

  int id;
  Color color;
  int cellIndex;

  @override
  Widget build(BuildContext context) {
    return Consumer<GridModel>(
      builder: (context, grid, child) {
        return Material(
          child: IconButton(
            icon: Icon(
              Icons.circle,
              color: color,
              size: 40.0,
            ),
            onPressed: () => grid.changeButtonPosition(cellIndex),
          ),
        );
      },
    );
  }
}
