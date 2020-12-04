import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../dummy.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      // appBar: AppBar(title: Text('Aumeals') ),
      body: GridView(
        padding: EdgeInsets.all(20),
        children: DUMMY_CATEGORIES.map((category) =>
          CategoryItem(
            id: category.id,
            color: category.color,
            title: category.title,
          )
        ).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            crossAxisSpacing: 20,
            childAspectRatio: 3 / 2,
            mainAxisSpacing: 20))
      );
  }
}
