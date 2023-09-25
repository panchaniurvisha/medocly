import 'package:flutter/material.dart';
import 'package:medocly/res/common/app_dropDownButton.dart';
import 'package:medocly/res/common/app_elevated_button.dart';
import 'package:medocly/res/common/media_query.dart';

import '../res/common/app_textfield.dart';
import '../res/constant/app_colors.dart';
import '../res/constant/app_images.dart';
import '../res/constant/app_string.dart';

class NotificationHomeNursingCare extends StatefulWidget {
  const NotificationHomeNursingCare({super.key});

  @override
  State<NotificationHomeNursingCare> createState() =>
      _NotificationHomeNursingCareState();
}

class _NotificationHomeNursingCareState
    extends State<NotificationHomeNursingCare> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  String? chooseValue = "1";
  List<Map> dropDownListItemStat = [
    {
      "data": 'Jammu',
      "value": "1",
    },
    {
      "data": 'Gujrat',
      "value": "2",
    },
    {
      "data": 'Panjab',
      "value": "3",
    },
    {
      "data": 'Keral',
      "value": "4",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.skuBlue,
        title: const Text(
          AppString.homeNursingCare,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width(context) / 50,
        ),
        child: ListView.builder(
          padding: EdgeInsets.only(top: height(context) / 40),
          itemCount: 3,
          shrinkWrap: true,
          itemBuilder: (context, index) => Container(
            margin: EdgeInsets.only(bottom: height(context) / 40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(width(context) / 30),
              border: Border.all(color: AppColors.skuBlue),
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(width(context) / 30),
                    topRight: Radius.circular(width(context) / 30),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(
                    AppImages.careAtHome,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: width(context) / 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      index == 0
                          ? const Text(
                              "Nursing Care At Home",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: AppColors.black),
                            )
                          : const Text(
                              "Medical Support at Home",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: AppColors.black),
                            ),
                      AppElevatedButton(
                        text: AppString.bookNow,
                        onPressed: () {
                          showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            isScrollControlled: true,
                            isDismissible: true,
                            context: context,
                            builder: (context) => Container(
                              height: height(context) / 1.5,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(width(context) / 8),
                                  topLeft: Radius.circular(width(context) / 8),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: height(context) / 30,
                                    horizontal: width(context) / 15),
                                child: Column(
                                  children: [
                                    const Text(
                                      AppString.titleOfBottomSheet,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.black,
                                      ),
                                    ),
                                    const Center(
                                      child: Text(
                                        AppString.subtitleOfBottomSheet,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.black,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: height(context) / 30),
                                      child: AppTextField(
                                          hintText: AppString.hintOfFullName,
                                          controller: nameController,
                                          labelText: "Full Name"),
                                    ),
                                    AppTextField(
                                        hintText: AppString.hintPhoneNumber,
                                        controller: phoneNumberController,
                                        labelText: "Phone Number"),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: height(context) / 30),
                                      child: const Text(
                                        AppString.selectCity,
                                        style: TextStyle(
                                            color: AppColors.labelTextColor,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16),
                                      ),
                                    ),
                                    AppDropDownButton(
                                      value: chooseValue,
                                      items: dropDownListItemStat
                                          .map(
                                            (value) => DropdownMenuItem(
                                              value: value['value'],
                                              child: Text(value['data']),
                                            ),
                                          )
                                          .toList(),
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            chooseValue = value.toString();
                                          },
                                        );
                                      },
                                    ),
                                    Spacer(),
                                    AppElevatedButton(
                                      text: AppString.bookNow,
                                      minimumSize: MaterialStatePropertyAll(
                                        Size(width(context) / 1.5,
                                            height(context) / 16),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        minimumSize: MaterialStateProperty.all(
                          Size(width(context) / 10, height(context) / 30),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(width(context) / 70),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: width(context) / 30,
                  ),
                  child: const Text(
                    "This is some description about nursing care at home services page. ",
                    style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 13),
                  ),
                ),
                SizedBox(
                  height: height(context) / 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
