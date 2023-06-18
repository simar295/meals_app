import 'package:flutter/material.dart';
import 'package:mealsapp/mealclass.dart';
import 'package:transparent_image/transparent_image.dart';

class mealwidget extends StatelessWidget {
  const mealwidget(
      {super.key,
      required this.mealclasstitles,
      required this.onselectedmealfunction});

  final mealclass mealclasstitles;
  final void Function(mealclass mealclasstitles) onselectedmealfunction;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () {
          onselectedmealfunction(mealclasstitles);
        },
        child: Stack(
          children: [
            Hero(
              tag: mealclasstitles.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(mealclasstitles.imageUrl),
                fit: BoxFit.cover,
                height: 250,
                width: double.infinity,
              ),
            ),
            //networkimage is to fetch image from network
            //postioned is used with stacks to position new widgets ontop of other
            //stack is the bottom most widget and other are on top

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: const Color.fromARGB(255, 0, 0, 0),
                child: Column(
                  children: [
                    Text(
                      mealclasstitles.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      //for showing ...dots in the end
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(12),
                        ),
                        const Icon(
                          Icons.timer_outlined,
                          size: 17,
                          color: Color.fromARGB(255, 255, 0, 0),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          '${mealclasstitles.duration} min',
                          style: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Icon(
                          Icons.castle_sharp,
                          size: 17,
                          color: Color.fromARGB(255, 61, 198, 252),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          '${mealclasstitles.complexity.name} ',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 10),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Icon(
                          Icons.monetization_on,
                          size: 17,
                          color: Color.fromARGB(255, 54, 248, 15),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          '${mealclasstitles.affordability.name} ',
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
