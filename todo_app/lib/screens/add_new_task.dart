import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constants/color.dart';
import 'package:todo_app/constants/tasktype.dart';
import 'package:todo_app/model/task.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key, required this.addNewTask});
  final void Function(Task newTask) addNewTask;

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  TaskType taskType = TaskType.note;

  @override
  Widget build(BuildContext context) {
    double deviceHeihgt = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      backgroundColor: HexColor(backgroundColor),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: deviceWidth,
                height: deviceHeihgt / 10,
                color: const Color.fromARGB(255, 106, 79, 225),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.close,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    const Expanded(
                        child: Text(
                      "Add New Task",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 21),
                      textAlign: TextAlign.center,
                    ))
                  ],
                )),
            const Padding(
                padding: EdgeInsets.only(top: 10), child: Text("Task Title")),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: titleController,
                decoration: const InputDecoration(
                    filled: true, fillColor: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("Category"),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          duration: Duration(milliseconds: 500),
                          content: Text("Category selected")));

                      setState(() {
                        taskType = TaskType.note;
                      });
                    },
                    child: Image.asset("assets/images/Category_1.png"),
                  ),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          duration: Duration(milliseconds: 500),
                          content: Text("Category selected")));

                      setState(() {
                        taskType = TaskType.calendar;
                      });
                    },
                    child: Image.asset("assets/images/Category_3.png"),
                  ),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          duration: Duration(milliseconds: 500),
                          content: Text("Category selected")));

                      setState(() {
                        taskType = TaskType.contest;
                      });
                    },
                    child: Image.asset("assets/images/Category_2.png"),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      const Text("Date"),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            controller: dateController,
                            decoration: const InputDecoration(
                                filled: true, fillColor: Colors.white),
                          ))
                    ],
                  )),
                  Expanded(
                      child: Column(
                    children: [
                      const Text("Time"),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                              controller: timeController,
                              decoration: const InputDecoration(
                                  filled: true, fillColor: Colors.white)))
                    ],
                  ))
                ],
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(top: 20), child: Text("Description")),
            SizedBox(
              height: 200,
              child: TextField(
                controller: descriptionController,
                expands: true,
                maxLines: null,
                decoration: const InputDecoration(
                    filled: true, fillColor: Colors.white),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Task newTask = Task(
                      type: taskType,
                      title: titleController.text,
                      description: descriptionController.text,
                      isCompleted: false);

                  widget.addNewTask(newTask);
                  Navigator.pop(context);
                },
                child: const Text("Save")),
          ],
        ),
      ),
    ));
  }
}
