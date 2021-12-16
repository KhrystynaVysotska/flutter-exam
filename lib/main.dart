import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'grid_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => GridModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Exam',
      debugShowCheckedModeBanner: false,
      home: Scaffold(backgroundColor: Colors.indigo, body: GridScreen()),
    );
  }
}

class GridScreen extends StatelessWidget {
  const GridScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GridModel>(
      builder: (context, grid, child) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: (_, index) => grid.gridState.containsKey(index)
              ? grid.getButtonInCell(index)
              : Container(),
          itemCount: 15,
        );
      },
    );
  }
}
