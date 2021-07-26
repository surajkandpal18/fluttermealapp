import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/maindrawer.dart';
import '../screens/categories_screen.dart';
import '../screens/favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  TabsScreen(this.favoriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  @override
  void initState() {
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoritesScreen(widget.favoriteMeals),
        'title': 'Favorites',
      }
    ];
    super.initState();
  }

  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return DefaultTabController(
    //   length: 2,
    //   child: Scaffold(
    //       appBar: AppBar(
    //         title: Text('Meals'),
    //         bottom: TabBar(
    //           tabs: <Widget>[
    //             Tab(
    //               icon: Icon(Icons.category),
    //               text: 'Categories',
    //             ),
    //             Tab(
    //               icon: Icon(Icons.star),
    //               text: 'Favorites',
    //             ),
    //           ],
    //         ),
    //       ),
    //       body: TabBarView(
    //         children: <Widget>[
    //           CategoriesScreen(),
    //           FavoritesScreen(),
    //         ],
    //       )),
    // );

    return Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedPageIndex]['title']),
        ),
        drawer: MainDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          currentIndex: _selectedPageIndex,
          selectedItemColor: Theme.of(context).accentColor,
          onTap: _selectPage,

          // type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              //  backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              label: "Categories",
            ),
            BottomNavigationBarItem(
              //  backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              label: "Favorites",
            ),
          ],
        ),
        body: _pages[_selectedPageIndex]['page']);
  }
}
