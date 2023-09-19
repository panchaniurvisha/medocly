import 'package:flutter/material.dart';
import 'package:medocly/res/common/media_query.dart';
import 'package:medocly/res/constant/app_string.dart';

import '../res/constant/app_colors.dart';

class SearchDoctorByName extends StatefulWidget {
  const SearchDoctorByName({super.key});

  @override
  State<SearchDoctorByName> createState() => _SearchDoctorByNameState();
}

class _SearchDoctorByNameState extends State<SearchDoctorByName> {
  int selectedIndex = 0;
  bool autoFocus = true;
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
                ),
                // suffixIcon: Icon(
                //   Icons.lis
                // )
                // suffixIcon: SizedBox(
                //   height: height(context) / 200,
                //   child: Image.asset(
                //     AppImages.filter,
                //     height: height(context) / 90,
                //   ),
                // ),
                prefixIcon: Icon(Icons.search,
                    color: autoFocus
                        ? AppColors.skuBlue
                        : AppColors.hintTextColor),
                counter: Container(),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(width: 2, color: Color(0xffE1E3E6)),
                  borderRadius: BorderRadius.all(
                    Radius.circular(width(context) / 30),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(width: 2, color: AppColors.skuBlue),
                  borderRadius: BorderRadius.all(
                    Radius.circular(width(context) / 30),
                  ),
                ),
                hintText: AppString.hintOfSearch,
                hintStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: height(context) / 60,
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
                        margin: EdgeInsets.only(right: height(context) / 60),
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
            ],
          ),
        ));
  }
}
