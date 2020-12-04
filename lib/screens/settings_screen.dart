import 'package:flutter/material.dart';
import '../widgets/navigation_drawer.dart';

class SettingsScreen extends StatefulWidget {
  static const routName = './SettingsScreen';

  final Function updateFilters;
  final Map<String, bool> newFilters;

  SettingsScreen(this.updateFilters, this.newFilters);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var isGlutenFree;
  var isVegan;
  var isVegetarian;
  var isLactoseFree;

  Widget _buildSwitchTile(
      {String title, String subtitle, bool currentVal, Function update}) {
    return SwitchListTile(
        title: Text(
          title,
          style: TextStyle(fontSize: 20),
        ),
        subtitle: Text(subtitle),
        value: currentVal,
        onChanged: update);
  }

  @override
  void initState() {
    super.initState();
    isGlutenFree = widget.newFilters['gluten'];
    isVegan = widget.newFilters['vegan'];
    isVegetarian = widget.newFilters['vegetarian'];
    isLactoseFree = widget.newFilters['lactose'];
  }

  void updateMap(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Filters')),
      drawer: NavgitaionDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'Add your filter to get refreshing meals.',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          _buildSwitchTile(
              title: 'Gluten-free',
              subtitle: 'Add/Remove gluten free diet.',
              currentVal: isGlutenFree,
              update: (newval) {
                setState(() {
                  isGlutenFree = newval;
                  widget.newFilters['gluten'] = newval;

                  print(widget.newFilters);
                  widget.updateFilters(widget.newFilters);
                });
              }),
          _buildSwitchTile(
              title: 'Vegan',
              subtitle: 'Add/Remove Vegan diet.',
              currentVal: isVegan,
              update: (newval) {
                setState(() {
                  isVegan = newval;
                  widget.newFilters['vegan'] = newval;
                  widget.updateFilters(widget.newFilters);
                  print(widget.newFilters);
                });
              }),
          _buildSwitchTile(
              title: 'Vegetarian',
              subtitle: 'Add/Remove Vegetarian diet.',
              currentVal: isVegetarian,
              update: (newval) {
                setState(() {
                  isVegetarian = newval;
                  widget.newFilters['vegetarian'] = newval;
                  widget.updateFilters(widget.newFilters);
                  print(widget.newFilters);
                });
              }),
          _buildSwitchTile(
              title: 'Lactose-free',
              subtitle: 'Add/Remove lactose free diet.',
              currentVal: isLactoseFree,
              update: (newval) {
                setState(() {
                  isLactoseFree = newval;
                  widget.newFilters['lactose'] = newval;
                  widget.updateFilters(widget.newFilters);
                  print(widget.newFilters);
                });
              }),
        ],
      ),
    );
  }
}
