import 'package:bmicalculator_hexcode/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int height = 150;
  int weight = 50;

  String gender = '';

  late double bmi = calculateBMI(height: height, weight: weight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    print("Male");
                    setState(() {
                      gender = "M";
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: gender == "M"
                          ? Colors.orange.withAlpha(150)
                          : Colors.orange.withAlpha(50),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: const [
                        Icon(Icons.male, size: 150),
                        Text("Male"),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    print("Female");
                    setState(() {
                      gender = "F";
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: gender == "F"
                          ? Colors.orange.withAlpha(150)
                          : Colors.orange.withAlpha(50),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: const [
                        Icon(Icons.female, size: 150),
                        Text("Female"),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 50),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text("Height"),
                      Text(
                        "$height",
                        style: kInputLableColor,
                      ),
                      Row(
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                if (height > 50) height--;
                                bmi = calculateBMI(
                                    height: height, weight: weight);
                              });

                              print(height);
                            },
                            child: const Icon(
                              Icons.remove,
                              size: 40,
                            ),
                          ),
                          const SizedBox(width: 20),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                if (height < 250) height++;
                                bmi = calculateBMI(
                                    height: height, weight: weight);
                              });

                              print(height);
                            },
                            child: const Icon(
                              Icons.add,
                              size: 40,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text("Weight"),
                      Text(
                        "$weight",
                        style: kInputLableColor,
                      ),
                      Row(
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                if (weight > 20) weight--;
                                bmi = calculateBMI(
                                    height: height, weight: weight);
                              });

                              print(weight);
                            },
                            child: const Icon(
                              Icons.remove,
                              size: 40,
                            ),
                          ),
                          const SizedBox(width: 20),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                if (weight < 300) weight++;
                                bmi = calculateBMI(
                                    height: height, weight: weight);
                              });

                              print(weight);
                            },
                            child: const Icon(
                              Icons.add,
                              size: 40,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Column(children: [
              const Text("BMI"),
              Text(
                bmi.toStringAsFixed(2),
                style: kInputLableColor.copyWith(
                    color: kOutputTextColor, fontSize: 60),
              ),
              Text(
                getResult(bmi),
                style: kInputLableColor.copyWith(
                    color: const Color.fromARGB(255, 183, 162, 133)),
              )
            ]),
          ],
        ),
      ),
    ));
  }

  double calculateBMI({required int height, required int weight}) {
    return (weight / (height * height)) * 10000;
  }

  static String getResult(bmiValue) {
    if (bmiValue >= 25) {
      return 'OverWeight';
    } else if (bmiValue >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }
}
