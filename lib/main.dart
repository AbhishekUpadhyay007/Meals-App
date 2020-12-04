import 'package:flutter/material.dart';
import './screens/meal_screen.dart';
import './screens/settings_screen.dart';
import './screens/meal_description.dart';
import './screens/category_menu.dart';
// import './screens/grid_view.dart';
import './screens/tabs_screens.dart';
import './dummy.dart';
import './models/dummy_dart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'vegan': false,
    'vegetarian': false,
    'lactose': false,
  };

  List<Meals> _availableMeals = DUMMY_MEALS;
  List<Meals> _favoriteMeals = [];

  void _addFavouriteMeal(String mealId) {
      final existingIndex = _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    
    
    
      if(existingIndex>=0){
          setState(() {
            _favoriteMeals.removeAt(existingIndex);
            print('removed');
          });
      }else{
        setState(() {
           _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => mealId == meal.id));
           print('added ${_favoriteMeals.toString()}');
        });
      }
     
  
  }

  bool _isContains(String mealID) {
  
      if(_favoriteMeals.any((meal) => meal.id ==mealID)){
        return true;
      }

      return false;
  
  }

  void _setFilters(Map<String, bool> updatedFilters) {
    // print(updatedFilters);
    setState(() {
      _filters = updatedFilters;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();

      // print(_availableMeals);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            headline6: TextStyle(
                fontSize: 22,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold)),
        // visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: CategoryScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(_favoriteMeals),
        CategoryMenu.routName: (ctx) => CategoryMenu(_availableMeals),
        MealDescription.routName: (ctx) =>
            MealDescription(_addFavouriteMeal, _isContains),
        MealScreen.routName: (ctx) => MealScreen(),
        SettingsScreen.routName: (ctx) => SettingsScreen(_setFilters, _filters)
      },
      // onGenerateRoute: (settings){
      //   print('$settings.arguments ongenerate');
      //   return MaterialPageRoute(builder: (ctx) => CategoryScreen());
      // },
      // onUnknownRoute: (settings){
      //   print('$settings onUnkonown');
      //   return MaterialPageRoute(builder: (ctx) => CategoryScreen());
      // },
    );
  }
}
