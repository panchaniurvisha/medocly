import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:medocly/res/common/app_dentist_doctor_list.dart';
import 'package:medocly/res/common/app_review_button.dart';
import 'package:medocly/res/common/media_query.dart';
import 'package:medocly/res/constant/app_colors.dart';
import 'package:medocly/res/constant/app_images.dart';
import 'package:medocly/res/constant/app_string.dart';

class SearchDoctorByName extends StatefulWidget {
  const SearchDoctorByName({super.key});

  @override
  State<SearchDoctorByName> createState() => _SearchDoctorByNameState();
}

class _SearchDoctorByNameState extends State<SearchDoctorByName> {
  int selectedIndex = 0;
  bool autoFocus = false;
  FocusNode focusNode = FocusNode();
  final List<String> data = ["All", "General", "Dentist", "Nutritionist"];
  final TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode.addListener(() {
      setState(() {
        autoFocus = focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: height(context) / 10,
        leading: const BackButton(color: AppColors.black),
        title: TextField(
          autofocus: autoFocus,
          focusNode: focusNode,
          controller: nameController,
          cursorColor: AppColors.black,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                top: height(context) / 60,
                left: 8,
              ),
              suffixIcon: Padding(
                padding: EdgeInsets.only(
                    right: width(context) / 25, left: width(context) / 25),
                child: Image.asset(
                  AppImages.filter,
                  height: height(context) / 62.5,
                  width: width(context) / 18,
                ),
              ),
              prefixIcon: Icon(
                Icons.search,
                color: autoFocus ? AppColors.skuBlue : AppColors.hintTextColor,
              ),
              counter: Container(),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 2, color: Color(0xffE1E3E6)),
                borderRadius: BorderRadius.all(
                  Radius.circular(width(context) / 30),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.skuBlue),
                borderRadius: BorderRadius.all(
                  Radius.circular(width(context) / 30),
                ),
              ),
              hintText: AppString.hintOfSearch,
              hintStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: AppColors.hintTextColor),
              filled: true,
              fillColor: AppColors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width(context) / 40,
        ),
        child: Column(
          children: [
            SizedBox(
              height: height(context) / 18,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: data.length,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final isSelect = index == selectedIndex;
                  return InkWell(
                    splashColor: Colors.transparent,
                    onTap: () {
                      setState(
                        () {
                          selectedIndex = index;
                        },
                      );
                    },
                    child: AppReviewButton(
                      showIconAndSizedBox: false,
                      isSelected: true,
                      text: data[index],
                      containerColor:
                          isSelect ? AppColors.skuBlue : Colors.white,
                      textColor: isSelect ? Colors.white : AppColors.skuBlue,
                    ),
                  );
                },
              ),
            ),
            buildSelectedWidget()!,
          ],
        ),
      ),
    );
  }

  Widget? buildSelectedWidget() {
    switch (selectedIndex) {
      case 0:
        return Padding(
          padding: EdgeInsets.symmetric(vertical: height(context) / 5),
          child: SpinKitCircle(
              color: AppColors.skuBlue, size: height(context) / 10),
        );
      case 1:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              AppString.zeroFound,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.black,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height(context) / 8),
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  AppString.notFound,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                ),
              ),
            ),
            const Text(
              AppString.text,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: AppColors.black,
              ),
            ),
          ],
        );
      case 2:
        return ListView.builder(
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                index == 0
                    ? Padding(
                        padding: EdgeInsets.only(top: height(context) / 60),
                        child: const Text(
                          AppString.fourSixNineFound,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: AppColors.black,
                          ),
                        ),
                      )
                    : const SizedBox(),
                const AppDentistDoctorList(),
              ],
            );
          },
          scrollDirection: Axis.vertical,
          itemCount: 2, // Set the number of items
          shrinkWrap: true,
        );
    }
    return null;
  }
}
