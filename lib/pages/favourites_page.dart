
import 'package:flutter/material.dart';
import 'package:simple_todo/pages/home_page.dart';
import 'package:simple_todo/pages/pomodoro_page.dart';
import 'package:simple_todo/utils/todo_list.dart';

class FavouritesPage extends StatelessWidget {
  final List<List<dynamic>> toDoList;

  const FavouritesPage({super.key, required this.toDoList});

  @override
  Widget build(BuildContext context) {
    List<List<dynamic>> favouritesList = toDoList.where((task) => task[2]).toList();
      return Scaffold(
      backgroundColor: Colors.green.shade100,
      appBar: AppBar(
        title: const Text('Favourites'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.green),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite, color: Colors.green),
              title: Text('Favourites'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => FavouritesPage(toDoList: toDoList)),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.timer, color: Colors.green),
              title: const Text('Pomodoro'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => PomodoroPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: favouritesList.length,
        itemBuilder: (BuildContext context, index) {
          return TodoList(
            taskName: favouritesList[index][0],
            taskCompleted: favouritesList[index][1],
            isFavourite: favouritesList[index][2],
            onChanged: null,
            deleteFunction: null,
            favouriteFunction: () {}, // No need for favouriteFunction here
          );
        },
      ),
    );
  }
}
