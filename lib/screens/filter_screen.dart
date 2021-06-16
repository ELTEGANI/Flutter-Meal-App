import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String,bool> currentFilters;
  FilterScreen(this.currentFilters,this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();

}

class _FilterScreenState extends State<FilterScreen> {

   var _glutenFree = false;
   var _vegetrain = false;
   var _vegan = false;
   var _lactos = false;

   @override
   initState(){
     _glutenFree    = widget.currentFilters['gluten'] != null;
     _lactos        = widget.currentFilters['lactose'] != null;
     _vegan         = widget.currentFilters['vegan']  != null;
     _vegetrain     = widget.currentFilters['vegetarian'] !=null;
     super.initState();
   }

   Widget _buildSwitchListTile(String title,String descripton,bool currentValue,dynamic updateValue){
     return    SwitchListTile(
       title:Text(title),
       value: currentValue,
       subtitle: Text(descripton),
       onChanged:updateValue);
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(onPressed:() {
            final selectedFilters = {
              'gluten':_glutenFree,
              'lactose':_lactos,
              'vegan':_vegan,
              'vegetarian':_vegetrain
            };
            widget.saveFilters(selectedFilters);
          }, icon:Icon(Icons.save)
            ,)
        ],),
        drawer: MainDrawer(),
        body:Column(children: <Widget>[
          Container(padding: EdgeInsets.all(20),child: Text('Adjust Your meal Selection'
          ,style: Theme.of(context).textTheme.title,

          ),
          ),
          Expanded(child: ListView(
            children: <Widget>[
              _buildSwitchListTile('Gluten-Free', 'Only Include Gluten free meals', _glutenFree,
                  (newValue){
                   setState(() {
                     _glutenFree = newValue;
                   }
                   );
                  }
               ),
              _buildSwitchListTile('Lactose-Free', 'Only Include Lactose free meals', _lactos,
                      (newValue){
                    setState(() {
                      _lactos = newValue;
                    }
                    );
                  }
              ),
              _buildSwitchListTile('Vegetarian', 'Only Include Vegetarian free meals', _vegetrain,
                      (newValue){
                    setState(() {
                      _vegetrain = newValue;
                    }
                    );
                  }
              ),
              _buildSwitchListTile('Vegan', 'Only Include Vegan free meals', _vegan,
                      (newValue){
                    setState(() {
                      _vegan = newValue;
                    }
                    );
                  }
              )
          ],
          ),
          )
        ],
        )
    );
  }

}