import '../entities/task.dart';

abstract class TaskRepository {
  Future<Task> getTask(String uid);
  Future<List<Task>> getAllTask();
}
