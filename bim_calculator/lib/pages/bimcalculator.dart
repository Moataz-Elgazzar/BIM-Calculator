import 'package:bim_calculator/core/color.dart';
import 'package:bim_calculator/pages/result.dart';
import 'package:bim_calculator/widget/gender_card.dart';
import 'package:bim_calculator/widget/main_button.dart';
import 'package:bim_calculator/widget/weight_and_age.dart';
import 'package:flutter/material.dart';

class BimCalculator extends StatefulWidget {
  const BimCalculator({super.key});

  @override
  State<BimCalculator> createState() => _BimCalculatorState();
}

class _BimCalculatorState extends State<BimCalculator> {
  int weight = 60;
  int age = 24;
  int height = 170;
  bool isMale = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.backgroundColor,
      appBar: AppBar(
        title: Text(
          'BIM Calculator',
          style: TextStyle(color: Appcolor.whiteColor, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Appcolor.backgroundColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          spacing: 10,
          children: [
            //male & female
            maleAndFemale(),
            //height
            heightUi(),
            //weight & age
            weightAndAge(),
            //calculate button
            MainButton(
              title: 'Calculate',
              height: 50,
              onTap: () {
                double result = weight / (height * height * 0.0001);
                Navigator.push(context, MaterialPageRoute(builder: (context) => Result(result: result)));
              },
            ),
          ],
        ),
      ),
    );
  }

  Expanded weightAndAge() {
    return Expanded(
      child: Row(
        spacing: 10,
        children: [
          WeightAndAge(
            title: 'Weight',
            value: weight,
            onAdd: () {
              setState(() {
                weight++;
              });
            },
            onRemove: () {
              if (weight > 30) {
                setState(() {
                  weight--;
                });
              }
            },
          ),
          WeightAndAge(
            title: 'Age',
            value: age,
            onAdd: () {
              setState(() {
                age++;
              });
            },
            onRemove: () {
              if (age > 1) {
                setState(() {
                  age--;
                });
              }
            },
          ),
        ],
      ),
    );
  }

  Expanded heightUi() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(color: Appcolor.primaryColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Height', style: TextStyle(color: Appcolor.textColor)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  height.toString(),
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Appcolor.whiteColor),
                ),
                Text('cm', style: TextStyle(fontSize: 15, color: Appcolor.textColor)),
              ],
            ),
            Slider(
              value: height.toDouble(),
              min: 60,
              max: 220,
              onChanged: (v) {
                setState(() {
                  height = v.toInt();
                });
              },
              activeColor: Appcolor.seconaryColor,
              inactiveColor: Appcolor.textColor,
            ),
          ],
        ),
      ),
    );
  }

  Expanded maleAndFemale() {
    return Expanded(
      child: Row(
        spacing: 10,
        children: [
          GenderCard(
            title: 'Male',
            icon: Icons.male,
            color: (isMale) ? Appcolor.seconaryColor : Appcolor.primaryColor,
            onTap: () {
              setState(() {
                isMale = true;
              });
            },
          ),
          GenderCard(
            title: 'Female',
            icon: Icons.female,
            color: (!isMale) ? Appcolor.seconaryColor : Appcolor.primaryColor,
            onTap: () {
              setState(() {
                isMale = false;
              });
            },
          ),
        ],
      ),
    );
  }
}
