import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river/models/task_model.dart';
import 'package:river/state_providers/providers.dart';

class TickBox extends ConsumerStatefulWidget {

  final int index;

  TickBox(this.index);

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };

    if (states.any(interactiveStates.contains)) return Colors.orangeAccent;

    return Colors.deepOrange;
  }

  @override
  TickBoxState createState() => TickBoxState();
}

class TickBoxState extends ConsumerState<TickBox> {

  @override
  Widget build(BuildContext context) {

    TaskModel task = ref.watch(tasksStateProvider)[widget.index];

    return Checkbox(
        checkColor:Colors.white,
        fillColor: MaterialStateProperty.resolveWith(widget.getColor),
        value:task.isChecked,
        onChanged:(isChecked) => ref.read(tasksStateProvider.notifier).toggleTask(task.id)

    );
  }
}
