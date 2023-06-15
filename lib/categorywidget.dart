import 'package:flutter/material.dart';
import 'categoryclass.dart';

class categorygrid extends StatelessWidget {
  const categorygrid({
    super.key,
    required this.categoryclasstitle,
    required this.getselectedcategoryfunction,
  });

  final categoryclass categoryclasstitle;
  final void Function() getselectedcategoryfunction;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: getselectedcategoryfunction,
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(
            colors: [
              categoryclasstitle.color.withOpacity(0.55),
              categoryclasstitle.color.withOpacity(0.9)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          categoryclasstitle.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
