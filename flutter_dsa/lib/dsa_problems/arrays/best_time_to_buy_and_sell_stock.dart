import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class buysell extends StatefulWidget
{
  const buysell({super.key});

  @override
  State<buysell> createState()=> _buysell();
}

class _buysell extends State<buysell>
{
  List<double> dailyPrice = [10, 7, 5, 8, 11, 9, 1, 6, 4, 10];
  double maxProfit=0;
   int? buyDay;
   int? sellDay;

  void buysell_fun(){

    double minPrice= double.infinity;

    int minIndex=0;

    for(int i=0; i<=dailyPrice.length;i++)
      {
        if(dailyPrice[i]<minPrice)
          {
            minPrice=dailyPrice[i];
            minIndex=i;
          }
        double profit = dailyPrice[i]-minPrice;
        if(profit>maxProfit)
          {
            setState(() {
              maxProfit=profit;
            });
            buyDay=minIndex;
            sellDay=i;
          }

      }
  }
  
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buy and Sell"),
      ),
      body: Padding(padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Daily Prices",style: TextStyle(
            fontSize: 18,fontWeight: FontWeight.bold
          ),),
          const SizedBox(height: 16,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(dailyPrice.length,
                (index)=> Text("Day ${index+1} : \$${dailyPrice[index]}"),
            ),
          ),
          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: buysell_fun,
            child: const Text("Analyze"),
          ),

          // show result
          if (buyDay != null && sellDay != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Buy on Day: ${buyDay! + 1}  (Price: \$${dailyPrice[buyDay!]})"),
                Text("Sell on Day: ${sellDay! + 1}  (Price: \$${dailyPrice[sellDay!]})"),
                Text(
                  "Max Profit: \$${maxProfit.toStringAsFixed(2)}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            )
          else
            const Text("Press 'Analyze' to find best buy/sell days."),
        ],
      ),),
    );
  }

}