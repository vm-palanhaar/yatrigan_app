import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yatrigan/src/view/main/ir/tabs/home/ir_train_tab_screen.dart';
import 'package:yatrigan/src/view/main/ir/tabs/home/ir_help_tab_screen.dart';
import 'package:yatrigan/src/view/main/ir/tabs/home/ir_rail_station_tab_screen.dart';
import 'package:yatrigan/src/view/main/ir/widgets/ir_screen_drawer.dart';
import 'package:yatrigan/src/view/util/enum_icons.dart';

class IrHomeScreen extends StatelessWidget {
  final int tabIndex;
  const IrHomeScreen({
    Key? key,
    required this.tabIndex,
  }) : super(key: key);
  static String id = 'IrHomeScreen';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: tabIndex,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Railways'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.train),
            ),
          ],
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(IrIcon.railStation.icon),
                text: 'Station',
              ),
              Tab(
                icon: Icon(IrIcon.train.icon),
                text: 'Train',
              ),
              const Tab(
                icon: Icon(Icons.help),
                text: 'Help',
              ),
            ],
          ),
        ),
        drawer: const IrScreenDrawer(),
        body: const TabBarView(
          children: <Widget>[
            IrRailStationTabScreen(),
            IrTrainTabScreen(),
            IrHelpTabScreen(),
          ],
        ),
      ),
    );
  }
}
