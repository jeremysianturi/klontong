import 'package:dartz/dartz.dart';

import '../../../core/handle_error/failure.dart';
import '../base_repo/base_repo.dart';

class AddNewMenuUseCase {
  final BaseRepo baseRepo;

  AddNewMenuUseCase({required this.baseRepo});

  Future<Either<Failure, void>> call(Map<String, dynamic> menuItem) async {
    return await baseRepo.addNewMenu(menuItem);
  }
}
