import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constants/color.dart';
import 'package:todo_app/constants/tasktype.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/screens/add_new_task.dart';
import 'package:todo_app/todoitem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<HomeScreen> {
  // List<String> todo = ["Study lesson", "Run 5K", "Go to Party"];
  // List<String> completed = ["Game Meetup", "Take Out Trash"];

  List<Task> todo = [
    Task(
        type: TaskType.note,
        title: "Study Lesson",
        description: "Study COMP117",
        isCompleted: false),
    Task(
        type: TaskType.contest,
        title: "Run 5K",
        description: "Run 5 kilometers",
        isCompleted: false),
    Task(
        type: TaskType.calendar,
        title: "Go to Party",
        description: "Attend to party",
        isCompleted: false)
  ];

  List<Task> completed = [
    Task(
        type: TaskType.contest,
        title: "Run 5K",
        description: "Run 5 kilometers",
        isCompleted: false),
    Task(
        type: TaskType.calendar,
        title: "Go to Party",
        description: "Attend to party",
        isCompleted: false)
  ];

  void addNewTask(Task newTask) {
    setState(() {
      todo.add(newTask);
    });
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeihgt = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: HexColor(backgroundColor),
          body: Column(
            children: [
              Container(
                width: deviceWidth,
                height: deviceHeihgt / 4,
                color: const Color.fromARGB(255, 106, 79, 225),
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text("17 Temmuz 2024",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Text(
                        "My Todo List",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              // top column
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: todo.length,
                      itemBuilder: (context, index) {
                        return todoItem(
                          task: todo[index],
                        );
                      },
                    ),
                  ),
                ),
              ),
              // completed text
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Completed",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
              // bottom column
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SingleChildScrollView(
                      child: ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemCount: completed.length,
                          itemBuilder: (context, index) {
                            return todoItem(task: completed[index]);
                          })),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => AddNewTaskScreen(
                              addNewTask: (newTask) => addNewTask(newTask),
                            )),
                  );
                },
                child: const Text("Add New Task"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
