import 'package:flutter/material.dart';

class ErrorTextWidget extends StatelessWidget {
  final String errorText;
  const ErrorTextWidget({Key? key, required this.errorText}) : super(key: key);

  Text _errorWidget({required String error}) {
    return Text(
      error,
      style: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  List<Widget> _widget() {
    List<Widget> wgt = [];
    if (errorText.contains("[") && errorText.contains("]")) {
      String text = errorText;
      text = text.replaceAll("[", "").replaceAll("]", "");
      wgt.add(_errorWidget(error: "Following may be the reasons: "));
      int i = 1;
      text.split(",").forEach((element) {
        wgt.add(_errorWidget(error: "${i++}. ${element.trim()}"));
      });
    }
    else {
      wgt.add(_errorWidget(error: errorText));
    }
    return wgt;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _widget(),
      ),
    );
  }
}
