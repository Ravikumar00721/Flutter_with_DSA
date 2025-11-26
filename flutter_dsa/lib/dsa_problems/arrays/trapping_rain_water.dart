import 'dart:math';
import 'package:flutter/material.dart';

class VisualRainWater extends StatefulWidget {
  const VisualRainWater({super.key});

  @override
  State<VisualRainWater> createState() => _VisualRainWaterState();
}

class _VisualRainWaterState extends State<VisualRainWater> {
  final List<int> height = [4, 2, 0, 3, 2, 5];
  late List<int> trappedWater;

  @override
  void initState() {
    super.initState();
    trappedWater = calculateTrappedWater(height);
  }

  List<int> calculateTrappedWater(List<int> num) {
    int n = num.length;
    List<int> water = List.filled(n, 0);

    int left = 0, right = n - 1;
    int leftMax = num[left], rightMax = num[right];

    while (left < right) {
      if (num[left] < num[right]) {
        left++;
        leftMax = max(leftMax, num[left]);
        water[left] = leftMax - num[left];
      } else {
        right--;
        rightMax = max(rightMax, num[right]);
        water[right] = rightMax - num[right];
      }
    }

    return water;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Trapping Rain Water Visual")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(height.length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      Container(
                        width: 25,
                        height: trappedWater[index] * 20,
                        color: Colors.blue.withOpacity(0.6),
                      ),

                      Container(
                        width: 25,
                        height: height[index] * 20,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 5),
                      Text("${height[index]}"),
                    ],
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
            Text(
              "Total Water: ${trappedWater.reduce((a, b) => a + b)}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
