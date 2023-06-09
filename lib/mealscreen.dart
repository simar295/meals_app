import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mealsapp/mealclass.dart';
import 'package:mealsapp/mealwidget.dart';

class mealscreen extends StatelessWidget {
  const mealscreen({super.key, required this.getitle, required this.getmeals});

  final String getitle;
  final List<mealclass> getmeals;

  @override
  Widget build(BuildContext context) {

    
    Widget content = ListView.builder(
      itemCount: getmeals.length,
      itemBuilder: ((context, index) => mealwidget(mealclasstitles: getmeals[index],)),
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
            SizedBox(
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

    return Scaffold(
      appBar: AppBar(
        title: Text(getitle),
      ),
      body: content,
    );
  }
}
