import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yatrigan/src/controller/main/ir/ir_ctrl.dart';
import 'package:yatrigan/src/model/main/ir/ir_station_list_model.dart';

class RailwayStationSearchWidget extends StatefulWidget {
  const RailwayStationSearchWidget({Key? key}) : super(key: key);

  @override
  State<RailwayStationSearchWidget> createState() =>
      _RailwayStationSearchWidgetState();
}

class _RailwayStationSearchWidgetState
    extends State<RailwayStationSearchWidget> {
  @override
  void initState() {
    _getRailwayStationListApi();
    super.initState();
  }

  void _getRailwayStationListApi() async {
    await Provider.of<IrCtrl>(context, listen: false)
        .getRailwayStationListApi(context: context);
  }

  String _displayStringForOption(IrStationListModel option) => option.name;

  @override
  Widget build(BuildContext context) {
    return Consumer<IrCtrl>(
      builder: (context, consumer, _) {
        return Autocomplete<IrStationListModel>(
          displayStringForOption: _displayStringForOption,
          optionsBuilder: (textEditingValue) {
            if (textEditingValue.text == '') {
              return const Iterable<IrStationListModel>.empty();
            }
            return consumer.irStationList
                .where((IrStationListModel option) {
              return option
                  .toString()
                  .contains(textEditingValue.text.toUpperCase());
            });
          },
          onSelected: (IrStationListModel selection) async {
            consumer.stationCode = selection.code;
            consumer.railwayStation = selection;
            await consumer.getRailwayStationShopListApi(
              context: context,
            );
          },
          fieldViewBuilder:
              (context, controller, focusNode, onEditingComplete) {
            return TextFormField(
              controller: controller,
              focusNode: focusNode,
              onEditingComplete: onEditingComplete,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.train),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.02,
                ),
                labelText: 'Railway Station',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Railway Station !';
                }
                return null;
              },
            );
          },
        );
      },
    );
  }
}
