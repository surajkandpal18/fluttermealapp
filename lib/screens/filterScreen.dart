import 'package:flutter/material.dart';
import '../widgets/maindrawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/settings';
  final Function saveFilters;
  final Map<String, bool> filterData;

  FilterScreen(this.saveFilters, this.filterData);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.filterData['gluten'];
    _vegetarian = widget.filterData['vegetarian'];
    _vegan = widget.filterData['vegan'];
    _lactoseFree = widget.filterData['lactose'];
    super.initState();
  }

  Widget _buildSwitchTile(
      String title, String subtitle, bool currentValue, Function doSomething) {
    return SwitchListTile(
      value: currentValue,
      title: Text(title),
      subtitle: Text(subtitle),
      onChanged: doSomething,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegetarian': _vegetarian,
                'vegan': _vegan,
              };
              widget.saveFilters(selectedFilters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection.",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchTile(
                'Gluten-Free',
                "Only include Gluten-free meals",
                _glutenFree,
                (newVal) {
                  setState(() {
                    _glutenFree = newVal;
                  });
                },
              ),
              _buildSwitchTile(
                'Lactose-free',
                "Only include Lactose-free meals",
                _lactoseFree,
                (newVal) {
                  setState(() {
                    _lactoseFree = newVal;
                  });
                },
              ),
              _buildSwitchTile(
                'Vegetarian',
                "Only include Vegetarian meals",
                _vegetarian,
                (newVal) {
                  setState(() {
                    _vegetarian = newVal;
                  });
                },
              ),
              _buildSwitchTile(
                'Vegan',
                "Only include Vegan meals",
                _vegan,
                (newVal) {
                  setState(() {
                    _vegan = newVal;
                  });
                },
              )
            ],
          )),
        ],
      ),
    );
  }
}
