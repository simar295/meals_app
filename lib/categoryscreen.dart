import 'package:flutter/material.dart';
import 'package:mealsapp/categoryclass.dart';
import 'package:mealsapp/categorywidget.dart';
import 'package:mealsapp/dummy_data.dart';
import 'package:mealsapp/mealclass.dart';
import 'package:mealsapp/mealscreen.dart';

class categoryscreen extends StatefulWidget {
  const categoryscreen(
      {super.key,
      required this.ontogglefavoritescatscreen,
      required this.availablemeals});

  final void Function(mealclass getmeals) ontogglefavoritescatscreen;

  final List<mealclass> availablemeals;

  @override
  State<categoryscreen> createState() => _categoryscreenState();
}

////////////////////////////////////////////////////////////////////////////////
class _categoryscreenState extends State<categoryscreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animatecontrol;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animatecontrol = AnimationController(
        duration: const Duration(milliseconds: 300),
        vsync: this,
        lowerBound: 0,
        upperBound: 1);

    animatecontrol.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animatecontrol.dispose();
    super.dispose();
  }

///////////////////////////////////////////////////////////////////////////////////
  void selectedcategory(
      BuildContext context /*for  navigator*/, categoryclass cat) {
    ////////////////////////////////////////////////////////////////////////////
    final filteredlist = widget.availablemeals
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
            ontogglefavoritesmealscreen: widget.ontogglefavoritescatscreen),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animatecontrol,
      child: GridView(
        padding: const EdgeInsets.all(24),
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
      builder: (context, child) => Padding(
        child: child,
        padding: EdgeInsets.all(100 - animatecontrol.value * 100),
      ),
    );
  }
}
