import '../../domain/entities/task.dart';
import '../../domain/repositories/task_repository.dart';

class DataTaskRepository extends TaskRepository {
  List<Task> tasks;
  // sigleton
  static final DataTaskRepository _instance = DataTaskRepository._internal();
  DataTaskRepository._internal() {
    tasks = <Task>[];
    tasks.addAll([
      Task('test-uid-1', 'Check assignments'),
      Task('test-uid-2', 'Edit bookmarks'),
      Task('test-uid-3', 'Edit Paper')
    ]);
  }
  factory DataTaskRepository() => _instance;

  String get uid => null;

  @override
  Future<List<Task>> getAllTask() async {
    // todo implement get all task
    return tasks;
  }

  @override
  Future<Task> getTask(String uid) {
    // TODO: implement getTask
    throw UnimplementedError();
  }

}
