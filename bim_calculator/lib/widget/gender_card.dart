import 'package:bim_calculator/core/color.dart';
import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  const GenderCard({super.key, required this.title, required this.icon , required this.color, required this.onTap});

  final String title;
  final IconData icon;
  final Color color;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(color:color, borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Appcolor.whiteColor, size: 100),
              Text(title, style: TextStyle(color: Appcolor.textColor, fontSize: 15)),
            ],
          ),
        ),
      ),
    );
  }
}
