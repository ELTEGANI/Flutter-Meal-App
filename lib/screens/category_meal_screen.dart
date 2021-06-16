import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';
import 'package:meal_app/models/meals.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  @override
  _CategoryMealsScreen createState() => _CategoryMealsScreen();
}

class _CategoryMealsScreen extends State<CategoryMealsScreen>{
  late String? categoryTitle;
  late List<Meal> displayMeals;
  var _loadedInitData = false;
  @override
  void initState() {
    super.initState();
  }

  void _removeMeal(String mealId){
     setState(() {
         displayMeals.removeWhere((meal) => meal.id == mealId);
     });
  }

  @override
  void didChangeDependencies() {
    if(!_loadedInitData){
      final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String,String>;
      final categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'];
      displayMeals = DUMMY_MEALS.where((meal){
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(categoryTitle!)),
        body:ListView.builder(itemBuilder: (ctx,index){
          return MealItem(
            id:displayMeals[index].id,
            title:displayMeals[index].title,
            imageUrl:displayMeals[index].imageUrl,
            duration: displayMeals[index].duration,
            complexity: displayMeals[index].complexity,
            affordability: displayMeals[index].affordability,
            removeItem:_removeMeal,
          );
        },itemCount:displayMeals.length,)
    );
  }

}


