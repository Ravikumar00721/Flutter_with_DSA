import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MedianOfTwoSortedArrays extends StatefulWidget {
  const MedianOfTwoSortedArrays({super.key});

  @override
  State<MedianOfTwoSortedArrays> createState() => _MedianOfTwoSortedArraysState();
}

class _MedianOfTwoSortedArraysState extends State<MedianOfTwoSortedArrays> {

  final List<int> nums1 = [1, 2];
  final List<int> nums2 = [3,4];

  void MedianCall()
  {
    List<int> num3=[];
    num3.addAll(nums1);
    num3.addAll(nums2);
    num3.sort();

    int n=num3.length;

    if(n%2!=0)
      {
        print(num3[n ~/ 2].toDouble());
      }

    int x = (n - 1) ~/ 2;
    int y = x + 1;

    double result = (num3[x] + num3[y]) / 2.0;
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Median of Two Sorted Arrays"),
      ),
      body: Center(
        child: ElevatedButton(onPressed: MedianCall, child: Text("Find Median")),
      ),
    );
  }
}
