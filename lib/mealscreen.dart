import 'package:flutter/material.dart';
import 'package:mealsapp/detailscreen.dart';
import 'package:mealsapp/mealclass.dart';
import 'package:mealsapp/mealwidget.dart';

class mealscreen extends StatelessWidget {
  const mealscreen(
      {super.key,
      this.getitle,
      required this.getmeals,
      required this.ontogglefavoritesmealscreen});

  final String? getitle;
  final List<mealclass> getmeals;

  final void Function(mealclass getmeals) ontogglefavoritesmealscreen;

  void selectmeal(BuildContext context, mealclass getmeals) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => detailscreen(
          getdetailclasses: getmeals,
          ontogglefavorites: ontogglefavoritesmealscreen,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: getmeals.length,
      itemBuilder: ((context, index) => mealwidget(
            mealclasstitles: getmeals[index],
            onselectedmealfunction: (getmeals) {
              selectmeal(context, getmeals);
            },
          )),
    );

    if (getmeals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "nothing available",
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "try selecting a diffrent category",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            )
          ],
        ),
      );
    }
    if (getitle == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(getitle!),
      ),
      body: content,
    );
  }
}
