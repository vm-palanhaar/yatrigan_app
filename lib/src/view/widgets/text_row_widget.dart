import 'package:flutter/material.dart';

class TextRowWidget extends StatelessWidget {
  final String header;
  final String value;
  const TextRowWidget({
    required this.header,
    required this.value,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.035,
        vertical: MediaQuery.of(context).size.height * 0.005,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Text(
              header,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.height * 0.018,
              ),
            ),
          ),
          SizedBox(
            child: Text(
              value,
            ),
          ),
        ],
      ),
    );
  }
}
