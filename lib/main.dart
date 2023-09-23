import 'package:flutter/material.dart';
import 'package:medocly/res/constant/app_colors.dart';
import 'package:medocly/utils/routes/routes_name.dart';

import 'utils/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.skuBlue),
          useMaterial3: true,
          fontFamily: "Urbanist",
        ),
        debugShowCheckedModeBanner: false,
        routes: appRoutes,
        initialRoute: RoutesName.bottomScreen);
  }
}
