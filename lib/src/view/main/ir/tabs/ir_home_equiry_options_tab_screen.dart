import 'package:flutter/material.dart';

class IrHomeEnquiryOptionsTabScreen extends StatelessWidget {
  const IrHomeEnquiryOptionsTabScreen({Key? key}) : super(key: key);
  static String id = 'IrHomeEnquiryOptionsTabScreen';

  static const List<String> enquiry = [
    'Track Your Train',
    'Train Schedule',
    'Train Between Stations',
    'PNR',
    'Station List',
    'Station Details',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.03,
          vertical: MediaQuery.of(context).size.height * 0.01,
        ),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: enquiry.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.03,
                vertical: MediaQuery.of(context).size.height * 0.01,
              ),
              child: Text(enquiry.elementAt(index)),
            );
          },
        ),
      ),
    );
  }
}
