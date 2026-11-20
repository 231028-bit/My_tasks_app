import 'package:material_ui/material_ui.dart';

import 'task.dart';
import 'task_item.dart';
import 'CompletedTask_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: TaskListPage());
  }
}

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  List<Task> tasks = [
    Task(title: 'My Task'),
    Task(title: 'my homework'),
    Task(title: 'my assignment'),
    Task(title: 'my project'),
  ];
  @override
  Widget build(BuildContext context) {
    int completedCount = 0;
    for (var task in tasks) {
      if (task.isCompleted) {
        completedCount++;
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('My Tasks')),
      body: Column(
        children: [
          Text('Completed: $completedCount / ${tasks.length}'),
          ElevatedButton(
            onPressed: () {
              List<Task> comTasks = [];
              for (var task in tasks) {
                if (task.isCompleted) {
                  comTasks.add(task);
                }
              }
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CompletedTasksPage(comTasks: comTasks),
                ),
              );
            },
            child: const Text('View Completed Tasks'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return TaskItem(
                  task: tasks[index],

                  onChanged: (value) {
                    setState(() {
                      tasks[index].isCompleted = value;
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
