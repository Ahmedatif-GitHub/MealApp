

import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import 'package:mealapplication/providers/meal_providers.dart';
import 'package:provider/provider.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {



  Widget buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(
        description,
      ),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, bool> currentFilters =
        Provider.of<MealProviders>(context, listen: true).filters;
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children:    [
                buildSwitchListTile(
                  'Gluten-free',
                  'Only include gluten-free meals.',
                  currentFilters['gluten'],
                  (newValue) {
                    setState(
                      () {
                        currentFilters['gluten'] = newValue;
                      },
                    );
                    Provider.of<MealProviders>(context, listen: false ).setFilters();
                  },
                ), buildSwitchListTile(
                  'Lactose-free',
                  'Only include lactose-free meals.',
                  currentFilters['lactose'],
                  (newValue) {
                    setState(
                      () {
                        currentFilters['lactose'] = newValue;
                      },
                    );
                    Provider.of<MealProviders>(context, listen: false).setFilters();
                  },
                ),
                buildSwitchListTile(
                  'Vegetarian',
                  'Only include vegetarian meals.',
                  currentFilters['Vegetarian'],
                  (newValue) {
                    setState(
                      () {
                        currentFilters['vegetarian'] = newValue;
                      },
                    );
                    Provider.of<MealProviders>(context, listen: false).setFilters();
                  },
                ),
                buildSwitchListTile(
                  'Vegan',
                  'Only include vegan  meals.',
                  currentFilters['vegan'],
                  (newValue) {
                    setState(
                      () {
                        currentFilters['vegan'] = newValue;
                      },
                    );
                    Provider.of<MealProviders>(context, listen: false).setFilters();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
