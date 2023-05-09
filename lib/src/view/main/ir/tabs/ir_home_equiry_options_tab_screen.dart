import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yatrigan/src/controller/main/ir/ir_ctrl.dart';
import 'package:yatrigan/src/view/main/ir/screens/train_track_screen.dart';
import 'package:yatrigan/src/view/main/ir/widgets/train_search_widget.dart';
import 'package:yatrigan/src/view/widgets/animations/carousel_image.dart';

class IrHomeEnquiryOptionsTabScreen extends StatelessWidget {
  const IrHomeEnquiryOptionsTabScreen({Key? key}) : super(key: key);
  static String id = 'IrHomeEnquiryOptionsTabScreen';

  static const List<String> enquiry = [
    'Track Your Train',
    'Train Schedule',
    'PNR',
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CarouselImage(
                children: [
                  'images/main/indianrailways/obaord_train_station_info.png',
                  'images/main/indianrailways/track_your_train.png',
                  'images/main/indianrailways/train_schedule.png',
                ],
              ),
              const ListTile(
                title: Text('Track Your Train / Train Schedule'),
              ),
              TrainSearchWidget(
                onTap: (){},
                onSelected: () async {
                  await Provider.of<IrCtrl>(context, listen: false)
                      .getTrainScheduleApi(
                    context: context,
                  );
                  if (Provider.of<IrCtrl>(context, listen: false)
                      .trainSchedule !=
                      null) {
                    Navigator.pushNamed(context, TrainTrackScreen.id);
                  }
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              const ListTile(
                title: Text('Recent Searches'),
              ),
              Column(
                children: const [
                  ListTile(
                    title: Text('12506 - Northeast Express ANVT-KYQ'),
                  ),
                  ListTile(
                    title: Text('12502 - Kaveri Express ANVT-KYQ'),
                  ),
                ],
              ),
            ],
          ),
        ),
        /*child: GridView.builder(
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
        ),*/
      ),
    );
  }
}
