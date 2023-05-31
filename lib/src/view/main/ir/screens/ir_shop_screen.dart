import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yatrigan/src/controller/main/ir/ir_ctrl.dart';
import 'package:yatrigan/src/view/main/ir/tabs/railstation/shop/ir_shop_info_tab_screen.dart';
import 'package:yatrigan/src/view/main/ir/tabs/railstation/shop/ir_shop_inv_tab_screen.dart';
import 'package:yatrigan/src/view/util/enum_icons.dart';

class IrShopScreen extends StatelessWidget {
  const IrShopScreen({
    Key? key,
  }) : super(key: key);
  static String id = 'IrShopScreen';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            Provider.of<IrCtrl>(context, listen: false).irShop!.name,
          ),
          bottom:  TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(ShopIcon.inventory.icon),
                text: 'Inventory',
              ),
              Tab(
                icon: Icon(ShopIcon.info.icon),
                text: 'Info',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            IrShopInvTabScreen(),
            IrShopInfoTabScreen(),
          ],
        ),
      ),
    );
  }
}
