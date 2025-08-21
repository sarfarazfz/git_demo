import 'package:flutter/material.dart';

class ActivityFoodList extends StatelessWidget {
  const ActivityFoodList({super.key});
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> listFood = [
      {
        "title": "Margherita Pizza",
        "originalPrice": "360",
        "discountPrice": "299",
      },
      {
        "title": "Spaghetti Carbonara",
        "originalPrice": "200",
        "discountPrice": "150",
      },
      {
        "title": "Chicken Tikka Masala",
        "originalPrice": "250",
        "discountPrice": "199",
      },
      {"title": "Caesar Salad", "originalPrice": "120", "discountPrice": "99"},
      {
        "title": "Veggie Burger",
        "originalPrice": "199",
        "discountPrice": "149",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Food Menu"),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(listFood[index]['title']!),
            subtitle: Text(
              "Original Price: ${listFood[index]['originalPrice']}\nDiscount Price: ${listFood[index]['discountPrice']}",
            ),
            trailing: Icon(Icons.arrow_right),
            leading: Icon(Icons.emoji_food_beverage),
          );
        },

        itemCount: listFood.length,
      ),
    );
  }
}
