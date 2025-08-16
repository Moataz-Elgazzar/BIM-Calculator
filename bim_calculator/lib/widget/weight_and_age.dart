import 'package:bim_calculator/core/color.dart';
import 'package:flutter/material.dart';

class WeightAndAge extends StatelessWidget {
  const WeightAndAge({
    super.key, required this.title , required this.value, required this.onAdd, required this.onRemove
  });

  final String title;
  final int value;
  final Function() onAdd;
  final Function() onRemove;


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(color: Appcolor.primaryColor, borderRadius: BorderRadius.circular(10)),
        child: Column(
          spacing: 5,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: TextStyle(color: Appcolor.textColor, fontSize: 20)),
            Text(
              value.toString(),
              style: TextStyle(color: Appcolor.whiteColor, fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: onRemove,
                  style: IconButton.styleFrom(backgroundColor: Appcolor.iconColor, foregroundColor: Appcolor.whiteColor),
                  icon: Icon(Icons.remove),
                ),
                IconButton(
                  onPressed: onAdd,
                  style: IconButton.styleFrom(backgroundColor: Appcolor.iconColor, foregroundColor: Appcolor.whiteColor),
                  icon: Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
