import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/config/config.dart';
import 'package:riverpod_app/domain/domain.dart';
import 'package:uuid/uuid.dart';

part 'todos_providers.g.dart';

const uuid = Uuid();
enum FilterType {all, completed, pending}

@Riverpod(keepAlive: true)
class TodoCurrentFilter extends _$TodoCurrentFilter {
  @override
  FilterType build() => FilterType.all;

  void changeCurrentFilter(FilterType newFilter){
    state = newFilter;
  }
}



@Riverpod(keepAlive: true)
class TodoInvitados extends _$TodoInvitados {
  @override
  List<Todo> build() => [
    Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
    Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: DateTime.now()),
    Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
    Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: DateTime.now()),
    Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),

  ];


  void toggleTodo(String id){
    state = state.map((todo) {

      if(todo.id == id){
        todo = todo.copyWith(
          completedAt: todo.done ? null : DateTime.now()
        );
      }

      return todo;
    }).toList();
  }

  void createInvitado(String description){
    state = [
      ...state,
        Todo(id: uuid.v4(), description: description, completedAt: null)
     ];

  }
}