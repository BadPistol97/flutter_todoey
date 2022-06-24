import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river/state_providers/providers.dart';
import 'package:river/models/task_model.dart';

class SideBar extends ConsumerWidget {
  const SideBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    List<TaskModel> tasks = ref.watch(tasksStateProvider);

    int doneTasks = ref.read(tasksStateProvider.notifier).getDoneTaskCount();

    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20)
        ),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.deepOrange,
              ),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 const SizedBox(height:10.0),
                 const Text('Todoey',
                     style:TextStyle(
                       color: Colors.white,
                       fontWeight: FontWeight.w700,
                       fontSize: 50.0,

                     )
                 ),
                 Text('${tasks.length} ${tasks.length > 1 ? 'tasks' : 'task'} ($doneTasks done)',
                     style:const TextStyle(
                       color: Colors.white,
                       fontWeight: FontWeight.w700,
                       fontSize: 18.0,

                     )
                 ),
               ],
             ),
          ),
          ListTile(
            title: const Text('Home'),
            onTap:() => Navigator.pushNamed(context,'home')
          ),
        ],
      ),
    );
  }
}