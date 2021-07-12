import 'package:flutter/material.dart';

class Category {
  Category({
    this.title = '',
    this.imagePath = '',
    this.lessonCount = 0,
    this.money = 0,
    this.total_expense = 0,
    this.rating = 0.0,
    this.navigteto = '',
    this.colors = Colors.red,

  });

  String title;
  int lessonCount;
  int money;
  int total_expense;
  double rating;
  String imagePath;
  String navigteto;
  Color colors;

  static List<Category> categoryList = <Category>[
    Category(
      imagePath: 'assets/design_course/interFace1.png',
      title: 'Fuel',
      lessonCount: 24,
      money: 25,
      total_expense: 20000,
      rating: 4.3,
      navigteto: 'add_screen',
      colors: Colors.pinkAccent.shade100,
    ),
    Category(
      imagePath: 'assets/design_course/interFace2.png',
      title: 'Repair',
      lessonCount: 22,
      money: 18,
      total_expense: 20000,
      rating: 4.6,
      navigteto: 'add_screen',
      colors: Colors.green,
    ),
    Category(
      imagePath: 'assets/design_course/interFace1.png',
      title: 'Service',
      lessonCount: 24,
      money: 25,
      total_expense: 20000,
      rating: 4.3,
      navigteto: 'add_screen',
      colors: Colors.indigo.shade600,
    ),
    Category(
      imagePath: 'assets/design_course/interFace2.png',
      title: 'PUC / Insurance',
      lessonCount: 22,
      money: 18,
      total_expense: 20000,
      rating: 4.6,
      navigteto: 'add_screen',
      colors: Colors.orange.shade300,
    ),
    Category(
      imagePath: 'assets/design_course/interFace2.png',
      title: 'Tyre Care',
      lessonCount: 22,
      money: 18,
      total_expense: 20000,
      rating: 4.6,
      navigteto: 'add_screen',
      colors: Colors.white30,
    ),
  ];

  static List<Category> popularCourseList = <Category>[
    Category(
      imagePath: 'assets/design_course/interFace3.png',
      title: 'Total Fuel',
      lessonCount: 12,
      money: 25,
      total_expense: 20000,
      rating: 4.8,
      navigteto: 'add_screen',
      colors: Colors.pinkAccent.shade200,
    ),
    Category(
      imagePath: 'assets/design_course/interFace4.png',
      title: 'Total Service',
      lessonCount: 28,
      money: 208,
      total_expense: 20000,
      rating: 4.9,
      navigteto: 'add_screen',
      colors: Colors.green.shade500,
    ),
    Category(
      imagePath: 'assets/design_course/interFace3.png',
      title: 'Total Repair',
      lessonCount: 12,
      money: 25,
      total_expense: 20000,
      rating: 4.8,
      navigteto: 'add_screen',
      colors: Colors.indigo.shade200,
    ),
    Category(
      imagePath: 'assets/design_course/interFace4.png',
      title: 'PUC / Insurance',
      lessonCount: 28,
      money: 208,
      total_expense: 20000,
      rating: 4.9,
      navigteto: 'add_screen',
      colors: Colors.orange.shade700,
    ),
    Category(
      imagePath: 'assets/design_course/interFace4.png',
      title: 'Tyre Care',
      lessonCount: 28,
      money: 188,
      total_expense: 20000,
      rating: 4.9,
      navigteto: 'add_screen',
      colors: const Color(0xB3E3E2E2),
    ),
  ];
}
