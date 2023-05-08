import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yatrigan/src/controller/main/ir/ir_ctrl.dart';
import 'package:yatrigan/src/model/main/ir/trainschedule/train_schedule_station.dart';
import 'package:yatrigan/src/view/main/ir/widgets/train_schedule_station_widget.dart';

class TrainScheduleScreen extends StatefulWidget {
  const TrainScheduleScreen({Key? key}) : super(key: key);
  static String id = 'TrainScheduleScreen';

  @override
  State<TrainScheduleScreen> createState() => _TrainScheduleScreenState();
}

class _TrainScheduleScreenState extends State<TrainScheduleScreen> {

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
              title: Text(
                '${Provider.of<IrCtrl>(context, listen: false).trainSchedule!.trainNo} - ${Provider.of<IrCtrl>(context, listen: false).trainSchedule!.trainName}',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.visible,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.timeline),
                ),
              ],
              bottom: PreferredSize(
                preferredSize: Size(
                  double.infinity,
                  MediaQuery.of(context).size.height * 0.14,
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: const Text('Run on Days'),
                      subtitle: Text(Provider.of<IrCtrl>(context, listen: false)
                          .trainSchedule!
                          .runStatus),
                    ),
                    ListTile(
                      title: const Text('Duration'),
                      trailing: Text(Provider.of<IrCtrl>(context, listen: false)
                          .trainSchedule!
                          .duration),
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
