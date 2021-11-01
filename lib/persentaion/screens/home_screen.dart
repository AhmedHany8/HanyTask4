// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todoly/data/models/task.dart';
import 'package:todoly/logic/helpers/db_helper.dart';
import 'package:todoly/persentaion/screens/all_tasks_screen.dart';
import 'package:todoly/persentaion/screens/done_screen.dart';
import 'package:todoly/persentaion/screens/to_do_screen.dart';
import 'package:todoly/persentaion/themes/my_custom_colors.dart';
import '../../data/models/data.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Database? db;
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    AllTasks(),
    ToDoScreen(),
    DoneScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    intializeDB();
    super.initState();
  }

  Future<void> intializeDB() async {
    db = await DBHelper.database();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        
        appBar: AppBar(
          elevation: 0,
          title: Text("ToDo App"),
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          selectedIconTheme: IconThemeData(color: Palette.myDarkColor),
          selectedItemColor: Palette.myDarkColor,
          unselectedIconTheme: IconThemeData(color: Palette.myDarkAccent),
          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor: Colors.blue[500],
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.red[400],
              icon: Icon(Icons.list_alt_rounded),
              label: 'Todo',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.green,
              icon: Icon(Icons.done_rounded),
              label: 'Done',
            ),
          ],
          currentIndex: _selectedIndex,
          
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
