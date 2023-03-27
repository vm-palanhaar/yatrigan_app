import 'package:flutter/material.dart';
import 'package:yatrigan/src/view/main/ir/widgets/railway_station_search_widget.dart';
import 'package:yatrigan/src/view/main/ir/widgets/retail/railway_station_shop_screen_widget.dart';

class IrHomeRetailOptionsTabScreen extends StatelessWidget {
  const IrHomeRetailOptionsTabScreen({Key? key}) : super(key: key);
  static String id = 'IrHomeRetailOptionsTabScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.03,
          vertical: MediaQuery.of(context).size.height * 0.01,
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const RailwayStationSearchWidget(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const RailwayStationShopScreenWidget(),
          ],
        ),
      ),
    );
  }
}
