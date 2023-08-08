import 'package:flutter/material.dart';
import 'package:yatrigan/src/view/main/ir/widgets/train/train_search_widget.dart';
import 'package:yatrigan/src/view/main/ir/widgets/train/trains_recent_search_widget.dart';
import 'package:yatrigan/src/view/widgets/animations/carousel_image.dart';

class IrTrainTabScreen extends StatelessWidget {
  const IrTrainTabScreen({Key? key}) : super(key: key);

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
              /*const CarouselImage(
                children: [
                  'images/main/indianrailways/obaord_train_station_info.png',
                  'images/main/indianrailways/track_your_train.png',
                  'images/main/indianrailways/train_schedule.png',
                ],
              ),*/
              const ListTile(
                title: Text('Track Your Train / Train Schedule'),
              ),
              const TrainSearchWidget(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              const TrainsRecentSearchWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
