import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/config/config.dart';


part 'stream_provider.g.dart';


@Riverpod(keepAlive: true)
@Riverpod(keepAlive: true)
Stream<List<String>> usersInChat(Ref ref) async* {
  var names = <String>['Fernando Herrera'];
  yield names;

  await for (final name in RandomGenerator.randomNameStream()) {
    names = [...names, name]; // <- nueva lista
    yield names;
  }
}
