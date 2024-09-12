import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../core/handle_error/failure.dart';
import '../../domain/usecase/add_menu_usecase.dart';
import 'add_menu_event.dart';
import 'add_menu_state.dart';

class AddMenuBloc extends Bloc<AddMenuEvent, AddMenuState> {
  final AddNewMenuUseCase addNewMenuUseCase;

  AddMenuBloc(this.addNewMenuUseCase) : super(AddMenuInitialState()) {
    on<SubmitMenuEvent>((event, emit) async {
      emit(AddMenuLoadingState());
      final Either<Failure, void> result =
          await addNewMenuUseCase(event.menuItem);
      result.fold(
        (failure) => emit(AddMenuErrorState(message: failure.message)),
        (_) => emit(AddMenuSuccessState()),
      );
    });
  }
}
