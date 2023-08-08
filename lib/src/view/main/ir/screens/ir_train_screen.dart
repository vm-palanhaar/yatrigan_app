import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yatrigan/src/controller/main/ir/ir_ctrl.dart';
import 'package:yatrigan/src/view/main/ir/tabs/train/ir_train_services_screen.dart';
import 'package:yatrigan/src/view/util/enum_icons.dart';

import '../tabs/train/ir_train_track_schedule_tab_screen.dart';

class IrTrainScreen extends StatelessWidget {
  const IrTrainScreen({Key? key}) : super(key: key);
  static String id = 'IrTrainScreen';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '${Provider.of<IrCtrl>(context, listen: false).trainSchedule!.trainNo} - ${Provider.of<IrCtrl>(context, listen: false).trainSchedule!.trainName}',
          ),
          bottom:  TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(IrIcon.train.icon),
                text: 'Track/Schedule',
              ),
              Tab(
                icon: Icon(IrIcon.trainAmenities.icon),
                text: 'Services',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            IrTrainTrackScheduleTabScreen(),
            IrTrainServicesTabScreen(),
          ],
        ),
      ),
    );
  }
}
