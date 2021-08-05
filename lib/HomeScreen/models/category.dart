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
    this.dbname = '',
    this.colors = Colors.red,
    this.expicon = Icons.widgets_rounded,

  });

  String title;
  int lessonCount;
  int money;
  int total_expense;
  double rating;
  String imagePath;
  String navigteto;
  Color colors;
  String dbname;
  IconData expicon;

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
      expicon: Icons.local_gas_station_rounded
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
        expicon: Icons.car_repair_rounded,
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
        expicon: Icons.design_services_rounded
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
        expicon: Icons.event_note_rounded
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
        expicon: Icons.settings
    ),
  ];

  static List<Category> popularCourseList = <Category>[
    Category(
      imagePath: 'assets/design_course/interFace3.png',
      title: 'Total Fuel',
      dbname: 'Fuel',
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
      dbname: 'Service',
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
      dbname: 'Repair',
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
      dbname: 'puc Insurance',
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
      dbname: 'Tyre Care',
      lessonCount: 28,
      money: 188,
      total_expense: 20000,
      rating: 4.9,
      navigteto: 'add_screen',
      colors: const Color(0xB3E3E2E2),
    ),
  ];
}
