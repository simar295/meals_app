import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

enum filters {
  glutenfree,
  lactosfree,
  vegetarian,
  nonvegetarian,
}

class filterscreen extends StatefulWidget {
  const filterscreen({super.key, required this.currentfilters});

  final Map<filters, bool> currentfilters;

  @override
  State<filterscreen> createState() => _filterscreenState();
}

class _filterscreenState extends State<filterscreen> {
  var glutenfilterstate = false;
  var lactosfilterstate = false;
  var vegfilterstate = false;
  var nonvegfilterstate = false;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
     glutenfilterstate = widget.currentfilters[filters.glutenfree]!;
    lactosfilterstate = widget.currentfilters[filters.lactosfree]!;
    vegfilterstate = widget.currentfilters[filters.vegetarian]!;
    nonvegfilterstate = widget.currentfilters[filters.nonvegetarian]!;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("apply filters"),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            filters.glutenfree: glutenfilterstate,
            filters.lactosfree: lactosfilterstate,
            filters.vegetarian: vegfilterstate,
            filters.nonvegetarian: nonvegfilterstate,
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: glutenfilterstate,
              onChanged: (index) {
                setState(() {
                  glutenfilterstate = index;
                });
              },
              title: Text(
                "gluten free",
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                "only includes gluten free meals",
                style: TextStyle(color: Colors.white),
              ),
              activeColor: Colors.blueAccent,
              contentPadding: EdgeInsets.only(left: 34, right: 32),
            ),
            SwitchListTile(
              value: lactosfilterstate,
              onChanged: (index) {
                setState(() {
                  lactosfilterstate = index;
                });
              },
              title: Text(
                "lactos free",
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                "only includes lactos free meals",
                style: TextStyle(color: Colors.white),
              ),
              activeColor: Colors.blueAccent,
              contentPadding: EdgeInsets.only(left: 34, right: 32),
            ),
            SwitchListTile(
              value: vegfilterstate,
              onChanged: (index) {
                setState(() {
                  vegfilterstate = index;
                });
              },
              title: Text(
                "vegetarian ",
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                "only includes vegetarian meals",
                style: TextStyle(color: Colors.white),
              ),
              activeColor: Colors.blueAccent,
              contentPadding: EdgeInsets.only(left: 34, right: 32),
            ),
            SwitchListTile(
              value: nonvegfilterstate,
              onChanged: (index) {
                setState(() {
                  nonvegfilterstate = index;
                });
              },
              title: const Text(
                "non vegetarain",
                style: TextStyle(color: Colors.white),
              ),
              subtitle: const Text(
                "only includes non vegetarian meals",
                style: TextStyle(color: Colors.white),
              ),
              activeColor: Colors.blueAccent,
              contentPadding: const EdgeInsets.only(left: 34, right: 32),
            ),
          ],
        ),
      ),
    );
  }
}
