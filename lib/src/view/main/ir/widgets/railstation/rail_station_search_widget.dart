import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yatrigan/src/controller/main/ir/ir_ctrl.dart';
import 'package:yatrigan/src/view/main/ir/screens/ir_rail_station_screen.dart';
import 'package:yatrigan/src/view/util/enum_icons.dart';
import 'package:yatrigan/src/view/widgets/fields/autocomplete_textformfield.dart';

class RailStationSearchWidget extends StatefulWidget {
  const RailStationSearchWidget({super.key});

  @override
  State<RailStationSearchWidget> createState() =>
      _RailStationSearchWidgetState();
}

class _RailStationSearchWidgetState extends State<RailStationSearchWidget> {
  List<String> railStations = [];

  @override
  void initState() {
    getRailStationsApi();
    super.initState();
  }

  Future getRailStationsApi() async {
    if (Provider.of<IrCtrl>(context, listen: false)
        .railStations
        .stations
        .isEmpty) {
      await Provider.of<IrCtrl>(context, listen: false).getRailStationsApi(
        context: context,
      );
    }
    setState(() {
      railStations =
          Provider.of<IrCtrl>(context, listen: false).railStations.stations;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AutoCompleteTextFormFieldWidget(
      list: railStations,
      icon: IrIcon.railStation.icon,
      labelText: 'Railway Station',
      onSelect: (String selection) async {
        Provider.of<IrCtrl>(context, listen: false).railStationName =
            selection.split('-')[0].trim();
        Provider.of<IrCtrl>(context, listen: false).railStationCode =
            selection.split('-')[1].trim();
        Navigator.pushNamed(context, IrRailStationScreen.id);
      },
    );
  }
}
