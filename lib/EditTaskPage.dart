import 'package:flutter/material.dart';
import 'package:mapsapp/model/todo.dart';

class EditTaskPage extends StatefulWidget {
  final ToDo task;
  final Function(ToDo) onTaskUpdated;

  EditTaskPage({required this.task, required this.onTaskUpdated});

  @override
  _EditTaskPageState createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  bool _isDone = false;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.task.todoText);
    _descriptionController =
        TextEditingController(text: widget.task.description);
    _isDone = widget.task.isDone;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Edit Task'),
            SizedBox(
              width: 15,
            ),
            Text(
              widget.task.todoText,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        centerTitle: true, 
        backgroundColor: Colors.green,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Task Name',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),

                Text(
                  'Description',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 4,
                ),
              ],
            ),
          ),
          Spacer(),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () {
                if (_titleController.text.isNotEmpty &&
                    _descriptionController.text.isNotEmpty) {
                  ToDo updatedTask = ToDo(
                    id: widget.task.id,
                    todoText: _titleController.text,
                    description: _descriptionController.text,
                    isDone: _isDone,
                  );

                  widget.onTaskUpdated(updatedTask);
                  Navigator.pop(context);
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.green,
              ),
              child: Text('Save Task'),
            ),
          ),
        ],
      ),
    );
  }
}
