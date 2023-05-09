import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:provider/provider.dart';
import 'package:yatrigan/src/controller/main/ir/ir_ctrl.dart';
import 'package:yatrigan/src/view/main/ir/widgets/railway_station_search_widget.dart';
import 'package:yatrigan/src/view/main/ir/widgets/retail/railway_station_shop_screen_widget.dart';
import 'package:yatrigan/src/view/main/ir/widgets/train_search_widget.dart';
import 'package:yatrigan/src/view/widgets/animations/carousel_image.dart';

class IrHomeRetailOptionsTabScreen extends StatelessWidget {
  const IrHomeRetailOptionsTabScreen({Key? key}) : super(key: key);
  static String id = 'IrHomeRetailOptionsTabScreen';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.03,
        vertical: MediaQuery.of(context).size.height * 0.01,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const CarouselImage(
              children:  [
                'images/main/indianrailways/obaord_train_station_info.png',
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            RailwayStationSearchWidget(
              stationList: Provider.of<IrCtrl>(context, listen: false).irStationList,
              onSelected: () async {
                await Provider.of<IrCtrl>(context, listen: false)
                    .getRailwayStationShopListApi(
                  context: context,
                );
              },
            ),
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
