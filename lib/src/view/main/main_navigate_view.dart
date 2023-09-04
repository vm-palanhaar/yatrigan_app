import 'package:flutter/material.dart';
import 'package:yatrigan/src/view/error/conn_tout_screen.dart';
import 'package:yatrigan/src/view/error/internet_screen.dart';
import 'package:yatrigan/src/view/main/home/home_navigate_view.dart';
import 'package:yatrigan/src/view/util/color_schemes.g.dart';

class MainNavigateView extends StatelessWidget {
  const MainNavigateView({Key? key}) : super(key: key);
  static String id = 'MainNavigateView';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      initialRoute: HomeNavigateView.id,
      routes: {
        HomeNavigateView.id: (context) => const HomeNavigateView(),
        ConnToutScreen.id: (context) => const ConnToutScreen(),
        InternetScreen.id: (context) => const InternetScreen(),
      },
    );
  }
}
