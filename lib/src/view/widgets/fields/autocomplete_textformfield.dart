import 'package:flutter/material.dart';

class AutoCompleteTextFormFieldWidget extends StatelessWidget {
  final List<String> list;
  final IconData icon;
  final String? labelText;
  final Function onSelect;

  const AutoCompleteTextFormFieldWidget(
      {Key? key,
      required this.list,
      required this.icon,
      this.labelText,
      required this.onSelect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.01,
      ),
      child: Autocomplete<String>(
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text == '') {
            return const Iterable<String>.empty();
          }
          return list.where((String option) {
            return option.toLowerCase().contains(textEditingValue.text);
          });
        },
        fieldViewBuilder: (context, controller, focusNode, onEditingComplete) {
          return TextFormField(
            controller: controller,
            focusNode: focusNode,
            onEditingComplete: onEditingComplete,
            decoration: InputDecoration(
              prefixIcon: Icon(
                icon,
              ),
              labelText: '  $labelText',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width * 0.05,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.02,
                horizontal: MediaQuery.of(context).size.width * 0.01,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '$labelText !';
              }
              return null;
            },
          );
        },
        onSelected: (String value) => onSelect(value),
      ),
    );
  }
}
