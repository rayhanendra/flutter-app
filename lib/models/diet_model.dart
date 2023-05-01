import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class DietModel {
  String name;
  IconData icon;
  String level;
  String duration;
  String calorie;
  Color boxColor;
  bool viewIsSelected;

  DietModel({
    required this.name,
    required this.icon,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.boxColor,
    required this.viewIsSelected,
  });

  static List<DietModel> getDiets() {
    List<DietModel> diets = [];

    diets.add(
      DietModel(
        name: 'Keto Diet',
        icon: LucideIcons.salad,
        level: 'Easy',
        duration: '1 Week',
        calorie: '1200',
        boxColor: Colors.red,
        viewIsSelected: true,
      ),
    );

    diets.add(
      DietModel(
        name: 'Vegan Diet',
        icon: LucideIcons.salad,
        level: 'Easy',
        duration: '1 Week',
        calorie: '1200',
        boxColor: Colors.blue,
        viewIsSelected: false,
      ),
    );

    diets.add(
      DietModel(
        name: 'Vegetarian Diet',
        icon: LucideIcons.salad,
        level: 'Easy',
        duration: '1 Week',
        calorie: '1200',
        boxColor: Colors.green,
        viewIsSelected: false,
      ),
    );

    diets.add(
      DietModel(
        name: 'Paleo Diet',
        icon: LucideIcons.salad,
        level: 'Easy',
        duration: '1 Week',
        calorie: '1200',
        boxColor: Colors.yellow,
        viewIsSelected: false,
      ),
    );

    diets.add(
      DietModel(
        name: 'Mediterranean Diet',
        icon: LucideIcons.salad,
        level: 'Easy',
        duration: '1 Week',
        calorie: '1200',
        boxColor: Colors.purple,
        viewIsSelected: false,
      ),
    );

    return diets;
  }
}
