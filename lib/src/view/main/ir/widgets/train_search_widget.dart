import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:yatrigan/src/controller/main/ir/ir_ctrl.dart';
import 'package:yatrigan/src/model/main/ir/ir_train_list.dart';

class TrainSearchWidget extends StatelessWidget {
  final Function onSelected;
  final Function onTap;
  const TrainSearchWidget({
    Key? key,
    required this.onSelected,
    required this.onTap,
  }) : super(key: key);

  String _displayStringForOption(IrTrainListModel option) => option.train;

  @override
  Widget build(BuildContext context) {
    return Consumer<IrCtrl>(
      builder: (context, consumer, _) {
        return Autocomplete<IrTrainListModel>(
          displayStringForOption: _displayStringForOption,
          optionsBuilder: (textEditingValue) {
            if (textEditingValue.text == '') {
              return const Iterable<IrTrainListModel>.empty();
            }
            return consumer.irTrainList.where((IrTrainListModel option) {
              return option
                  .toString()
                  .contains(textEditingValue.text.toUpperCase());
            });
          },
          onSelected: (IrTrainListModel selection) async {
            consumer.train = selection.train.split("-")[0].trim();
            onSelected();
          },
          fieldViewBuilder:
              (context, controller, focusNode, onEditingComplete) {
            return TextFormField(
              onTap: () {},
              controller: controller,
              focusNode: focusNode,
              onEditingComplete: onEditingComplete,
              decoration: InputDecoration(
                prefixIcon: const Icon(FontAwesomeIcons.train),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width * 0.05,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.02,
                  horizontal: MediaQuery.of(context).size.width * 0.01,
                ),
                labelText: 'Train No / Train Name',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Train No / Train Name !';
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
