import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final Function onPressed;

  const CustomElevatedButton(
      {Key? key, required this.title, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.015,
      ),
      child: ElevatedButton(
        onPressed: () => onPressed(),
        style: ElevatedButton.styleFrom(
          fixedSize: Size(
            MediaQuery.of(context).size.width * 0.9,
            MediaQuery.of(context).size.height * 0.05,
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.height * 0.02,
          ),
        ),
      ),
    );
  }
}
