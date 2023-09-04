import 'package:flutter/material.dart';

class IrTrainServicesTabScreen extends StatelessWidget {
  const IrTrainServicesTabScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.03,
          vertical: MediaQuery.of(context).size.height * 0.01,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.announcement,
                size: MediaQuery.of(context).size.height * 0.1,
              ),
              Text(
                'Coming Soon with new exciting features.',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
