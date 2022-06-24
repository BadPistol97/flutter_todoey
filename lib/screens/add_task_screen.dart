import 'package:flutter/material.dart';
import 'package:river/constant.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river/state_providers/providers.dart';
import 'package:river/models/task_model.dart';

class AddTaskScreen extends ConsumerWidget {

  // final void Function(Task) setTaskListState;

  final taskInputController = TextEditingController();

  String taskName = '';

  // AddTaskScreen(this.setTaskListState);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final List<TaskModel> tasks = ref.watch(tasksStateProvider);

    return Container(
      color: Color(0xFF757575),
      child: Container(
          decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0)
          ),
          color: Colors.white,

        ),
        child: Container(
          padding:const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Add Task',
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700
                  )
              ),
              const SizedBox(height:20.0,),
              TextField(
                  controller: taskInputController,
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.center,
                  onChanged: (value){
                    taskName = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(hintText:'New Task')
              ),
              const SizedBox(height:20.0,),
              TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    primary:Colors.white
                ),
                onPressed: (){
                  if(taskName != ''){

                    // tasks.add(taskName);

                    // ref.read(dataProvider.state).state = tasks.toList();

                    // ref.read(dataStateProvider.notifier).setData(taskName);

                    ref.read(tasksStateProvider.notifier).addTask(TaskModel(taskName,tasks.length+1));

                    taskInputController.clear();
                  }
                  Navigator.pop(context);
                },
                child: const Text('ADD NEW TASK',
                  style: TextStyle(fontSize: 20, color: Colors.white),),
              ),
            ],
          ),
        ),
      )
    );
  }
}
