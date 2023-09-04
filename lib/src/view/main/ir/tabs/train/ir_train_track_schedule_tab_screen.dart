import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yatrigan/src/controller/main/ir/ir_ctrl.dart';
import 'package:yatrigan/src/model/main/ir/trainschedule/train_schedule_station.dart';
import 'package:yatrigan/src/view/main/ir/widgets/train/train_schedule_station_widget.dart';
import 'package:yatrigan/src/view/util/enum_icons.dart';
import 'package:yatrigan/src/view/widgets/fields/calendar_widget.dart';

class IrTrainTrackScheduleTabScreen extends StatefulWidget {
  const IrTrainTrackScheduleTabScreen({Key? key}) : super(key: key);

  @override
  State<IrTrainTrackScheduleTabScreen> createState() =>
      _IrTrainTrackScheduleTabScreenState();
}

class _IrTrainTrackScheduleTabScreenState
    extends State<IrTrainTrackScheduleTabScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.03,
          vertical: MediaQuery.of(context).size.height * 0.01,
        ),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              bottom: PreferredSize(
                preferredSize: Size(
                  double.infinity,
                  MediaQuery.of(context).size.height * 0.11,
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: const Text('Train Schedule'),
                      leading: Icon(IrIcon.trainSchedule.icon),
                      onTap: () {
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return SizedBox(
                              height: MediaQuery.of(context).size.height * 0.25,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    ListTile(
                                      title: const Text('Run on Days'),
                                      subtitle: Text(Provider.of<IrCtrl>(
                                              context,
                                              listen: false)
                                          .trainSchedule!
                                          .runStatus),
                                    ),
                                    ListTile(
                                      title: const Text('Duration'),
                                      trailing: Text(Provider.of<IrCtrl>(
                                              context,
                                              listen: false)
                                          .trainSchedule!
                                          .duration),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    CalendarWidget(
                      title: 'Track Train',
                      onTap: () {},
                    ),
                    const Divider(),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  TrainScheduleStation station =
                      Provider.of<IrCtrl>(context, listen: false)
                          .trainSchedule!
                          .stations
                          .elementAt(index);
                  return TrainScheduleStationWidget(
                    key: ObjectKey(station),
                    station: station,
                  );
                },
                childCount: Provider.of<IrCtrl>(context, listen: false)
                    .trainSchedule!
                    .stations
                    .length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
