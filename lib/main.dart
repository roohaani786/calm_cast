import 'package:calm_cast/initializer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'config.calmcast.dart';
import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';
import 'infrastructure/theme/theme.dart';
import 'infrastructure/translate/translate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  await Initializer.init();
  final initialRoute = await Routes.initialRoute;
  runApp(Main(initialRoute));
}

class Main extends StatelessWidget {
  final String initialRoute;
  const Main(this.initialRoute, {super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: EnvironmentsBadge(
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: initialRoute,
          getPages: Nav.routes,
          theme: themeData,
          supportedLocales: const [Locale('pt', 'BR'), Locale('en')],
          locale: const Locale('pt', 'BR'),
          translations: Translate(),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
        ),
      ),
    );
  }
}

class EnvironmentsBadge extends StatelessWidget {
  final Widget child;
  const EnvironmentsBadge({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    final env = ConfigEnvironments.getEnvironments()['env'];
    return env != Environments.production
        ? Banner(
      location: BannerLocation.topStart,
      message: env!,
      color: env == Environments.homolog ? Colors.blue : Colors.purple,
      child: child,
    )
        : SizedBox(child: child);
  }
}