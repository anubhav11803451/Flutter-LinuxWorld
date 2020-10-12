import 'package:flutter/material.dart';
import 'package:quotely/widgets/themeListTile.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: themeListTile(context),
      ),
    );
  }
}
