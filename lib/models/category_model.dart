import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CategoryModel {
  String name;
  Widget icon;
  Color boxColor;

  CategoryModel({
    required this.name,
    required this.icon,
    required this.boxColor,
  });

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(
      CategoryModel(
        name: 'Salad',
        icon: const Icon(
          LucideIcons.salad,
          size: 30,
          color: Colors.green,
        ),
        boxColor: const Color(0xffFFD9D9),
      ),
    );

    categories.add(
      CategoryModel(
        name: 'Cake',
        icon: const Icon(
          LucideIcons.cake,
          size: 30,
          color: Colors.pink,
        ),
        boxColor: const Color(0xffFFECD9),
      ),
    );

    categories.add(
      CategoryModel(
        name: 'Egg',
        icon: const Icon(
          LucideIcons.eggFried,
          size: 30,
          color: Colors.yellow,
        ),
        boxColor: const Color(0xffD9FFD9),
      ),
    );

    categories.add(
      CategoryModel(
        name: 'Smoothies',
        icon: const Icon(
          LucideIcons.glassWater,
          size: 30,
          color: Colors.blue,
        ),
        boxColor: const Color(0xffD9F7FF),
      ),
    );

    return categories;
  }
}

// class CategoryModel {
//   String name;
//   String iconPath;
//   Color boxColor;

//   CategoryModel({
//     required this.name,
//     required this.iconPath,
//     required this.boxColor,
//   });

//   static List<CategoryModel> getCategories() {
//     List<CategoryModel> categories = [];

//     categories.add(
//       CategoryModel(
//         name: 'Salad',
//         iconPath: 'assets/icons/plate.svg',
//         boxColor: const Color(0xffFFD9D9),
//       ),
//     );

//     categories.add(
//       CategoryModel(
//         name: 'Cake',
//         iconPath: 'assets/icons/pancakes.svg',
//         boxColor: const Color(0xffFFECD9),
//       ),
//     );

//     categories.add(
//       CategoryModel(
//         name: 'Pie',
//         iconPath: 'assets/icons/pie.svg',
//         boxColor: const Color(0xffD9FFD9),
//       ),
//     );

//     categories.add(
//       CategoryModel(
//         name: 'Smoothies',
//         iconPath: 'assets/icons/orange-snacks.svg',
//         boxColor: const Color(0xffD9F7FF),
//       ),
//     );

//     return categories;
//   }
// }
