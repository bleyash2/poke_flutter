import 'package:flutter/material.dart';
import 'package:poke_flutter/Views/LargeLayout.dart';
import 'package:poke_flutter/Views/MediumLayout.dart';
import 'package:poke_flutter/Views/SmallLayout.dart';

class LayoutHandler extends StatelessWidget {
  const LayoutHandler({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    if (mediaQuery.size.width > 768) {
      return Scaffold(body: LargeLayout());
    } else if (mediaQuery.size.width > 425) {
      return Scaffold(body: MediumLayout());
    } else
      return Scaffold(body: SmallLayout());
  }
}
