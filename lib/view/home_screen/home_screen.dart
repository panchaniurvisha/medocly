import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:medocly/res/common/app_card.dart';
import 'package:medocly/res/common/app_dentist_doctor_list.dart';
import 'package:medocly/res/common/app_expanded_colum.dart';
import 'package:medocly/res/common/app_search_bar.dart';
import 'package:medocly/res/common/media_query.dart';
import 'package:medocly/res/constant/app_colors.dart';
import 'package:medocly/res/constant/app_images.dart';
import 'package:medocly/res/constant/app_string.dart';
import 'package:medocly/utils/routes/routes_name.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> pages = [
    const AppCard(),
    const AppCard(),
    const AppCard(),
    const AppCard(),
    const AppCard(),
  ];
  int selectedIndex = 0;
  final List<String> data = ["All", "General", "Dentist", "Nutritionist"];
  final CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(
              width(context) / 40,
            ),
            bottomRight: Radius.circular(width(context) / 40),
          ),
        ),
        toolbarHeight: height(context) / 10,
        backgroundColor: AppColors.skuBlue,
        leading: Padding(
          padding: EdgeInsets.all(width(context) / 50),
          child: Image.asset(
            AppImages.profile,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: width(context) / 30),
            child: Row(
              children: [
                Image.asset(AppImages.notification,
                    height: height(context) / 30),
                Image.asset(
                  AppImages.heart,
                  height: height(context) / 30,
                ),
              ],
            ),
          )
        ],
        centerTitle: true,
        title: Image.asset(AppImages.centreText, height: height(context) / 30),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width(context) / 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppSearchBar(),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CarouselSlider(
                    carouselController: carouselController,
                    items: pages,
                    options: CarouselOptions(
                        viewportFraction: height(context) / 0.5,
                        enableInfiniteScroll: false,
                        autoPlay: false,
                        onPageChanged: (index, reason) {
                          setState(
                            () {
                              selectedIndex = index;
                            },
                          );
                        }),
                  ),
                  Positioned(
                    top: height(context) / 6,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        pages.length,
                        (index) => Container(
                          width: selectedIndex == index
                              ? width(context) / 16
                              : width(context) / 60,
                          //double.infinity, // Adjust the size of the dots
                          height: height(context) / 120,
                          margin: EdgeInsets.symmetric(
                              horizontal: width(context) / 100),
                          decoration: BoxDecoration(
                              borderRadius: selectedIndex == index
                                  ? BorderRadius.circular(width(context) / 10)
                                  : BorderRadius.circular(width(context) / 20),
                              color: selectedIndex == index
                                  ? Colors.white
                                  : AppColors.inActiveDotsColor),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: height(context) / 90),
                child: Text(
                  AppString.medClyService,
                  style: TextStyle(
                      color: AppColors.black,
                      fontSize: height(context) / 40,
                      fontWeight: FontWeight.w700),
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppExpandedColumn(
                    image: AppImages.steThoSKop,
                    text: AppString.findDoctors,
                  ),
                  AppExpandedColumn(
                    image: AppImages.hospitals,
                    text: AppString.findHospitals,
                  ),
                  AppExpandedColumn(
                    image: AppImages.homeNursing,
                    text: AppString.homeNursing,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: height(context) / 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppString.topCategories,
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: height(context) / 40,
                          fontWeight: FontWeight.w700),
                    ),
                    InkWell(
                      child: Text(
                        AppString.seeAll,
                        style: TextStyle(
                            color: AppColors.skuBlue,
                            fontSize: height(context) / 50,
                            fontWeight: FontWeight.w700),
                      ),
                      onTap: () => Navigator.pushNamed(
                          context, RoutesName.searchDoctorByName),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: height(context) / 40),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppExpandedColumn(
                      image: AppImages.user,
                      text: AppString.general,
                    ),
                    AppExpandedColumn(
                      image: AppImages.dentist,
                      text: AppString.dentist,
                    ),
                    AppExpandedColumn(
                      image: AppImages.ophThaL,
                      text: AppString.ophthalmic,
                    ),
                    AppExpandedColumn(
                      image: AppImages.nutrition,
                      text: AppString.nutrition,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AppExpandedColumn(
                    image: AppImages.neurologist,
                    text: AppString.neUroLo,
                  ),
                  const AppExpandedColumn(
                    image: AppImages.pediatric,
                    text: AppString.pediatric,
                  ),
                  const AppExpandedColumn(
                    image: AppImages.radioLogistic,
                    text: AppString.raDioLo,
                  ),
                  AppExpandedColumn(
                    image: AppImages.moreCircle,
                    onTap: () => Navigator.pushNamed(
                        context, RoutesName.findDoctorScreen),
                    text: AppString.more,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: height(context) / 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppString.topDoctors,
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: height(context) / 40,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      AppString.seeAll,
                      style: TextStyle(
                          color: AppColors.skuBlue,
                          fontSize: height(context) / 50,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height(context) / 18,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: data.length,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final isSelected = index == selectedIndex;
                    return InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        setState(
                          () {
                            selectedIndex = index;
                          },
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: width(context) / 30),
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.skuBlue : Colors.white,
                          border: Border.all(
                            width: 2,
                            color: AppColors.skuBlue,
                          ),
                          borderRadius:
                              BorderRadius.circular(width(context) / 15),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: height(context) / 100,
                              horizontal: width(context) / 20),
                          child: Text(
                            data[index],
                            style: TextStyle(
                                color: isSelected
                                    ? Colors.white
                                    : AppColors.skuBlue,
                                fontWeight: FontWeight.w600,
                                fontSize: height(context) / 55),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const AppDentistDoctorList(),
            ],
          ),
        ),
      ),
    );
  }
}
