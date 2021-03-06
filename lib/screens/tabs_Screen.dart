import 'package:flutter/material.dart';
import './favorites_screen.dart';
import './categories_screen.dart';
import 'dart:core';
import '../widgets/main_drawer.dart';
import '../models/meals.dart';

class TabsScreen extends StatefulWidget{
  final List<Meal> favorites;
  TabsScreen(this.favorites);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen>{
  late List<Map<String,dynamic>> _pages ;
  int _selectedPageIndex = 0;
  @override
  void initState(){
    _pages =[
      {
        'page':CategoriesScreen(),
        'title':'Categories',
      }
      ,
      {
        'page':FavoritesScreen(widget.favorites),
        'title':'Favorites',
      }
    ];
    super.initState();
  }
  void _selectPage(int index){
     setState(() {
         _selectedPageIndex = index;
     });
  }
  @override
  Widget build(BuildContext buildContext){
    return Scaffold(
      appBar: AppBar(
      title:Text(_pages[_selectedPageIndex]['title'])),
      drawer: MainDrawer(),
      body:_pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon:Icon(Icons.category),title: Text('Categories')),
          BottomNavigationBarItem(backgroundColor: Theme.of(context).primaryColor,
            icon:Icon(Icons.star),title: Text('Favorites'),)
        ],
      ),
    );
  }
}