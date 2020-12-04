import 'package:flutter/material.dart';
import 'package:navigation/dummy.dart';

class MealDescription extends StatelessWidget {
  static const routName = '/MealDescription';

  final Function addFavouriteMeal;
  final Function isContains;

  MealDescription(this.addFavouriteMeal, this.isContains);

  Widget buildContainerTitle(BuildContext context, String title) {
    return Container(
      child: Text(
        '$title',
        style: Theme.of(context).textTheme.headline6,
      ),
      margin: EdgeInsets.symmetric(vertical: 10),
    );
  }

  Widget buildSectionContainer(Widget child, dynamic mediaQuery) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: mediaQuery.width * 0.8,
      height: mediaQuery.height * 0.2,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15)),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(title: Text('$mealId')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: mediaQuery.height * 0.3,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildContainerTitle(context, 'Ingredients'),
            buildSectionContainer(
                ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Card(
                      child: Text(
                        '${selectedMeal.ingredients[index]}',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      color: Colors.black54,
                    );
                  },
                  itemCount: selectedMeal.ingredients.length,
                ),
                mediaQuery),
            buildContainerTitle(context, '#Steps'),
            buildSectionContainer(
                ListView.builder(
                  itemBuilder: (ctx, index) {
                    return ListTile(
                      leading: CircleAvatar(child: Text('#${index + 1}')),
                      title: Text(selectedMeal.steps[index]),
                    );
                  },
                  itemCount: selectedMeal.steps.length,
                ),
                mediaQuery)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: isContains(mealId)
            ? Icon(
                Icons.star,
                color: Colors.red,
              )
            : Icon(
                Icons.star_border,
                color: Colors.red,
              ),
        onPressed: () {
          addFavouriteMeal(mealId);
        },
      ),
    );
  }
}
