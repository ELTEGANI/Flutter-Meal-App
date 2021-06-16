import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meals.dart';
import './screens/filter_screen.dart';
import './screens/meal_screen_detail.dart';
import './screens/tabs_Screen.dart';
import './screens/categories_screen.dart';
import './screens/category_meal_screen.dart';
import '../models/meals.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 Map<String,bool> _filters = {
   'gluten':false,
   'lactose':false,
   'vegan':false,
   'vegetarian':false
 };

 List <Meal> _availableMeals = DUMMY_MEALS;

 void _setFilters(Map<String,bool>filterData){
    setState(() {
       _filters        = filterData;
       _availableMeals = DUMMY_MEALS.where((meal){
         if(_filters['gluten'] != null && !meal.isGlutenFree){
             return false;
         }
         if(_filters['lactose'] != null && !meal.isLactoseFree){
           return false;
         }
         if(_filters['vegan'] != null && !meal.isVegan){
           return false;
         }
         if(_filters['vegetarian'] != null && !meal.isVegetaria){
           return false;
         }
         return true;
       }).toList();
     }
    );
 }

 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     title: 'DeliMeals',
     theme: ThemeData(
       primarySwatch: Colors.pink,
       accentColor: Colors.amber,
       canvasColor: Color.fromRGBO(255,254,229,1),
       fontFamily: 'Raleway',
       textTheme: ThemeData.light().textTheme.copyWith(
           bodyText1: TextStyle(color:Color.fromRGBO(20, 51, 51, 1)),
           bodyText2: TextStyle(color:Color.fromRGBO(20, 51, 51, 1)),
           headline6:TextStyle(
               fontSize: 24,
               fontFamily: 'RobotoCondensed',
               fontWeight: FontWeight.bold
           )
       ),
     ),
     initialRoute: '/', //as default
     routes: {
       '/':(ctx) => TabsScreen(),
       CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(_availableMeals),
       MealScreenDetail.routeName:(ctx) => MealScreenDetail(),
       FilterScreen.routeName:(ctx) => FilterScreen(_filters,_setFilters),
     },
     onGenerateRoute:(settings){
       print(settings.arguments);
       return MaterialPageRoute(builder: (ctx)=> CategoriesScreen());
     },
     //onUnknownRoute: ,
     // onUnknownRoute: ,
   );
 }

}

