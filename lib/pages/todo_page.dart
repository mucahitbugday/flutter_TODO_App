// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:todo_app/data/todo_service.dart';
import 'package:todo_app/models/todo.dart';

// ignore: must_be_immutable
class TodoPage extends StatelessWidget {
  TodoService todoService = TodoService.instance;
  final titleController = TextEditingController();
  final descController = TextEditingController();

  TodoPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final titleField = TextFormField(
      controller: titleController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
    );
    final descriptionField = TextFormField(
      controller: descController,
      maxLines: 5,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
    );

    final saveButton = FlatButton(
      onPressed: () {
        todoService
            .addTodo(Todo(
                id: 0,
                title: titleController.text,
                description: descController.text,
                isDone: false))
            .then((value) => Navigator.pop(context));
      },
      child: const Text(
        "Save",
        style: TextStyle(color: Colors.white),
      ),
      color: Colors.blue,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("New To do"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: titleField,
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: descriptionField,
          ),
          saveButton,
        ],
      ),
    );
  }
}
