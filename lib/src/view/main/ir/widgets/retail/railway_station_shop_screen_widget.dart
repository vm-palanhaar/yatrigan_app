import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yatrigan/src/controller/main/ir/ir_ctrl.dart';
import 'package:yatrigan/src/model/main/ir/ir_shop_list_model.dart';

import 'railway_station_shop_widget.dart';

class RailwayStationShopScreenWidget extends StatefulWidget {
  const RailwayStationShopScreenWidget({Key? key}) : super(key: key);
  static String id = 'RailwayStationShopScreenWidget';

  @override
  State<RailwayStationShopScreenWidget> createState() =>
      _RailwayStationShopScreenWidgetState();
}

class _RailwayStationShopScreenWidgetState
    extends State<RailwayStationShopScreenWidget> {
  @override
  void initState() {
    _getRailwayStationShopListApi();
    super.initState();
  }

  void _getRailwayStationShopListApi() async {
    await Provider.of<IrCtrl>(context, listen: false)
        .getRailwayStationShopListApi(
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<IrCtrl>(
      builder: (context, consumer, _) {
        if (consumer.irStationShopList.isNotEmpty) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: consumer.irStationShopList.length,
            itemBuilder: (context, index) {
              IrShopListModel shop =
                  consumer.irStationShopList.elementAt(index);
              return RailwayStationShopWidget(
                key: ObjectKey(shop),
                shop: shop,
              );
            },
          );
        }
        return Container();
      },
    );
  }
}
