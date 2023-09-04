import 'package:flutter/material.dart';
import 'package:yatrigan/src/view/main/ir/widgets/railstation/rail_station_search_widget.dart';

class IrRailStationTabScreen extends StatelessWidget {
  const IrRailStationTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.03,
          vertical: MediaQuery.of(context).size.height * 0.01,
        ),
        child: const SingleChildScrollView(
          child: Column(
            children:  [
              /*CarouselImage(
                children: [
                  'images/main/indianrailways/obaord_train_station_info.png',
                ],
              ),*/
              RailStationSearchWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
