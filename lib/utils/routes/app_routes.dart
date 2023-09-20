import 'package:flutter/material.dart';
import 'package:medocly/utils/routes/routes_name.dart';
import 'package:medocly/view/bottom_bar/bottom_screen.dart';
import 'package:medocly/view/find_doctors_screen.dart';
import 'package:medocly/view/search_doctor_by_name.dart';

Map<String, WidgetBuilder> appRoutes = {
  RoutesName.bottomScreen: (context) => const BottomScreen(),
  RoutesName.findDoctorScreen: (context) => const FindDoctorsScreen(),
  RoutesName.searchDoctorByName: (context) => const SearchDoctorByName(),
};
