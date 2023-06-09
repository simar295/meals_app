import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mealsapp/categorywidget.dart';
import 'package:mealsapp/dummy_data.dart';
import 'package:mealsapp/mealscreen.dart';

class categoryscreen extends StatelessWidget {
  categoryscreen({super.key});


  void selectedcategory(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => mealscreen(getitle: "getitle", getmeals: []),
      ),
    );
  }



  Widget build(BuildContext) {
    return Scaffold(
      appBar: AppBar(
        title: Text("pick your meal"),
      ),
      body: GridView(
        padding: EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final variable in availableCategories)
            categorygrid(categoryclasstype: variable)
/*    availableCategories.map((category) => categorygrid(category: category)).toList() */
        ],
      ),
    );
  }
}
