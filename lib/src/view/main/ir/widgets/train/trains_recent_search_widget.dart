import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yatrigan/src/controller/main/ir/ir_ctrl.dart';
import 'package:yatrigan/src/view/main/ir/screens/ir_train_screen.dart';

class TrainsRecentSearchWidget extends StatefulWidget {
  const TrainsRecentSearchWidget({Key? key}) : super(key: key);

  @override
  State<TrainsRecentSearchWidget> createState() =>
      _TrainsRecentSearchWidgetState();
}

class _TrainsRecentSearchWidgetState extends State<TrainsRecentSearchWidget> {
  List<ListTile> widgets = [];

  @override
  void initState() {
    getTrainsRsDb();
    super.initState();
  }

  Future getTrainsRsDb() async {
    await Provider.of<IrCtrl>(context, listen: false).getTrainsRsDb();
    setState(() {
      if (Provider.of<IrCtrl>(context, listen: false).trainsRs.isNotEmpty) {
        widgets.add(
          ListTile(
            title: const Text('Recent Searches'),
            trailing: CircleAvatar(
              child: IconButton(
                  onPressed: () async {
                    widgets.clear();
                    await Provider.of<IrCtrl>(context, listen: false)
                        .deleteTrainsRsDb();
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.clear,
                  )),
            ),
          ),
        );
        createList();
      }
    });
  }

  void createList() {
    for (String train in Provider.of<IrCtrl>(context, listen: false).trainsRs) {
      widgets.add(
        ListTile(
          title: Text(train),
          onTap: () async {
            Provider.of<IrCtrl>(context, listen: false).trainNo =
                train.split('-')[0].trim();
            Provider.of<IrCtrl>(context, listen: false).trainName =
                train.split('-')[1].trim();
            await Provider.of<IrCtrl>(context, listen: false)
                .getTrainScheduleApi(
              context: context,
            );
            setState(() {
              if (Provider.of<IrCtrl>(context, listen: false).trainSchedule !=
                  null) {
                Navigator.pushNamed(context, IrTrainScreen.id);
              }
            });
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widgets,
    );
  }
}
