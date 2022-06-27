import 'package:flutter/material.dart';
import 'package:river/components/task.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river/state_providers/providers.dart';
import 'package:river/models/task_model.dart';

class TaskList extends ConsumerStatefulWidget {

  const TaskList({Key? key}): super(key: key);

  @override
  TaskListState createState() => TaskListState();
}

class TaskListState extends ConsumerState<TaskList> {

  @override
  Widget build(BuildContext context) {

    // String task = ref.watch(dataProvider)[index];
    List<TaskModel> tasks = ref.watch(tasksStateProvider);
    // List<String> tasks = ref.watch(dataStateProvider);

    return Expanded(
      child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
          ),
          child: ListView.builder(
            itemBuilder: (context,index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.horizontal,
                onDismissed: (direction) {
                    if(direction == DismissDirection.endToStart) ref.read(tasksStateProvider.notifier).removeTask(tasks[index].id);

                  },
                confirmDismiss: (direction) async{
                  if(direction == DismissDirection.startToEnd) {
                    ref.read(taskIndexProvider.state).state = index;
                    Navigator.pushNamed(context,'detail');
                    return false;
                  }

                  return true;
                },
                background: Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 20.0),
                  color: Colors.orangeAccent,
                  child: const Icon(Icons.edit, color: Colors.white),
                ),
                secondaryBackground: Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 20.0),
                  color: Colors.pink,
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                child: Task(index:index),
              );
            },
            itemCount: tasks.length,
          )
      ),
    );
  }
}
