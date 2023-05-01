import 'package:flutter/material.dart';

class PopularDietsModel {
  String name;
  IconData icon;
  String level;
  String duration;
  String calorie;
  bool boxIsSelected;

  PopularDietsModel({
    required this.name,
    required this.icon,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.boxIsSelected,
  });

  static List<PopularDietsModel> getPopularDiets() {
    List<PopularDietsModel> popularDiets = [];

    popularDiets.add(
      PopularDietsModel(
        name: 'Keto Diet',
        icon: Icons.ac_unit,
        level: 'Easy',
        duration: '1 Month',
        calorie: '1200',
        boxIsSelected: true,
      ),
    );

    popularDiets.add(
      PopularDietsModel(
        name: 'Vegan Diet',
        icon: Icons.ac_unit,
        level: 'Easy',
        duration: '1 Month',
        calorie: '1200',
        boxIsSelected: false,
      ),
    );

    popularDiets.add(
      PopularDietsModel(
        name: 'Atkins Diet',
        icon: Icons.ac_unit,
        level: 'Easy',
        duration: '1 Month',
        calorie: '1200',
        boxIsSelected: false,
      ),
    );

    return popularDiets;
  }
}
