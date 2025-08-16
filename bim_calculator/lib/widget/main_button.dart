import 'package:bim_calculator/core/color.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key, required this.onTap, required this.title, required this.height,
  });

  final Function () onTap;
  final String title;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Appcolor.seconaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onPressed: onTap,
        child: Text(title, style: TextStyle(color: Appcolor.whiteColor, fontSize: 18)),
      ),
    );
  }
}
