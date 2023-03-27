import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yatrigan/src/controller/main/ir/ir_ctrl.dart';
import 'package:yatrigan/src/controller/main/productcatalog/product_catalog_ctrl.dart';
import 'package:yatrigan/src/view/main/productcatalog/screens/product_details_screen.dart';
import 'package:yatrigan/src/view/util/color_schemes.g.dart';

import 'screens/ir_home_screen.dart';
import 'screens/ir_station_shop_details_screen.dart';
import 'screens/ir_station_shop_inv_list_screen.dart';

class IrNavigateView extends StatelessWidget {
  const IrNavigateView({Key? key}) : super(key: key);
  static String id = 'IrNavigateView';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<IrCtrl>(
          create: (context) => IrCtrl(),
        ),
        ChangeNotifierProvider<PcCtrl>(
          create: (context) => PcCtrl(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
        darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
        initialRoute: IrHomeScreen.id,
        routes: {
          IrHomeScreen.id: (context) => const IrHomeScreen(),
          IrStationShopInvListScreen.id: (context) =>
              const IrStationShopInvListScreen(),
          ProductDetailsScreen.id: (context) => const ProductDetailsScreen(),
          IrStationShopDetailsScreen.id: (context) =>
              const IrStationShopDetailsScreen(),
          //
          IrNavigateView.id: (context) => const IrNavigateView(),
        },
      ),
    );
  }
}
