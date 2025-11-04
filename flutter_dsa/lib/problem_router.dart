// lib/data/problem_router.dart
import 'package:flutter/material.dart';
import 'package:flutter_dsa/dsa_problems/arrays/best_time_to_buy_and_sell_stock.dart';
import 'package:flutter_dsa/dsa_problems/arrays/two_sum.dart';

/// This map connects problem names to their actual Flutter screen widgets.
final Map<String, WidgetBuilder> problemRoutes = {
  "Two Sum": (context) => const TwoSumScreen(),
  "Best Time to Buy and Sell Stock" : (context) => const buysell(),
  // 👇 Add more later as you create more problem screens
  // "Valid Anagram": (context) => const ValidAnagramScreen(),
  // "Binary Search": (context) => const BinarySearchScreen(),
};
