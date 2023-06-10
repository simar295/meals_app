import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mealsapp/categoryscreen.dart';
import 'package:mealsapp/mealscreen.dart';

class tab extends StatefulWidget {
  @override
  State<tab> createState() {
    return tabstate();
  }
}

class tabstate extends State<tab> {
  int selectedpageindex = 0;
  void selectedpage(int index) {
    setState(() {
      selectedpageindex = index;
    });
  }

  Widget build(BuildContext context) {
    Widget activescreen = categoryscreen();
    var activetitle = "categories";
    if (selectedpageindex == 1) {
      activescreen = mealscreen(getmeals: []);
      activetitle = "favorites";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activetitle),
      ),
      body: activescreen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedpageindex,
        selectedItemColor: Color.fromARGB(255, 255, 9, 103),
        /*  selectedIconTheme: IconThemeData(color: Colors.blueAccent), */
        onTap: selectedpage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.dinner_dining), label: "categories"),
          BottomNavigationBarItem(
              icon: Icon(Icons.star_border), label: "favorites"),
        ],
      ),
    );
  }
}
