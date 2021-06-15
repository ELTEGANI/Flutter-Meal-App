import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:meal_app/screens/meal_screen_detail.dart';
import 'package:meal_app/screens/tabs_Screen.dart';
import './screens/categories_screen.dart';
import './screens/category_meal_screen.dart';
import './screens/meal_screen_detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealScreenDetail.routeName:(ctx) => MealScreenDetail()
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

