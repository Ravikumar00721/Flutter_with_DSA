import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TripletFinderApp extends StatefulWidget
{
  const TripletFinderApp({super.key});

  @override
  State<TripletFinderApp> createState() => _TripletFinderAppState();
}

class _TripletFinderAppState extends State<TripletFinderApp> {

  final _numberController= TextEditingController();
  final _targetController= TextEditingController();

  List<List<int>> triplets=[];

  List<List<int>> findTriplets(List<int> nums, int target)
  {

    List<List<int>> result=[];
    nums.sort();

    for(int i=0;i<nums.length-2;i++)
      {
        if(i>0 && nums[i]==nums[i-1]) continue;

        int left=i+1;
        int right=nums.length-1;

        while(left<right)
          {

            int sum=nums[i]+nums[left]+nums[right];

            if(sum==target)
              {
                result.add([nums[i],nums[left],nums[right]]);

                while(left<right && nums[left]<nums[left+1]) {
                  left++;
                }

                while(left<right && nums[right]<nums[right-1]) {
                  right--;
                }

                left++;
                right--;
              }
            else if(sum<target)
              {
                left++;
              }
            else
              {
                right--;
              }
          }

      }
    return result;
  }

  void calculateTriplet(){
    try{
      List<int> nums =_numberController.text.split(',').map((e)=>int.parse(e.trim())).toList();
      int target= int.parse(_targetController.text.trim());

      List<List<int>> result=findTriplets(nums, target);

      setState(() {
        triplets=result;
      });
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid Input !!")));
    }
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Triplet Finder App"),
      ),
      body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              const Text(
                "Enter comma-separated numbers and target sum:",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _numberController,
                decoration: const InputDecoration(
                  labelText: "Enters Numbers",
                  border: OutlineInputBorder()
                ),
                keyboardType: TextInputType.text
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _targetController,
                decoration: const InputDecoration(
                  labelText: "Target Sum",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: calculateTriplet,
                icon: const Icon(Icons.search),
                label: const Text("Find Triplets"),
              ),
              const SizedBox(height: 20),
              Expanded(child: triplets.isEmpty? const Center(
                child: Text("No Triplets Founds",
                  style: TextStyle(color: Colors.grey,fontSize: 16),),
              ): ListView.builder(
                  itemCount: triplets.length,
                  itemBuilder: (context,index){
                    final t= triplets[index];
                    return Card(
                      elevation: 2,
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      child: ListTile(
                        leading: Icon(Icons.numbers),
                        title: Text(
                          "[ ${t[0]}, ${t[1]}, ${t[2]} ]",
                          style: const TextStyle(fontSize: 18),
                        ),
                        subtitle:
                        Text("Sum = ${t[0] + t[1] + t[2]}"),
                      ),
                    );
                  })
              )
            ],
          ),
      ),
    );
  }
}