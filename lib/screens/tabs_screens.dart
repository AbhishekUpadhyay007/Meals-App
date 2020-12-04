import 'package:flutter/material.dart';
import './favourite_screen.dart';
import './grid_view.dart';
import '../widgets/navigation_drawer.dart';
import '../models/dummy_dart.dart';

class TabsScreen extends StatefulWidget {

  final List<Meals> favoriteMeals;
  TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _selectedScreen ;

  int screenIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedScreen = [
    {
      'page': CategoryScreen(),
      'title': 'CategoryScreen',
    },
    {
      'page': FavouriteScreen(widget.favoriteMeals),
      'title': 'FavouriteScreen',
    }
  ];
  }

  void _setSelectedScreen(int index) {
    setState(() {
      screenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedScreen[screenIndex]['title']),
      ),
      drawer: NavgitaionDrawer(),
      body: _selectedScreen[screenIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _setSelectedScreen,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: screenIndex,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        // type: BottomNavigationBarType.shifting,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }
}

// isScrollable: true,
// indicatorColor: Theme.of(context).primaryColor,
// tabs: [
//   Container(
//     width: 80,
//     padding: EdgeInsets.symmetric(vertical: 10),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Icon(Icons.category),
//         SizedBox(width: 10),
//         Text('Tab 1'),
//       ],
//     ),
//   ),
//   Container(
//      width: 80,
//     padding: EdgeInsets.symmetric(vertical:10),
//     child: Row(
//        mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Icon(Icons.star),
//         SizedBox(width: 10),
//         Text('Tab 2'),
//       ],
//     ),
//   )
// ],
