import 'package:flutter/foundation.dart';

enum Complexity{
  Simple,
  Challenging,
  Hard
}

enum Affordability{
  Affordable, 
  Pricey,
  Luxurious
}

class Meals {
  final String id;
  final List<String> categories;
  final List<String> ingredients;
  final String title;
  final String imageUrl;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

 const Meals({
    @required this.id,
    @required this.categories,
    @required this.ingredients,
    @required this.title,
    @required this.imageUrl,
    @required this.steps,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.isGlutenFree,
    @required this.isLactoseFree,
    @required this.isVegan,
    @required this.isVegetarian,
  });
}
