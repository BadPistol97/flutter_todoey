import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:river/components/drawer.dart';
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

  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode.addListener((){
      if(focusNode.hasFocus){
        ref.read(isEditingStateProvider.state).state = true;
      }
      if(!focusNode.hasFocus){
        ref.read(isEditingStateProvider.state).state = false;
      }
    });
  }


  @override
  Widget build(BuildContext context) {

    QuillController _controller = QuillController.basic();

    int taskIndex = ref.watch(taskIndexProvider);

    TaskModel task = ref.watch(tasksStateProvider)[taskIndex];

    List<IconButton> appBarButton(){
      if(ref.watch(isEditingStateProvider)) {
        return [IconButton(onPressed: () {focusNode.unfocus();},icon: const Icon(Icons.check))];
      }

      return [IconButton(onPressed: () {},icon: const Icon(Icons.bookmark_border_outlined))];
    }

    return Scaffold(
        appBar:AppBar(
          flexibleSpace: Container(
            color: Colors.deepOrange
          ),
          centerTitle: true,
          title: Container(
            // alignment: Alignment.center,
            // height: 40,
            // child: SizedBox(
            //     child: Image.asset(
            //       'assets/logo.png',
            //     )),
          ),
          actions: appBarButton()
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:20.0),
              child: Container(
                child: Text(task.name ?? '',
                  style: const TextStyle(
                    fontWeight:  FontWeight.bold,
                    fontSize: 30.0,
                  ),
                  textAlign: TextAlign.center,
                )
              ),
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
              showListCheck: false,
              multiRowsDisplay: false,
              showClearFormat: false,
              controller: _controller
            ),
            const SizedBox(height:10.0),
            const Divider(
              height: 1,
              color: Colors.grey,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 10.0),
                child: QuillEditor(
                  controller: _controller,
                  readOnly: false,
                  focusNode: focusNode,
                  scrollable: true,
                  scrollController: ScrollController(),
                  placeholder: 'Describe your task',
                  expands: false,
                  padding: EdgeInsets.zero,
                  autoFocus: false,// true for view only mode
                ),
              ),
            )
          ],
        )
      );

  }
}
