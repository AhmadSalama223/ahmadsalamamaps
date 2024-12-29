import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mapsapp/EditTaskPage.dart';
import 'package:mapsapp/Widgets/todo_items.dart';
import 'package:mapsapp/addpage.dart';
import 'package:mapsapp/model/todo.dart';

class HomeScreen extends StatefulWidget {
  final List<ToDo> todosList;
  HomeScreen({required this.todosList});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // دالة لإضافة مهمة جديدة
  void _addTask(ToDo task) {
    setState(() {
      widget.todosList.add(task);
    });
  }

  // دالة لتحديث المهمة
  void _updateTask(ToDo updatedTask) {
    setState(() {
      int index =
          widget.todosList.indexWhere((task) => task.id == updatedTask.id);
      if (index != -1) {
        widget.todosList[index] = updatedTask;
      }
    });
  }

  // دالة لتغيير حالة المهمة
  void _toggleTaskStatus(String taskId) {
    setState(() {
      int index = widget.todosList.indexWhere((task) => task.id == taskId);
      if (index != -1) {
        widget.todosList[index].isDone = !widget.todosList[index].isDone;
      }
    });
  }

  // دالة لحذف المهمة
  void _deleteTask(String taskId) {
    setState(() {
      widget.todosList.removeWhere((task) => task.id == taskId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 128,
        backgroundColor: Color(0xFF35AB86),
        title: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ahmad Salama',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'ahmadsalamasalama2@gmail.com',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/images/profile_image.jpg"),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Color(0xFFACEB5F),
                border: Border.all(width: 2, color: Color(0xff9EB031))),
            height: 120,
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/Group 27.png"),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ' Go Pro (No Ads)', // النص الأول
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            ' No fuss, no ads, for only 5 TL a year', // النص الثاني
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // أيقونة كأس على اليسار

                  // الكونتينر في الجهة اليمنى في الأعلى
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 70, // عرض الكونتينر
                        height: 70, // ارتفاع الكونتينر
                        color: Color(0xFF35AB86),
                        child: Center(
                            child: Text(
                          "TL5",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        )), // تحديد اللون
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // قائمة المهام
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView(
              children: [
                for (ToDo todoo in widget.todosList)
                  TodoItems(
                    todo: todoo,
                    onEdit: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditTaskPage(
                            task: todoo,
                            onTaskUpdated: _updateTask,
                          ),
                        ),
                      );
                    },
                    onDelete: () {
                      _deleteTask(todoo.id);
                    },
                    onToggle: () {
                      _toggleTaskStatus(todoo.id);
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTaskPage(onTaskAdded: _addTask),
            ),
          );
        },
        child: Icon(
          Icons.add, // أيقونة زائد
          size: 30,
          color: Colors.white, // حجم الأيقونة
        ),
        backgroundColor: Color(0xFF35AB86), // لون الزر
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50), // جعل الزر دائري
        ),
      ),
    );
  }
}
