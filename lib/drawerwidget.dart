import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class drawerwidget extends StatelessWidget {
  const drawerwidget({super.key, required this.onselectfromdrawer});

///////////////////////////////////////////////////////
  final void Function(String identifier) onselectfromdrawer;
////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.redAccent,
                Color.fromARGB(255, 27, 180, 252).withOpacity(0.8),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: Row(
              children: const [
                Icon(
                  Icons.fastfood_outlined,
                  size: 48,
                  color: Color.fromARGB(255, 6, 255, 47),
                ),
                SizedBox(
                  width: 18,
                ),
                Text(
                  "cooking up!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                )
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.restaurant,
              size: 26,
              color: Colors.redAccent,
            ),
            title: const Text(
              "Meals",
              style:
                  TextStyle(fontSize: 20, color: Color.fromARGB(255, 0, 0, 0)),
            ),
            onTap: () {
              onselectfromdrawer("meals");
            },
          ),
          ListTile(
            onTap: () {
              onselectfromdrawer("filters");
            },
            leading: Icon(
              Icons.filter_alt_outlined,
              size: 26,
              color: Colors.redAccent,
            ),
            title: Text(
              "Filters",
              style:
                  TextStyle(fontSize: 20, color: Color.fromARGB(255, 0, 0, 0)),
            ),
          ),
        ],
      ),
    );
  }
}
