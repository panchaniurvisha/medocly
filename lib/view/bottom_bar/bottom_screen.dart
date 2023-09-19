import 'package:flutter/material.dart';
import 'package:medocly/res/constant/app_string.dart';
import 'package:medocly/view/appointment_screen.dart';
import 'package:medocly/view/home_screen/home_screen.dart';
import 'package:medocly/view/profile_screen.dart';
import 'package:medocly/view/specialities_screen.dart';

import '../../res/constant/app_colors.dart';
import '../../res/constant/app_images.dart';

class BottomScreen extends StatefulWidget {
  const BottomScreen({Key? key}) : super(key: key);

  @override
  State<BottomScreen> createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {
  int currentIndex = 0;
  final List<Widget> listOfScreen = [
    const HomeScreen(),
    const SpecialitiesScreen(),
    const AppointmentScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
              icon: Icon(Icons.home_filled, color: AppColors.unActiveIconColor),
              label: AppString.home,
              activeIcon: Icon(Icons.home_filled, color: AppColors.skuBlue),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppImages.document, height: height / 30),
              label: AppString.specialities,
              activeIcon: Image.asset(AppImages.document,
                  color: AppColors.skuBlue, height: height / 30),
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined,
                  color: AppColors.unActiveIconColor),
              label: AppString.appointment,
              activeIcon:
                  Icon(Icons.calendar_month_outlined, color: AppColors.skuBlue),
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined,
                  color: AppColors.unActiveIconColor),
              label: AppString.profile,
              activeIcon: Icon(Icons.person, color: AppColors.skuBlue),
            ),
          ],
          onTap: (value) {
            debugPrint("Value---->$value");
            setState(() {
              currentIndex = value;
            });
          },
          selectedItemColor: AppColors.skuBlue,
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: height / 80,
          ),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: height / 80,
          ),
          unselectedItemColor: AppColors.unActiveIconColor,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          iconSize: height / 28,
          backgroundColor: AppColors.white,
        ),
        body: listOfScreen.elementAt(currentIndex),
      ),
    );
  }
}
