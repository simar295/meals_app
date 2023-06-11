import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mealsapp/categoryscreen.dart';
import 'package:mealsapp/drawerwidget.dart';
import 'package:mealsapp/dummy_data.dart';
import 'package:mealsapp/filterscreen.dart';
import 'package:mealsapp/mealclass.dart';
import 'package:mealsapp/mealscreen.dart';

const initalfilters = {
  filters.glutenfree: false,
  filters.lactosfree: false,
  filters.vegetarian: false,
  filters.nonvegetarian: false,
};

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

  void setscreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == "filters") {
      final result = await Navigator.of(context)
          .push<Map<filters, bool>> /*pushreplacement*/ (
        MaterialPageRoute(
            builder: (ctx) => filterscreen(
                  currentfilters: selectedfilters,
                )),
      ); /* else {
      Navigator.of(context).pop();
    } */
      setState(() {
        selectedfilters = result ?? initalfilters;
      });
    }
  }
/////////////////////////////////////////////////////////////

  Map<filters, bool> selectedfilters = initalfilters;

////////////////////////////////////////////////////////////

  Widget build(BuildContext context) {
    final availablefilters = dummyMeals.where((element) {
      if (selectedfilters[filters.glutenfree]! &&
          !element.isGlutenFree /*pre "!"check is it is not true*/) {
        return false;
      }
      if (selectedfilters[filters.lactosfree]! && !element.isLactoseFree) {
        return false;
      }
      if (selectedfilters[filters.vegetarian]! && !element.isVegetarian) {
        return false;
      }
      if (selectedfilters[filters.nonvegetarian]! && !element.isVegan) {
        return false;
      }
      return true;
    }).toList();

    Widget activescreen = categoryscreen(
      ontogglefavoritescatscreen: togglemealfavorite,
      availablemeals: availablefilters,
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
