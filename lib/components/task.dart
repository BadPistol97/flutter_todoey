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
        trailing: Row(
            mainAxisSize: MainAxisSize.min,
          children: [
            // IconButton(onPressed: ()=>Navigator.pushNamed(context,'detail'), icon: const Icon(Icons.edit)),
            TickBox(index),
          ],
        ),
        leading: SizedBox(
          width: 300.0,
          child: Text(task.name ?? '',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.deepOrange,
                  decoration: task.isChecked ? TextDecoration.lineThrough : null
              )
          ),
        ),
      )
    );
  }
}
