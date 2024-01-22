import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/models/Taskmodel.dart';
import 'package:todo/widget/mydrawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Task> tasksList = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<void> saveData() async {
    List<Map<String, dynamic>> tasksAsJson = [];
    List<String> tasksAsString = [];

    for (var element in tasksList) {
      tasksAsJson.add(element.toJosn());
    }

    for (var element in tasksAsJson) {
      tasksAsString.add(jsonEncode(element));
    }
    final prefs = await SharedPreferences.getInstance();
    bool res = await prefs.setStringList("tasks", tasksAsString);
    print("save data======== $res ");
  }

  Future<void> getData() async {
    List<String> tasksAsString = [];
    List<Map<String, dynamic>> tasksAsJson = [];

    tasksList.clear();
    final prefs = await SharedPreferences.getInstance();

    tasksAsString = prefs.getStringList("tasks") ?? [];

    for (var element in tasksAsString) {
      tasksAsJson.add(jsonDecode(element));
    }

    setState(() {
      for (var element in tasksAsJson) {
        tasksList.add(Task.fromJson(element));
      }
    });

    print(tasksList[0].title);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController additem = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                tooltip: 'Logout ',
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: Color.fromARGB(255, 139, 182, 202),
                          title: Text(
                            "Are you sure?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          actions: [
                            Padding(
                              padding: const EdgeInsets.only(right: 50),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pop(context, true);
                                },
                                child: Text(
                                  "Yes",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pop(context, false);
                                },
                                child: Text(
                                  "No",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        );
                      });
                },
                icon: Icon(
                  Icons.logout,
                  color: Colors.white,
                ))
          ],
          backgroundColor: Color.fromARGB(255, 139, 182, 202),
          title: Text(
            "All ToDos",
            style: TextStyle(color: Colors.white, fontFamily: "Gameplay"),
          ),
          centerTitle: true,
        ),
        drawer: MyDrawer(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 139, 182, 202),
          hoverColor: Colors.white,
          splashColor: const Color.fromARGB(255, 224, 160, 181),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                      backgroundColor: Color.fromARGB(255, 139, 182, 202),
                      title: Text(
                        "Write your plans?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      content: TextField(
                        controller: _todoController,
                        maxLength: 50,
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                      ),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.only(right: 50),
                          child: TextButton(
                            onPressed: () {
                              _addToDoItem(_todoController.text);
                              Navigator.pop(context, false);
                            },
                            child: Text(
                              "Add",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pop(context, false);
                            },
                            child: Text(
                              "cancel",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ),
                      ]);
                });
          },
          tooltip: 'Add item ',
          child: Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "My Tasks ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: tasksList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        tasksList[index].title,
                        style: TextStyle(
                          decoration: tasksList[index].isDone
                              ? TextDecoration.lineThrough
                              : null,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          _deleteToDoItem(tasksList[index].id);
                        },
                        icon: Icon(
                          Icons.restore_from_trash_sharp,
                          color: Colors.red,
                        ),
                      ),
                      leading: Checkbox(
                        fillColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 231, 239, 243)),
                        checkColor: Color.fromARGB(255, 139, 182, 202),
                        value: tasksList[index].isDone,
                        onChanged: (value) {
                          _handleToDoChange(tasksList[index]);
                        },
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }

  void _addToDoItem(String toDo) {
    setState(() {
      var newTask = Task(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: toDo,
      );
      tasksList.add(newTask);
      saveData();
    });
    _todoController.clear();
  }

  void _deleteToDoItem(String id) {
    setState(() {
      tasksList.removeWhere((item) => item.id == id);
    });
    saveData();
  }

  void _handleToDoChange(Task todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
    saveData();
  }
}
