import 'package:flutter/material.dart';
import '../screens/category_menu.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final color;
  final String id;

  CategoryItem({this.id, this.title, this.color});

  void screenNaviagate(BuildContext ctx) {
    // This navigator class is responsible for adding and removing screens from the stack.
    // Navigator.of(ctx).pushNamed(
    // MaterialPageRoute(
    //   builder: (_) {
    //     return CategoryMenu(
    //       title: title,
    //       itemInfo: "$title is not available yet",
    //     );
    //   },
    // ),
    Navigator.of(ctx).pushNamed(CategoryMenu.routName,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => screenNaviagate(context),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
