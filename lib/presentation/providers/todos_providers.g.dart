// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TodoCurrentFilter)
const todoCurrentFilterProvider = TodoCurrentFilterProvider._();

final class TodoCurrentFilterProvider
    extends $NotifierProvider<TodoCurrentFilter, FilterType> {
  const TodoCurrentFilterProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'todoCurrentFilterProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$todoCurrentFilterHash();

  @$internal
  @override
  TodoCurrentFilter create() => TodoCurrentFilter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FilterType value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FilterType>(value),
    );
  }
}

String _$todoCurrentFilterHash() => r'95a15b28dfb0e316a33898e3445d801049365164';

abstract class _$TodoCurrentFilter extends $Notifier<FilterType> {
  FilterType build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<FilterType, FilterType>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<FilterType, FilterType>, FilterType, Object?, Object?>;
    element.handleValue(ref, created);
  }
}

@ProviderFor(TodoInvitados)
const todoInvitadosProvider = TodoInvitadosProvider._();

final class TodoInvitadosProvider
    extends $NotifierProvider<TodoInvitados, List<Todo>> {
  const TodoInvitadosProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'todoInvitadosProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$todoInvitadosHash();

  @$internal
  @override
  TodoInvitados create() => TodoInvitados();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Todo> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Todo>>(value),
    );
  }
}

String _$todoInvitadosHash() => r'e6a9036bb4b2511cdb28b8386ba5cc2a8c5e75e3';

abstract class _$TodoInvitados extends $Notifier<List<Todo>> {
  List<Todo> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<Todo>, List<Todo>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<List<Todo>, List<Todo>>, List<Todo>, Object?, Object?>;
    element.handleValue(ref, created);
  }
}

@ProviderFor(filteredTodos)
const filteredTodosProvider = FilteredTodosProvider._();

final class FilteredTodosProvider
    extends $FunctionalProvider<List<Todo>, List<Todo>, List<Todo>>
    with $Provider<List<Todo>> {
  const FilteredTodosProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'filteredTodosProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$filteredTodosHash();

  @$internal
  @override
  $ProviderElement<List<Todo>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Todo> create(Ref ref) {
    return filteredTodos(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Todo> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Todo>>(value),
    );
  }
}

String _$filteredTodosHash() => r'8833a4e09643bb5556bc01ef8a4145abab38e17c';
