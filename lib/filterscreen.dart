import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class filterscreen extends StatefulWidget {
  const filterscreen({super.key});

  @override
  State<filterscreen> createState() => _filterscreenState();
}

class _filterscreenState extends State<filterscreen> {
  var glutenfilterstate = false;
  var lactosfilterstate = false;
  var vegfilterstate = false;
  var nonvegfilterstate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("apply filters"),
      ),
      body: Column(
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
            title: Text(
              "non vegetarain",
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              "only includes non vegetarian meals",
              style: TextStyle(color: Colors.white),
            ),
            activeColor: Colors.blueAccent,
            contentPadding: EdgeInsets.only(left: 34, right: 32),
          ),
        ],
      ),
    );
  }
}
