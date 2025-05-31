import 'package:flutter_bloc/flutter_bloc.dart';

// States
abstract class NavigationState {}

class NavigationInitial extends NavigationState {
  final int currentIndex;
  NavigationInitial(this.currentIndex);
}

// Cubit
class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationInitial(0));

  void changeIndex(int index) {
    emit(NavigationInitial(index));
  }
}
