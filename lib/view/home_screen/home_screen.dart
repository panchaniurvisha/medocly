import 'package:flutter/material.dart';
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
  // List<Widget> pages = [
  //   AppCard(),
  //   AppCard(),
  //   AppCard(),
  //   AppCard(),
  //   AppCard(),
  // ];
  int selectedIndex = 0;
  final List<String> data = ["All", "General", "Dentist", "Nutritionist"];

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
              // SizedBox(
              //   height: height(context) / 5,
              //   child: CarouselSlider(
              //     items: pages,
              //     options: CarouselOptions(
              //       viewportFraction: 1.0,
              //       enableInfiniteScroll: false,
              //       autoPlay: false,
              //     ),
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: height(context) / 40),
                child: Row(
                  children: [
                    Text(
                      AppString.medClyService,
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: height(context) / 40,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: width(context) / 20,
                    ),
                    Image.asset(
                      AppImages.hospitals,
                      height: height(context) / 30,
                    ),
                  ],
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
              Padding(
                padding: EdgeInsets.symmetric(vertical: height(context) / 40),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(AppImages.mohanSharma,
                            height: height(context) / 8),
                        SizedBox(height: height(context) / 60),
                        Text(
                          AppString.consulTation,
                          style: TextStyle(
                              color: AppColors.lightBlack,
                              fontWeight: FontWeight.w500,
                              fontSize: height(context) / 60),
                        ),
                        Text(
                          AppString.rs500,
                          style: TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: height(context) / 60),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: width(context) / 60),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                AppString.drMohanSharma,
                                style: TextStyle(
                                    height: 3,
                                    color: AppColors.black,
                                    fontSize: height(context) / 45,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                width: width(context) / 10,
                              ),
                              Image.asset(
                                AppImages.heart,
                                color: AppColors.skuBlue,
                                height: height(context) / 40,
                              ),
                            ],
                          ),
                          Text(
                            AppString.cardiologists,
                            style: TextStyle(
                                height: 2,
                                color: AppColors.lightBlack,
                                fontSize: height(context) / 60,
                                fontWeight: FontWeight.w500),
                          ),
                          Row(
                            children: [
                              Image.asset(
                                AppImages.star,
                                height: height(context) / 50,
                              ),
                              SizedBox(width: width(context) / 60),
                              Text(
                                AppString.fourPointEight,
                                style: TextStyle(
                                    height: 2,
                                    color: AppColors.lightBlack,
                                    fontSize: height(context) / 60,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(AppImages.ticketStar,
                                  height: height(context) / 50),
                              SizedBox(width: width(context) / 60),
                              Text(
                                AppString.year,
                                style: TextStyle(
                                    color: AppColors.lightBlack,
                                    fontSize: height(context) / 60,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(width: width(context) / 40),
                              Image.asset(AppImages.shieldDone,
                                  height: height(context) / 50),
                              SizedBox(width: width(context) / 60),
                              Text(
                                AppString.language,
                                style: TextStyle(
                                    color: AppColors.lightBlack,
                                    fontSize: height(context) / 60,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.skuBlue,
                              fixedSize: Size(
                                  width(context) / 1.7, height(context) / 20),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      width(context) / 10)),
                            ),
                            child: Text(
                              AppString.bookVisit,
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: height(context) / 55,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
