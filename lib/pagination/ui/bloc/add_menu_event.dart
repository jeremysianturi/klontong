import 'package:equatable/equatable.dart';

abstract class AddMenuEvent extends Equatable {
  const AddMenuEvent();

  @override
  List<Object?> get props => [];
}

class SubmitMenuEvent extends AddMenuEvent {
  final Map<String, dynamic> menuItem;

  const SubmitMenuEvent(this.menuItem);

  @override
  List<Object?> get props => [menuItem];
}
