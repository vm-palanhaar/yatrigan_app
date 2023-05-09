import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yatrigan/src/controller/main/ir/ir_ctrl.dart';
import 'package:yatrigan/src/model/main/ir/ir_station_list_model.dart';

class RailwayStationSearchWidget extends StatelessWidget {
  final List<IrStationListModel> stationList;
  final Function onSelected;

  const RailwayStationSearchWidget({
    Key? key,
    required this.onSelected,
    required this.stationList,
  }) : super(key: key);

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
            return stationList.where((IrStationListModel option) {
              return option
                  .toString()
                  .contains(textEditingValue.text.toUpperCase());
            });
          },
          onSelected: (IrStationListModel selection) async {
            consumer.stationCode = selection.code;
            consumer.railwayStation = selection;
            onSelected();
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
                  borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width * 0.05,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.02,
                  horizontal: MediaQuery.of(context).size.width * 0.01,
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
