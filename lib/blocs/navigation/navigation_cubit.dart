import 'package:flutter_bloc/flutter_bloc.dart';

// The Cubit manages the state, which is just an integer.
class NavigationCubit extends Cubit<int> {
  // The initial state is 0 (the first tab).
  NavigationCubit() : super(0);

  /// Emits a new state with the given tab index.
  void changeTab(int index) {
    emit(index);
  }
}