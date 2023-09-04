import 'package:flutter/material.dart';
import 'package:yatrigan/src/view/util/enum_icons.dart';

class CalendarWidget extends StatefulWidget {
  final String title;
  final Function onTap;
  const CalendarWidget({
    required this.title,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime selectedDate = DateTime.now();
  String titleDate = '';
  @override
  void initState() {
    titleDate = '${selectedDate.day} ${_getMonth(month: selectedDate.month)}';
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
    return ListTile(
      title: Text(widget.title),
      trailing: Text(titleDate),
      leading: Icon(IrIcon.spotTrain.icon),
      onTap: () async {
        final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(selectedDate.year),
          lastDate: DateTime(selectedDate.year + 1),
        );
        if (picked != null && picked != selectedDate) {
          setState(() {
            selectedDate = picked;
            titleDate =
                '${selectedDate.day} ${_getMonth(month: selectedDate.month)}';
            // widget.onTap(selectedDate.toString().split(' ')[0]);
          });
        }
      },
    );
  }
}
