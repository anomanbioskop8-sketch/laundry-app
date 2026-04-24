import 'package:app_laundry/core/saas/engine/auto_crud_engine.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AutoCrudCubit<T> extends Cubit<List<T>> {
  final AutoCrudEngine<T> engine;

  AutoCrudCubit(this.engine) : super([]);

  void bind({
    required Stream<List<T>> stream,
    required bool Function(T, String) filter,
    List<T> Function(List<T>)? sort,
  }) {
    stream.listen((data) {
      engine.setData(data);
      emit(engine.apply(filter: filter, sort: sort));
    });
  }

  void search(
    String keyword,
    bool Function(T, String) filter,
    List<T> Function(List<T>)? sort,
  ) {
    engine.search(keyword);
    emit(engine.apply(filter: filter, sort: sort));
  }
}
