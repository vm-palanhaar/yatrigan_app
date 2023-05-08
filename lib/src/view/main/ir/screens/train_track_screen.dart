import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yatrigan/src/controller/main/ir/ir_ctrl.dart';
import 'package:yatrigan/src/model/main/ir/trainschedule/train_schedule_station.dart';
import 'package:yatrigan/src/view/main/ir/screens/train_schedule_screen.dart';
import 'package:yatrigan/src/view/main/ir/widgets/train_schedule_station_widget.dart';

class TrainTrackScreen extends StatefulWidget {
  const TrainTrackScreen({Key? key}) : super(key: key);
  static String id = 'TrainTrackScreen';

  @override
  State<TrainTrackScreen> createState() => _TrainTrackScreenState();
}

class _TrainTrackScreenState extends State<TrainTrackScreen> {
  String pDay = '';
  String cDay = '';
  String tDay = '';

  @override
  void initState() {
    DateTime yest = DateTime.now().add(const Duration(days: -1));
    DateTime curt = DateTime.now();
    DateTime tomm = DateTime.now().add(const Duration(days: 1));
    pDay = '${yest.day} ${_getMonth(month: yest.month)}';
    cDay = '${curt.day} ${_getMonth(month: curt.month)}';
    tDay = '${tomm.day} ${_getMonth(month: tomm.month)}';
    super.initState();
  }

  String _getMonth({required int month}) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'Aug';
      case 9:
        return 'Sept';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
    }
    return '';
  }

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
                    Navigator.pushNamed(context, TrainScheduleScreen.id);
                  },
                  icon: const Icon(Icons.access_time),
                ),
              ],
              bottom: PreferredSize(
                preferredSize: Size(
                  double.infinity,
                  MediaQuery.of(context).size.height * 0.1,
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: const Text('Date'),
                      subtitle: Row(
                        children: [
                          FilterChip(
                              label: Text(pDay), onSelected: (bool value) {}),
                          FilterChip(
                              label: Text(cDay), onSelected: (bool value) {}),
                          FilterChip(
                              label: Text(tDay), onSelected: (bool value) {}),
                        ],
                      ),
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
