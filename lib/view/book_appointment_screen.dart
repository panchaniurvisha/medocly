import 'package:flutter/material.dart';
import 'package:medocly/res/common/app_elevated_button.dart';
import 'package:medocly/res/common/media_query.dart';

import '../res/constant/app_colors.dart';
import '../res/constant/app_string.dart';

class BookAppointmentScreen extends StatefulWidget {
  const BookAppointmentScreen({super.key});

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  List<String> data = [
    "09.00 AM",
    "09.05 AM",
    "09.10 AM",
    "10.30 PM",
    "11.00 PM",
    "11.30 PM",
    "15.00 PM",
    "15.30 PM",
    "16.00 PM",
    "16.30 PM",
    "17.00 PM",
    "17.30 PM"
  ];
  int selectedValue = 0;
  DateTime selectedDate = DateTime.now();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1), // Set a limit for the year
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    selectDate(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.skuBlue,
        leading: const BackButton(
          color: Colors.white,
        ),
        title: const Text(
          AppString.appBarTitle,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width(context) / 30, vertical: height(context) / 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              AppString.selectDate,
              style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),

            // ElevatedButton(
            //   onPressed: () => selectDate(context), // Open date picker
            //   child: Text(
            //     "",
            //     // DateFormat('yyyy-MM-dd')
            //     //     .format(selectedDate), // Display selected date
            //     style: TextStyle(
            //       fontSize: 16,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            const Text(
              AppString.selectHour,
              style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2.5,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 10),
              itemBuilder: (context, index) => OutlinedButton(
                onPressed: () {
                  setState(() {
                    selectedValue = index;
                  });
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      selectedValue == index ? AppColors.skuBlue : Colors.white,
                    ),
                    side: MaterialStateProperty.all(
                        const BorderSide(color: AppColors.skuBlue, width: 2))),
                child: Text(
                  data[index],
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: selectedValue == index
                          ? Colors.white
                          : AppColors.skuBlue),
                ),
              ),
              itemCount: data.length,
              shrinkWrap: true,
            ),
            AppElevatedButton(onPressed: () {}, text: AppString.next)
          ],
        ),
      ),
    );
  }
}
