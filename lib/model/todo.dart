class ToDo {
  String id;
  String todoText;
  bool isDone;
  String description; // إضافة حقل الوصف

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
    required this.description, // إضافة الوصف كـ required parameter
  });

  // قائمة المهام
  static List<ToDo> todoList() {
    return [
      ToDo(
        id: '1',
        todoText: 'Buy Groceries',
        isDone: false,
        description: 'Buy milk, eggs, and bread', // إضافة وصف
      ),
      ToDo(
        id: '2',
        todoText: 'Exercise',
        isDone: true,
        description: 'Morning workout session', // إضافة وصف
      ),
    ];
  }
}
