import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yatrigan/src/controller/main/ir/ir_ctrl.dart';
import 'package:yatrigan/src/view/main/ir/screens/ir_train_screen.dart';
import 'package:yatrigan/src/view/util/enum_icons.dart';
import 'package:yatrigan/src/view/widgets/fields/autocomplete_textformfield.dart';

class TrainSearchWidget extends StatefulWidget {
  const TrainSearchWidget({super.key});

  @override
  State<TrainSearchWidget> createState() => _TrainSearchWidgetState();
}

class _TrainSearchWidgetState extends State<TrainSearchWidget> {
  List<String> trains = [];

  @override
  void initState() {
    getTrainsApi();
    super.initState();
  }

  Future getTrainsApi() async {
    if (Provider.of<IrCtrl>(context, listen: false).irTrains.trains.isEmpty) {
      await Provider.of<IrCtrl>(context, listen: false)
          .getTrainsApi(context: context);
    }
    setState(() {
      trains = Provider.of<IrCtrl>(context, listen: false).irTrains.trains;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AutoCompleteTextFormFieldWidget(
      list: Provider.of<IrCtrl>(context, listen: false).irTrains.trains,
      labelText: 'Train No - Train Name',
      icon: IrIcon.train.icon,
      onSelect: (String selection) async {
        Provider.of<IrCtrl>(context, listen: false).postTrainsRsDb(
          train: selection,
        );
        Provider.of<IrCtrl>(context, listen: false).getTrainsRsDb();
        Provider.of<IrCtrl>(context, listen: false).trainNo =
            selection.split('-')[0].trim();
        Provider.of<IrCtrl>(context, listen: false).trainName =
            selection.split('-')[1].trim();
        await Provider.of<IrCtrl>(context, listen: false).getTrainScheduleApi(
          context: context,
        );
        setState(() {
          if (Provider.of<IrCtrl>(context, listen: false).trainSchedule !=
              null) {
            Navigator.pushNamed(context, IrTrainScreen.id);
          }
        });
      },
    );
  }
}
