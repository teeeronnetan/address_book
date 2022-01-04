import 'package:example/src/app/pages/task/task_controller.dart';
import 'package:example/src/data/repositories/data_task_repository.dart';
import 'package:example/src/domain/entities/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class TaskPage extends View {
  TaskPage({Key key}) : super(key: key);

  @override
  _TaskPageState createState() =>
      // inject dependencies inwards
      _TaskPageState();
}

class _TaskPageState extends ViewState<TaskPage, TaskController> {
  _TaskPageState() : super(TaskController(DataTaskRepository()));

  @override
  Widget get view {
    var globalKey;
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
      ),
      body: Scaffold(
        key:
            globalKey, // built in global key for the ViewState for easy access in the controller
        body: ControlledWidgetBuilder<TaskController>(
            builder: (context, controller) {
          return ListView(
            children: createListTileList(context, controller),
          );
        }),
      ),
      floatingActionButton: ControlledWidgetBuilder<TaskController>(
        builder: (context, controller) {
          return FloatingActionButton(
            onPressed: () {
              createAlertDialog(context, controller, false);
            },
            child: Icon(Icons.add),
          );
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

List<Widget> createListTileList(context, controller) {
  final tileList = <Widget>[];
  controller.taskList.forEach((Task task) {
    tileList.add(ListTile(
      leading: Wrap(spacing: 1, children: <Widget>[
      ]),
      trailing: Wrap(spacing: 0, children: <Widget>[

      ]),
      title: Text(task.description),
    ));
  });
  return tileList;
}

Future<String> createAlertDialog(
    BuildContext context, TaskController controller, bool isEdit) {
}