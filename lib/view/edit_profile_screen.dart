import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:medocly/res/common/app_dropDownButton.dart';
import 'package:medocly/res/common/media_query.dart';
import 'package:medocly/res/constant/app_images.dart';
import 'package:medocly/res/constant/app_string.dart';

import '../res/common/app_elevated_button.dart';
import '../res/common/app_textfield.dart';
import '../res/constant/app_colors.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();
  FocusNode focusNode = FocusNode();
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
  String? selectedValue = "Male";
  String? chooseValue = "2";
  List<Map> dropDownListItemCountry = [
    {
      "data": 'United States',
      "value": "2",
    },
    {
      "data": 'Canada',
      "value": "1",
    },
    {
      "data": 'United Kingdom',
      "value": "3",
    },
    {
      "data": 'Australia',
      "value": "4",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.skuBlue,
        title: const Text(
          AppString.editProfile,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width(context) / 30, vertical: height(context) / 40),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              AppTextField(
                hintText: AppString.hintOfFullName,
                controller: nameController,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: height(context) / 50),
                child: AppTextField(
                  hintText: AppString.hintOfFirstName,
                  controller: firstNameController,
                ),
              ),
              AppTextField(
                hintText: AppString.hintOfBirthDate,
                controller: birthDateController,
                suffixIcon: Padding(
                  padding: EdgeInsets.all(height(context) / 50),
                  child: Image.asset(
                    AppImages.calenderIcon,
                    height: height(context) / 50,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: height(context) / 50),
                child: AppTextField(
                  hintText: AppString.hintOfEmail,
                  controller: emailController,
                  suffixIcon: Padding(
                    padding: EdgeInsets.all(height(context) / 50),
                    child: Image.asset(
                      AppImages.emailIcon,
                      height: height(context) / 50,
                    ),
                  ),
                ),
              ),
              AppDropDownButton(
                  value: chooseValue,
                  items: dropDownListItemCountry
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
                  }),
              Padding(
                padding: EdgeInsets.symmetric(vertical: height(context) / 50),
                child: IntlPhoneField(
                  focusNode: focusNode,
                  decoration: InputDecoration(
                    counter: const SizedBox(),
                    contentPadding: EdgeInsets.symmetric(
                        vertical: height(context) / 55,
                        horizontal: width(context) / 20),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        width(context) / 22.5,
                      ),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(width(context) / 22.5),
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 2)),
                    fillColor: AppColors.textFieldFilledColor,
                  ),
                  languageCode: "en",
                  onChanged: (phone) {
                    debugPrint(phone.completeNumber);
                  },
                  onCountryChanged: (country) {
                    debugPrint('Country changed to: ' + country.name);
                  },
                ),
              ),
              AppDropDownButton(
                  value: selectedValue,
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
                  }),
              const Spacer(),
              AppElevatedButton(
                text: AppString.updateButton,
                onPressed: () => Navigator.pop(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
