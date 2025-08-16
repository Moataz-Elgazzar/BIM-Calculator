import 'package:bim_calculator/core/color.dart';
import 'package:bim_calculator/widget/main_button.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({super.key, required this.result});

  final double result;

  String getStatues() {
    if (result < 18.5) {
      return 'Underweight';
    } else if (result < 25) {
      return 'Normal';
    } else if (result < 30) {
      return 'Overweight';
    } else {
      return 'Obesity';
    }
  }

  String getMessage() {
    if (result < 18.5) {
      return 'You are underweight,Try to eat more \u{1F37D}';
    } else if (result < 25) {
      return 'your body weight is absolutely normal,\nGood job \u{1F4AA}';
    } else if (result < 30) {
      return 'You are overweight,Time to workout \u{1F4AA}\u{1F3CB}';
    } else {
      return 'You are in obesity level,\nIt is important to start a healthy lifestyle \u{1F3CB}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.backgroundColor,
      appBar: AppBar(backgroundColor: Appcolor.backgroundColor, foregroundColor: Appcolor.whiteColor),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Your result', style: TextStyle(color: Appcolor.whiteColor, fontSize: 30)),
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50, bottom: 10),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Appcolor.primaryColor),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(getStatues(), style: TextStyle(fontSize: 20, color: Appcolor.greenColor)),
                        SizedBox(height: 140),
                        Text(
                          result.toStringAsFixed(2),
                          style: TextStyle(color: Appcolor.whiteColor, fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 140),
                        Padding(
                          padding: const EdgeInsets.only(right: 50),
                          child: Text(getMessage(), style: TextStyle(color: Appcolor.whiteColor, fontSize: 15)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            MainButton(
              title: 'Recalculate',
              height: 70,
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
