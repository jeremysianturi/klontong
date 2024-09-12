import 'package:equatable/equatable.dart';

abstract class AddMenuState extends Equatable {
  const AddMenuState();

  @override
  List<Object?> get props => [];
}

class AddMenuInitialState extends AddMenuState {}

class AddMenuLoadingState extends AddMenuState {}

class AddMenuSuccessState extends AddMenuState {}

class AddMenuErrorState extends AddMenuState {
  final String message;

  const AddMenuErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
