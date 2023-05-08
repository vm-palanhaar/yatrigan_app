import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yatrigan/src/controller/main/ir/ir_ctrl.dart';
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
            Image.network(
              'https://static.toiimg.com/thumb/msid-99945650,width-1070,height-580,imgsize-155460,resizemode-75,overlay-toi_sw,pt-32,y_pad-40/photo.jpg',
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
