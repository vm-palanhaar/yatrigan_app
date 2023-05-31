import 'package:flutter/material.dart';

class IrHelpTabScreen extends StatelessWidget {
  const IrHelpTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.03,
          vertical: MediaQuery.of(context).size.height * 0.01,
        ),
      ),
    );
  }
}
