import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/dummy_dart.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meals> favouritMeals;
  FavouriteScreen(this.favouritMeals) {
    print(favouritMeals);
  }

  @override
  Widget build(BuildContext context) {
    return (favouritMeals.length == 0)
        ? Center(child: Text('You Don\'t have any meals-yet'))
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return MealItem(
                id: favouritMeals[index].id,
                title: favouritMeals[index].title,
                imageUrl: favouritMeals[index].imageUrl,
                duration: favouritMeals[index].duration,
                affordability: favouritMeals[index].affordability,
                complexity: favouritMeals[index].complexity,
              );
            },
            itemCount: favouritMeals.length,
          );
  }
}
