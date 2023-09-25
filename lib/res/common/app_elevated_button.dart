import 'package:flutter/material.dart';

import '../constant/app_colors.dart';
import 'media_query.dart';

class AppElevatedButton extends StatelessWidget {
  final String? text;
  final MaterialStateProperty<OutlinedBorder?>? shape;
  final void Function()? onPressed;
  final MaterialStateProperty<Size?>? minimumSize;
  const AppElevatedButton(
      {super.key, this.text, this.onPressed, this.minimumSize, this.shape});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onPressed ?? () {},
        style: ButtonStyle(
          shape: shape ??
              MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(width(context) / 2),
                ),
              ),
          backgroundColor: MaterialStateProperty.all(AppColors.skuBlue),
          minimumSize: minimumSize ??
              MaterialStateProperty.all(
                Size(width(context) / 1.2, height(context) / 16),
              ),
        ),
        child: Text(
          text!,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
    );
  }
}
