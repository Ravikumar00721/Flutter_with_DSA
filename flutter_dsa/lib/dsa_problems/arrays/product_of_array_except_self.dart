import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductOfArrayExceptSelf extends StatefulWidget {
  const ProductOfArrayExceptSelf({super.key});

  @override
  State<ProductOfArrayExceptSelf> createState() => _ProductOfArrayExceptSelfState();
}

class _ProductOfArrayExceptSelfState extends State<ProductOfArrayExceptSelf> {

  TextEditingController inputController = TextEditingController();
  String performance="";
  List<int> result = [];


  List<int> productExceptSelf(List<int> nums) {
    int n = nums.length;
    List<int> result = List.filled(n, 1);

    int left=1;
    for(int i=0;i<n;i++)
      {
         result[i]=left;
         left*=nums[i];
      }

    int right=1;
    for(int i=n-1;i>=0;i--)
      {
        result[i]*=right;
        right*=nums[i];
      }
    return result;
  }

  void CalculateProduct()
  {
    final input=inputController.text.trim();
    if(input.isEmpty) return;

    final numbers=input.split(',').map((e)=> int.parse(e)).toList();

    final stopwatch=Stopwatch()..start();
    final output=productExceptSelf(numbers);
    Stopwatch().stop();

    setState(() {
      result = output;
      performance =
      "Time taken: ${stopwatch.elapsedMicroseconds} μs | Complexity: O(n)";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product of Array Except Self"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Enter numbers separated by commas:"),
            TextField(
              controller: inputController,
              decoration: const InputDecoration(
                hintText: "Example: 1,2,3,4",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: CalculateProduct,
              child: const Text("Calculate"),
            ),
            const SizedBox(height: 20),
            Text("Result: $result",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(performance,
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.blueGrey.shade600,
                    fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
