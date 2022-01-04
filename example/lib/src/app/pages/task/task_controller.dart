import 'package:example/src/app/pages/task/task_presenter.dart';
import 'package:example/src/domain/entities/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class TaskController extends Controller {
  List<Task> _taskList = [];
  List<Task> get taskList => _taskList;
  final TaskPresenter taskPresenter;

  // Presenter should always be initialized this way
  TaskController(taskRepo)
      : taskPresenter = TaskPresenter(taskRepo),
        super() {
    taskPresenter.getAllTask();
  }

  @override
  // this is called automatically by the parent class
  void initListeners() {
    //get all listeners
    taskPresenter.getAllTaskOnNext = (response) {
      _taskList = [];
      _taskList = response.task;
      refreshUI();
    };
    taskPresenter.getAllTaskOnComplete = () {
      print('Task retrieved');
    };
  }
  
  @override
  void onDisposed() {
    taskPresenter.dispose(); // don't forget to dispose of the presenter
    super.onDisposed();
  }
}
