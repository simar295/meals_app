import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mealsapp/categoryscreen.dart';
import 'package:mealsapp/drawerwidget.dart';
import 'package:mealsapp/mealclass.dart';
import 'package:mealsapp/mealscreen.dart';

class tab extends StatefulWidget {
  @override
  State<tab> createState() {
    return tabstate();
  }
}

///////////////////////////////////////////////////
class tabstate extends State<tab> {
  int selectedpageindex = 0;
  void selectedpage(int index) {
    setState(() {
      selectedpageindex = index;
    });
  }

/////////////////////////////////////////////////////
  final List<mealclass> favoritemeals = [];
  void togglemealfavorite(mealclass getmeal) {
    final isexisting = favoritemeals.contains(getmeal);
    setState(() {
      if (isexisting) {
        favoritemeals.remove(getmeal);
        showmessage("meal removed");
      } else {
        favoritemeals.add(getmeal);
        showmessage("meal added");
      }
    });
  }

////////////////////////////////////////////////////////

  void showmessage(String getmessage) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(milliseconds: 1000),
        content: Text(getmessage),
      ),
    );
  }

/////////////////////////////////////////////////

  void setscreen(String identifier) {
    if (identifier == "filters") {
    } else {
      Navigator.of(context).pop();
    }
  }

  Widget build(BuildContext context) {
    Widget activescreen = categoryscreen(
      ontogglefavoritescatscreen: togglemealfavorite,
    );
    var activetitle = "categories";
    if (selectedpageindex == 1) {
      activescreen = mealscreen(
        getmeals: favoritemeals,
        ontogglefavoritesmealscreen: togglemealfavorite,
      );
      activetitle = "favorites";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activetitle),
      ),
      drawer: drawerwidget(onselectfromdrawer: setscreen),
      body: activescreen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedpageindex,
        selectedItemColor: Color.fromARGB(255, 255, 9, 103),
        /*  selectedIconTheme: IconThemeData(color: Colors.blueAccent), */
        onTap: selectedpage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dinner_dining),
            label: "categories",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.star_border),
              label: "favorites",
              activeIcon: Icon(Icons.star)),
        ],
      ),
    );
  }
}
