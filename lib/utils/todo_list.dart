import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.isFavourite,
    required this.onChanged,
    required this.deleteFunction,
    required this.favouriteFunction,
  });

  final String taskName;
  final bool taskCompleted;
  final bool isFavourite;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;
  final VoidCallback favouriteFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: 0,
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Checkbox(
              value: taskCompleted,
              onChanged: onChanged,
              checkColor: Colors.black,
              activeColor: Colors.white,
              side: const BorderSide(
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Text(
                taskName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationColor: Colors.white,
                  decorationThickness: 2,
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.favorite,
                color: isFavourite ? Colors.pink : Colors.white,
              ),
              onPressed: favouriteFunction,
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.white),
              onPressed: () => deleteFunction?.call(context),
            ),
          ],
        ),
      ),
    );
  }
}
