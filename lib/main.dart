import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yatrigan/src/view/main/main_navigate_view.dart';
import 'package:yatrigan/src/view/splash_screen.dart';
import 'package:yatrigan/src/view/util/color_schemes.g.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const Yatrigan());
}

class Yatrigan extends StatelessWidget {
  const Yatrigan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => const SplashScreen(),
        MainNavigateView.id: (context) => const MainNavigateView(),
      },
    );
  }
}
