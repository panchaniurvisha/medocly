import 'package:flutter/cupertino.dart';

import '../constant/app_images.dart';

class AppCard extends StatelessWidget {
  const AppCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImages.card);
  }
}
