import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const String routeName = "FilterScreen";
  final Function selectedFilters;
  final Map<String, bool>actuellFilters;

  FilterScreen(this.actuellFilters,this.selectedFilters);


  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {


  bool _GlutenFree = false;
  bool _LactoseFree = false;
  bool _Vegan = false;
  bool _Vegetarian = false;

  Map<String, bool> filters;

  @override
  initState(){
    _GlutenFree = widget.actuellFilters["gluten"];
    _LactoseFree = widget.actuellFilters["lactose"];
    _Vegan = widget.actuellFilters["vegan"];
    _Vegetarian = widget.actuellFilters["vegetarian"];

    super.initState();
  }


  Widget buildSwitch(String title, bool value, Function updateValue) {
    return SwitchListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.subtitle1,
      ),
      value: value,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Your filters",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          actions: [
            IconButton(
                icon: const Icon(Icons.check),
                onPressed: (){setState(() {
                  filters = {
                    "gluten" : _GlutenFree,
                    "lactose" :_LactoseFree,
                    "vegan"  :_Vegan,
                    "vegetarian":_Vegetarian,
                  };
                  widget.selectedFilters(filters);
                });})
          ],
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Adjust your meal selection",
                  style: Theme.of(context).textTheme.subtitle1,
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    buildSwitch(
                      "GlutenFree",
                      _GlutenFree,
                      (newvalue) {
                        setState(() {
                          _GlutenFree = newvalue;
                        });
                      },
                    ),
                    buildSwitch(
                      "LactoseFree",
                      _LactoseFree,
                      (newvalue) {
                        setState(() {
                          _LactoseFree = newvalue;
                        });
                      },
                    ),
                    buildSwitch(
                      "Vegan",
                      _Vegan,
                      (newvalue) {
                        setState(() {
                          _Vegan = newvalue;
                        });
                      },
                    ),
                    buildSwitch(
                      "Vegetarian",
                      _Vegetarian,
                      (newvalue) {
                        setState(() {
                          _Vegetarian = newvalue;
                        });
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
