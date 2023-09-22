import 'package:flutter/material.dart';
import 'package:medocly/res/common/app_textfield.dart';
import 'package:medocly/res/common/media_query.dart';

import '../res/common/app_elevated_button.dart';
import '../res/constant/app_colors.dart';
import '../res/constant/app_string.dart';
import '../utils/routes/routes_name.dart';

class PatientDetailsScreen extends StatefulWidget {
  const PatientDetailsScreen({super.key});

  @override
  State<PatientDetailsScreen> createState() => _PatientDetailsScreenState();
}

class _PatientDetailsScreenState extends State<PatientDetailsScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController problemController = TextEditingController();
  Color borderColor = Colors.blue;
  String? selectedValue = "Male";
  String? chooseValue = "27 years";

  List<Map> dropDownListItemGender = [
    {
      "data": AppString.genderText,
      "value": "Gender",
    },
    {
      "data": AppString.male,
      "value": "Male",
    },
    {
      "data": AppString.female,
      "value": "Female",
    },
    {
      "data": AppString.others,
      "value": "Others",
    },
  ];
  List<Map> dropDownListItem = [
    {
      "data": AppString.twentyOne,
      "value": "21 years",
    },
    {
      "data": AppString.twentyTwo,
      "value": "22 years",
    },
    {
      "data": AppString.twentyThree,
      "value": "23 years",
    },
    {
      "data": AppString.twentyFour,
      "value": "24 years",
    },
    {
      "data": AppString.twentyFive,
      "value": "25 years",
    },
    {
      "data": AppString.twentySix,
      "value": "26 years",
    },
    {
      "data": AppString.twentySeven,
      "value": "27 years",
    },
    {
      "data": AppString.twentyEight,
      "value": "28 years",
    },
    {
      "data": AppString.twentyNine,
      "value": "29 years",
    },
    {
      "data": AppString.thirty,
      "value": "30 years",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.skuBlue,
        leading: const BackButton(color: Colors.white),
        title: const Text(
          AppString.patientDetails,
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width(context) / 30, vertical: height(context) / 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              AppString.fullName,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            AppTextField(
              controller: nameController,
              hintText: AppString.andrewAinsley,
            ),
            const Text(
              AppString.phoneNumber,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            AppTextField(
              controller: phoneNumberController,
              hintText: AppString.hintPhoneNumber,
            ),
            const Text(
              AppString.gender,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            Container(
              width: width(context) / 1,
              padding: EdgeInsets.only(
                left: width(context) / 18,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width(context) / 22.5),
                border:
                    Border.all(color: Colors.white, width: 2), // Border color
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  isExpanded: false,
                  value: selectedValue,
                  style: const TextStyle(
                    color: AppColors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  iconSize: height(context) / 25,
                  items: dropDownListItemGender
                      .map(
                        (value) => DropdownMenuItem(
                          value: value['value'],
                          child: Text(value['data']),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value.toString();
                    });
                  },
                ),
              ),
            ),
            const Text(
              AppString.yourAge,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            Container(
              width: width(context) / 1,
              padding: EdgeInsets.only(
                left: width(context) / 18,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width(context) / 22.5),
                border:
                    Border.all(color: Colors.white, width: 2), // Border color
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: chooseValue,
                  style: const TextStyle(
                    color: AppColors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  iconSize: height(context) / 25,
                  items: dropDownListItem
                      .map(
                        (value) => DropdownMenuItem(
                          value: value['value'],
                          child: Text(value['data']),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      chooseValue = value.toString();
                    });
                  },
                ),
              ),
            ),
            const Text(
              AppString.writeYourProblem,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            AppTextField(
                controller: problemController,
                hintText: AppString.hintProblem,
                maxLength: 4),
            AppElevatedButton(
              text: AppString.next,
              onPressed: () =>
                  Navigator.pushNamed(context, RoutesName.reviewSummeryScreen),
            )
          ],
        ),
      ),
    );
  }
}
