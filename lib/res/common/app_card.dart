import 'package:flutter/cupertino.dart';
import 'package:medocly/res/common/media_query.dart';

import '../constant/app_images.dart';

class AppCard extends StatelessWidget {
  const AppCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height(context) / 10,
        width: double.infinity,
        child: Image.asset(AppImages.card));
  }
}
