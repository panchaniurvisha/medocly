import 'package:flutter/material.dart';
import 'package:medocly/utils/routes/routes_name.dart';
import 'package:medocly/view/bottom_bar/bottom_screen.dart';
import 'package:medocly/view/doctor_details_screen.dart';
import 'package:medocly/view/find_doctors_screen.dart';
import 'package:medocly/view/search_doctor_by_name.dart';

import '../../view/rating_review_screen.dart';

Map<String, WidgetBuilder> appRoutes = {
  RoutesName.bottomScreen: (context) => const BottomScreen(),
  RoutesName.findDoctorScreen: (context) => const FindDoctorsScreen(),
  RoutesName.searchDoctorByName: (context) => const SearchDoctorByName(),
  RoutesName.doctorDetailsScreen: (context) => const DoctorDetailsScreen(),
  RoutesName.ratingReviewScreen: (context) => RatingReviewScreen(),
};
