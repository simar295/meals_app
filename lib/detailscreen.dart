import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mealsapp/main.dart';
import 'package:mealsapp/mealclass.dart';

class detailscreen extends StatelessWidget {
  const detailscreen({super.key, required this.getdetailclasses});

  final mealclass getdetailclasses;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getdetailclasses.title),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.star_border),
          ),
          SizedBox(
            width: 6,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              getdetailclasses.imageUrl,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 14,
            ),
            Text("INGREDIENTS",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Color.fromARGB(255, 255, 166, 0))),
            const SizedBox(
              height: 10,
            ),
            for (final ingredients in getdetailclasses.ingredients)
              Text(
                ingredients,
                style: TextStyle(color: Colors.white),
              ),
            const SizedBox(
              height: 14,
            ),
            const Text("Receipe",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Color.fromARGB(255, 255, 166, 0))),
            const SizedBox(
              height: 10,
            ),
            for (final steps in getdetailclasses.steps)
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  steps,
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              )
          ],
        ),
      ),
    );
  }
}
