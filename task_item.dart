import 'package:material_ui/material_ui.dart';

import 'task.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final Function(bool) onChanged;

  const TaskItem({super.key, required this.task, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title),

      trailing: Checkbox(
        value: task.isCompleted,

        onChanged: (value) {
          if (value != null) {
            onChanged(value);
          }
        },
      ),
    );
  }
}
