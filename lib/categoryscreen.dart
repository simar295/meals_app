import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mealsapp/categoryclass.dart';
import 'package:mealsapp/categorywidget.dart';
import 'package:mealsapp/dummy_data.dart';
import 'package:mealsapp/mealclass.dart';
import 'package:mealsapp/mealscreen.dart';

class categoryscreen extends StatelessWidget {
  categoryscreen({super.key, required this.ontogglefavoritescatscreen});

  final void Function(mealclass getmeals) ontogglefavoritescatscreen;

  void selectedcategory(
      BuildContext context /*for  navigator*/, categoryclass cat) {
    ////////////////////////////////////////////////////////////////////////////
    final filteredlist = dummyMeals
        .where((element) => element.categories.contains(cat.id))
        .toList();
    //dummymeals waali list me where categories(type) contains categoryclass ki id
    ////////////////////////////////////////////////////////////////////////////
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => mealscreen(
            getitle: cat.title,
            getmeals: filteredlist,
            ontogglefavoritesmealscreen: ontogglefavoritescatscreen),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      /*  appBar: AppBar(
        title: Text("pick your meal"),
      ), */
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
            categorygrid(
              categoryclasstitle: variable,
              getselectedcategoryfunction: () {
                selectedcategory(context, variable);
              },
            )
/*    availableCategories.map((category) => categorygrid(category: category)).toList() */
        ],
      ),
    );
  }
}
