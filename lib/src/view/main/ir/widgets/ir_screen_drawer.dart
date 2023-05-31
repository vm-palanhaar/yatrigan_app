import 'package:flutter/material.dart';
import 'package:yatrigan/src/view/util/enum_icons.dart';

import '../../../widgets/style/drawer/drawer_style.dart';

class IrScreenDrawer extends StatelessWidget {
  const IrScreenDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomDrawer(
      children: [
        const DrawerLogo(),
        const Divider(),
        ListTileLWidgetTText(
          text: 'Railways',
          onTap: () {},
          child: Icon(IrIcon.train.icon),
        ),
        const Divider(),
        ListTileLText(
          text: 'Related Apps',
          onTap: () {},
        ),
        const Spacer(),
        listTileHelp(),
        listTileFeedback(),
      ],
    );
  }
}
