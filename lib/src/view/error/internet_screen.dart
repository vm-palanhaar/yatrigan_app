import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class InternetScreen extends StatefulWidget {
  const InternetScreen({Key? key}) : super(key: key);
  static String id = 'InternetScreen';

  @override
  State<InternetScreen> createState() => _InternetScreenState();
}

class _InternetScreenState extends State<InternetScreen> {
  dynamic subscription;
  @override
  initState() {
    super.initState();
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result.name != 'none') {
        setState(() {
          Navigator.pop(context);
        });
      }
    });
  }

  @override
  dispose() {
    subscription.cancel();
    super.dispose();
  }

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
                  Icons.sync_disabled,
                  size: MediaQuery.of(context).size.height * 0.2,
                  color: Colors.red,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                Text(
                  'We are not able to communicate with Yatrigan!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                  ),
                ),
                Text(
                  'Try to connect any network with internet!',
                  textAlign: TextAlign.center,
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
