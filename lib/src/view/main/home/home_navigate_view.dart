import 'package:flutter/material.dart';
import 'package:yatrigan/src/view/error/conn_tout_screen.dart';
import 'package:yatrigan/src/view/error/internet_screen.dart';
import 'package:yatrigan/src/view/main/ir/ir_navigate_view.dart';
import 'package:yatrigan/src/view/util/color_schemes.g.dart';

class HomeNavigateView extends StatelessWidget {
  const HomeNavigateView({Key? key}) : super(key: key);
  static String id = 'HomeNavigateView';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      initialRoute: IrNavigateView.id,
      routes: {
        IrNavigateView.id: (context) => const IrNavigateView(),
        ConnToutScreen.id: (context) => const ConnToutScreen(),
        InternetScreen.id: (context) => const InternetScreen(),
      },
    );
  }
}
