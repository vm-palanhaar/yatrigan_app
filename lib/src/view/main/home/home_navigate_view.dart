import 'package:flutter/material.dart';
import 'package:yatrigan/src/view/main/ir/ir_navigate_view.dart';
import 'package:yatrigan/src/view/util/color_schemes.g.dart';

class HomeNavigateView extends StatelessWidget {
  const HomeNavigateView({Key? key}) : super(key: key);
  static String id = 'HomeNavigateView';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      initialRoute: IrNavigateView.id,
      routes: {
        IrNavigateView.id: (context) => const IrNavigateView(),
      },
    );
  }
}
