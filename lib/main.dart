import 'package:flutter/material.dart';
import 'package:poke_flutter/utils/LayoutHandler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LayoutHandler());
  }
}
