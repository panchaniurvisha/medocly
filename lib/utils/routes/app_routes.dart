import 'package:flutter/material.dart';
import 'package:medocly/utils/routes/routes_name.dart';
import 'package:medocly/view/bottom_bar/bottom_screen.dart';
import 'package:medocly/view/doctor_details_screen.dart';
import 'package:medocly/view/find_doctors_screen.dart';
import 'package:medocly/view/review_summery_screen.dart';
import 'package:medocly/view/search_doctor_by_name.dart';

import '../../view/book_appointment_screen.dart';
import '../../view/edit_profile_screen.dart';
import '../../view/notification_home_nursing_care.dart';
import '../../view/notification_screen.dart';
import '../../view/patient_detaild_screen.dart';
import '../../view/profile/profile_screen.dart';
import '../../view/profile_setting_screen.dart';
import '../../view/rating_review_screen.dart';

Map<String, WidgetBuilder> appRoutes = {
  RoutesName.bottomScreen: (context) => const BottomScreen(),
  RoutesName.findDoctorScreen: (context) => const FindDoctorsScreen(),
  RoutesName.searchDoctorByName: (context) => const SearchDoctorByName(),
  RoutesName.doctorDetailsScreen: (context) => const DoctorDetailsScreen(),
  RoutesName.ratingReviewScreen: (context) => const RatingReviewScreen(),
  RoutesName.patientDetailsScreen: (context) => const PatientDetailsScreen(),
  RoutesName.reviewSummeryScreen: (context) => const ReviewSummeryScreen(),
  RoutesName.bookAppointmentScreen: (context) => const BookAppointmentScreen(),
  RoutesName.profileScreen: (context) => const ProfileScreen(),
  RoutesName.profileAndSettingScreen: (context) =>
      const ProfileAndSettingScreen(),
  RoutesName.editProfileScreen: (context) => const EditProfileScreen(),
  RoutesName.notificationScreen: (context) => const NotificationScreen(),
  RoutesName.notificationHomeNursingCare: (context) =>
      const NotificationHomeNursingCare(),
};
