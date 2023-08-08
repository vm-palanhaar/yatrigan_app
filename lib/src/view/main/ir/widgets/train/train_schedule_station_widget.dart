import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yatrigan/src/controller/main/ir/ir_ctrl.dart';
import 'package:yatrigan/src/model/main/ir/trainschedule/train_schedule_station.dart';
import 'package:yatrigan/src/view/main/ir/screens/ir_rail_station_screen.dart';

class TrainScheduleStationWidget extends StatelessWidget {
  final TrainScheduleStation station;
  const TrainScheduleStationWidget({
    Key? key,
    required this.station,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<IrCtrl>(context, listen: false).railStationName =
            station.station.split('-')[0].trim();
        Provider.of<IrCtrl>(context, listen: false).railStationCode =
            station.station.split('-')[1].trim();
        Navigator.pushNamed(context, IrRailStationScreen.id);
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.012,
        ),
        child: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                Card(
                  color: const Color(0xffffff01),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.02,
                      vertical: MediaQuery.of(context).size.height * 0.01,
                    ),
                    title: Container(
                      margin: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.012,
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'images/main/indianrailways/station_board.png',
                            height: MediaQuery.of(context).size.height * 0.04,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.03,
                          ),
                          Text(
                            station.station.split("-")[0].trim().toUpperCase(),
                            textDirection: TextDirection.ltr,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Distance: ${station.distance} KMS',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Day: ${station.day}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (station.halTime.isNotEmpty)
                          Text(
                            'Halt: ${station.halTime.substring(3, 5)} MINS',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.01,
                    vertical: MediaQuery.of(context).size.height * 0.01,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xfffff001),
                    borderRadius: BorderRadius.all(
                      Radius.circular(MediaQuery.of(context).size.width * 0.02),
                    ),
                  ),
                  child: Column(
                    children: [
                      if (station.arrTime.isNotEmpty)
                        Text(
                          'Arrival: ${station.arrTime.substring(0, 5)} HRS',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      if (station.arrTime.isEmpty)
                        const Text(
                          'Start Journey',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.01,
                vertical: MediaQuery.of(context).size.height * 0.01,
              ),
              decoration: BoxDecoration(
                color: const Color(0xfffff001),
                borderRadius: BorderRadius.all(
                  Radius.circular(MediaQuery.of(context).size.width * 0.02),
                ),
              ),
              child: Column(
                children: [
                  if (station.depTime.isNotEmpty)
                    Text(
                      'Departure: ${station.depTime.substring(0, 5)} HRS',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  if (station.depTime.isEmpty)
                    const Text(
                      'End Journey',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
