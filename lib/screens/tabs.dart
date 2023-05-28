import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categories.dart';
import 'package:meal_app/screens/filters.dart';
import 'package:meal_app/screens/meals.dart';
import 'package:meal_app/widgets/main_drawer.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.Vegetarian: false,
  Filter.vegan: false,
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    // TODO: implement createState
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectdPage = 0;
  final List<Meal> _favoriteMeals = [];
  Map<Filter, bool> _selectedFilters = kInitialFilters;

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _toggleMealFavouriteStatus(Meal meal) {
    final isExisting = _favoriteMeals.contains(meal);

    if (isExisting) {
      // setState(() {
      _favoriteMeals.remove(meal);
      // });

      // _showInfoMessage("meal is no longer a fav meal");
    } else {
      // setState(() {
      _favoriteMeals.add(meal);
      // });

      // _showInfoMessage("meal add to fav list");
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectdPage = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(builder: (context) => const FilterScreen()),
      );
      setState(() {
        _selectedFilters = result ?? kInitialFilters;
      });
    }

    @override
    Widget build(BuildContext context) {
      Widget activePage = CatogriesScreen(
        onToggleFavorite: _toggleMealFavouriteStatus,
      );
      var activePageTitle = "Categories";

      if (_selectdPage == 1) {
        activePage = MealsScreen(
          meals: _favoriteMeals,
          onToggleFavorite: _toggleMealFavouriteStatus,
        );
        activePageTitle = "Your Favourites";
      }
      // TODO: implement build
      return Scaffold(
        appBar: AppBar(
          title: Text(activePageTitle),
        ),
        drawer: MainDrawer(
          onselectScreen: _setScreen,
        ),
        body: activePage,
        bottomNavigationBar: BottomNavigationBar(
            onTap: _selectPage,
            currentIndex: _selectdPage,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.set_meal), label: 'Categories'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.star_purple500_outlined),
                  label: 'Favourites'),
            ]),
      );
    }
  }
}
