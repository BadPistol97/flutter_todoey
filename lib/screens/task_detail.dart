import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river/components/drawer.dart';
import 'package:river/state_providers/providers.dart';
import 'package:river/models/task_model.dart';
import 'package:river/components/tickbox.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;

class TaskDetailScreen extends ConsumerStatefulWidget {
  const TaskDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends ConsumerState<TaskDetailScreen> {
  @override
  Widget build(BuildContext context) {

    QuillController _controller = QuillController.basic();

    final FocusNode _focusNode = FocusNode();

    int taskIndex = ref.watch(taskIndexProvider);

    TaskModel task = ref.watch(tasksStateProvider)[taskIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor:Colors.deepOrange,
      ),
      drawer: const SideBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              child: Text(task.name ?? '',
                style: const TextStyle(
                  fontWeight:  FontWeight.bold,
                  fontSize: 30.0,
                ),
                textAlign: TextAlign.center,
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(task.isChecked ? 'Done' : 'Undone'),
                TickBox(taskIndex),
              ],
            ),
            const SizedBox(height:20.0),
            QuillToolbar.basic(
              showStrikeThrough: false,
              showCodeBlock: false,
              showLink: false,
              showVideoButton: false,
              showImageButton: false,
              showBackgroundColorButton: false,
              showQuote: false,
              showUndo: false,
              showRedo: false,
              showListCheck: false,
              multiRowsDisplay: false,
              showClearFormat: false,
              controller: _controller
            ),
            const SizedBox(height:10.0),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: QuillEditor(
                  controller: _controller,
                  readOnly: false,
                  focusNode: _focusNode,
                  scrollable: true,
                  scrollController: ScrollController(),
                  placeholder: 'Add content',
                  expands: false,
                  padding: EdgeInsets.zero,
                  autoFocus: false,// true for view only mode
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
