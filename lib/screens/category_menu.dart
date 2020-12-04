import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/dummy_dart.dart';

class CategoryMenu extends StatefulWidget {
  static const routName = '/category-meal-screen';

  final List<Meals> availableMeals;
  
  CategoryMenu(this.availableMeals);

  @override
  _CategoryMenuState createState() => _CategoryMenuState();
}

class _CategoryMenuState extends State<CategoryMenu> {
  String categoryTitle;
  List<Meals> displayedMeals;
  bool isDataSet = false;

  // void _removeItem(mealId) {
  //   setState(() {
  //     displayedMeals.removeWhere((meal) => meal.id == mealId);
  //   });
  // }

  @override
  void didChangeDependencies() {
    if (!isDataSet) {
      final routesData =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routesData['title'];
      final id = routesData['id'];

      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(id);
      }).toList();
      isDataSet = true;
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print(categoryTitle);

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: displayedMeals[index].id,
              title: displayedMeals[index].title,
              imageUrl: displayedMeals[index].imageUrl,
              duration: displayedMeals[index].duration,
              affordability: displayedMeals[index].affordability,
              complexity: displayedMeals[index].complexity,
              // deleteMealItem: _removeItem,
            );
          },
          itemCount: displayedMeals.length,
        ));
  }
}
