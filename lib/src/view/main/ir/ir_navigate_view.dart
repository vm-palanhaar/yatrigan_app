import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yatrigan/src/controller/main/ir/ir_ctrl.dart';
import 'package:yatrigan/src/controller/main/productcatalog/product_catalog_ctrl.dart';
import 'package:yatrigan/src/view/error/conn_tout_screen.dart';
import 'package:yatrigan/src/view/error/internet_screen.dart';
import 'package:yatrigan/src/view/main/ir/screens/ir_shop_screen.dart';
import 'package:yatrigan/src/view/main/ir/screens/ir_train_screen.dart';
import 'package:yatrigan/src/view/main/productcatalog/screens/product_details_screen.dart';
import 'package:yatrigan/src/view/util/color_schemes.g.dart';

import 'screens/ir_home_screen.dart';
import 'screens/ir_rail_station_screen.dart';

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
        initialRoute: IrHomeScreen.id,
        routes: {
          IrHomeScreen.id: (context) => const IrHomeScreen(tabIndex: 0),
          IrRailStationScreen.id: (context) => const IrRailStationScreen(),
          IrTrainScreen.id: (context) => const IrTrainScreen(),
          IrShopScreen.id: (context) => const IrShopScreen(),

          ProductDetailsScreen.id: (context) => const ProductDetailsScreen(),

          //
          IrNavigateView.id: (context) => const IrNavigateView(),
          ConnToutScreen.id: (context) => const ConnToutScreen(),
          InternetScreen.id: (context) => const InternetScreen(),
        },
      ),
    );
  }
}
