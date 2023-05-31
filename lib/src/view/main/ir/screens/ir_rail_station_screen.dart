import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yatrigan/src/controller/main/ir/ir_ctrl.dart';
import 'package:yatrigan/src/view/main/ir/tabs/railstation/ir_rail_station_info_screen.dart';
import 'package:yatrigan/src/view/main/ir/tabs/railstation/ir_rail_station_shops_tab_screen.dart';
import 'package:yatrigan/src/view/util/enum_icons.dart';

class IrRailStationScreen extends StatelessWidget {
  const IrRailStationScreen({Key? key}) : super(key: key);
  static String id = 'IrRailStationScreen';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '${Provider.of<IrCtrl>(context, listen: false).railStationName} - ${Provider.of<IrCtrl>(context, listen: false).railStationCode}',
          ),
          bottom:  TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(IrIcon.stationStalls.icon),
                text: 'Stalls',
              ),
              Tab(
                icon: Icon(IrIcon.stationAmenities.icon),
                text: 'Info',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            IrRailStationShopsTabScreen(),
            IrRailStationInfoTabScreen(),
          ],
        ),
      ),
    );
  }
}
