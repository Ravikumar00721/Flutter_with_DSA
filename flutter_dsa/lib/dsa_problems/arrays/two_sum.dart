import 'package:flutter/material.dart';

class TwoSumScreen extends StatefulWidget {
  const TwoSumScreen({super.key});

  @override
  State<TwoSumScreen> createState() => _TwoSumScreenState();
}

class _TwoSumScreenState extends State<TwoSumScreen>
{
  final List<Map<String, dynamic>> products = [
    {"name": "Headphones", "price": 40},
    {"name": "Mouse", "price": 25},
    {"name": "Keyboard", "price": 35},
    {"name": "USB Drive", "price": 15},
    {"name": "Power Bank", "price": 45},
    {"name": "Charger", "price": 30},
  ];

  final TextEditingController _walletController = TextEditingController();

  List<Map<String,dynamic>>? matchedPair;

  void findTwoProducts(){
    final wallet = int.tryParse(_walletController.text.trim());
    if(wallet == null) return;


    Map<int,int> priceMap = {};
    matchedPair= null;

    for(int i=0; i< products.length; i++){
      final price= products[i]["price"];
      final complement = wallet - price;

      if(priceMap.containsKey(complement))
        {
          final j = priceMap[complement]!;
          setState(() {
            matchedPair=[products[j],products[i]];
          });
          return;
        }
      priceMap[price]=i;
    }

    setState(() {
      matchedPair = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Two Sum")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              "Enter your wallet balance and find two products that match!",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _walletController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Wallet Balance",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: findTwoProducts,
              child: const Text("Find Matching Products"),
            ),
            const SizedBox(height: 24),
            if (matchedPair == null)
              const SizedBox()
            else if (matchedPair!.isEmpty)
              const Text("❌ No matching pair found.",
                  style: TextStyle(color: Colors.red))
            else
              Card(
                color: Colors.green.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const Text("✅ Found Match!",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      const SizedBox(height: 8),
                      Text(
                          "${matchedPair![0]["name"]} (\$${matchedPair![0]["price"]}) + "
                              "${matchedPair![1]["name"]} (\$${matchedPair![1]["price"]})"),
                      const SizedBox(height: 8),
                      Text(
                        "Total = \$${matchedPair![0]["price"] + matchedPair![1]["price"]}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.green),
                      )
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (_, i) {
                  final p = products[i];
                  return ListTile(
                    leading: const Icon(Icons.shopping_bag_outlined),
                    title: Text(p["name"]),
                    trailing: Text("\$${p["price"]}"),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}