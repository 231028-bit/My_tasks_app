import 'package:material_ui/material_ui.dart';

import 'task.dart';

class CompletedTasksPage extends StatelessWidget {
  final List<Task> comTasks;

  const CompletedTasksPage({super.key, required this.comTasks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Completed Tasks')),

      body: comTasks.isEmpty
          ? const Center(child: Text('No completed tasks'))
          : ListView.builder(
              itemCount: comTasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(comTasks[index].title),
                );
              },
            ),
    );
  }
}
