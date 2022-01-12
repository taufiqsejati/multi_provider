// ignore_for_file: avoid_print

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:multi_provider/height_provider.dart';
import 'package:multi_provider/weight_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var weightProvider = Provider.of<WeightProvider>(context);
    var heightProvider = Provider.of<HeightProvider>(context);
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Your Weight (kg) :',
              style: TextStyle(fontSize: 20),
            ),
            Slider(
                value: weightProvider.weight,
                divisions: 100,
                label: weightProvider.weight.round().toString(),
                min: 1,
                max: 100,
                onChanged: (newValue) {
                  newValue.roundToDouble();
                  print('weight : $newValue');
                  weightProvider.weight = newValue;
                }),
            //NOTE - Menggunakan Consumer
            // Consumer<WeightProvider>(
            //   builder: (context, weightProvider, _) => Slider(
            //       value: weightProvider.weight,
            //       divisions: 100,
            //       label: weightProvider.weight.round().toString(),
            //       min: 1,
            //       max: 100,
            //       onChanged: (newValue) {
            //         newValue.roundToDouble();
            //         print('weight : $newValue');
            //         weightProvider.weight = newValue;
            //       }),
            // ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Your Height (cm) :',
              style: TextStyle(fontSize: 20),
            ),
            Slider(
                value: heightProvider.height,
                min: 1,
                max: 200,
                divisions: 100,
                label: heightProvider.height.round().toString(),
                activeColor: Colors.pink,
                inactiveColor: Colors.pink.withOpacity(0.2),
                onChanged: (newValue) {
                  newValue.roundToDouble();
                  print('height : $newValue');
                  heightProvider.height = newValue;
                }),
            //NOTE - Menggunakan Consumer
            // Consumer<HeightProvider>(
            //   builder: (context, heightProvider, _) => Slider(
            //       value: heightProvider.height,
            //       min: 1,
            //       max: 200,
            //       divisions: 100,
            //       label: heightProvider.height.round().toString(),
            //       activeColor: Colors.pink,
            //       inactiveColor: Colors.pink.withOpacity(0.2),
            //       onChanged: (newValue) {
            //         newValue.roundToDouble();
            //         print('height : $newValue');
            //         heightProvider.height = newValue;
            //       }),
            // ),
            const SizedBox(
              height: 50,
            ),
            Text(
              'Your BMI:\n${(weightProvider.weight / (pow(heightProvider.height / 100, 2))).toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            )
            //NOTE - Menggunakan Consumer
            // Consumer<WeightProvider>(
            //   builder: (context, weightProvider, _) => Consumer<HeightProvider>(
            //     builder: (context, heightProvider, _) => Text(
            //       'Your BMI:\n${(weightProvider.weight / (pow(heightProvider.height / 100, 2))).toStringAsFixed(2)}',
            //       style: const TextStyle(
            //           fontSize: 24, fontWeight: FontWeight.w500),
            //       textAlign: TextAlign.center,
            //     ),
            //   ),
            // ),
          ],
        ),
      )),
    );
  }
}
