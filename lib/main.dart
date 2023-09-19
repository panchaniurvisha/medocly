import 'package:flutter/material.dart';
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
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: "Urbanist",
        ),
        debugShowCheckedModeBanner: false,
        //home: const BottomScreen(),
        routes: appRoutes,
        initialRoute: RoutesName.searchDoctorByName);
  }
}
