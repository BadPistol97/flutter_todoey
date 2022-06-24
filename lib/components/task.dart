import 'package:flutter/material.dart';
import 'package:river/components/tickbox.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river/models/task_model.dart';
import 'package:river/state_providers/providers.dart';

class Task extends ConsumerWidget {

  final int index;

  const Task({required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    TaskModel task = ref.watch(tasksStateProvider)[index];

    return Container(
      margin: const EdgeInsets.only(bottom:20.0),
      child: ListTile(
        trailing: TickBox(index),
        leading: Text(task.name ?? '',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                color: Colors.deepOrange,
                decoration: task.isChecked ? TextDecoration.lineThrough : null
            )
        ),
      )
    );
  }
}