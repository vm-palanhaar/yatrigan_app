import 'package:flutter/material.dart';

class ConnToutScreen extends StatelessWidget {
  const ConnToutScreen({Key? key}) : super(key: key);
  static String id = 'ConnToutScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.02,
            vertical: MediaQuery.of(context).size.height * 0.02,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.app_blocking,
                  size: MediaQuery.of(context).size.height * 0.2,
                  color: Colors.red,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                Text(
                  'We\'re currently experiencing heavy traffic in our app. We '
                      'apologize for any inconvenience caused and appreciate '
                      'your patience.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                  ),
                ),
                Text(
                  'Our team is actively working to resolve '
                      'the issue and ensure smooth functionality.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
