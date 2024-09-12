import 'package:dartz/dartz.dart';

import '../../../core/handle_error/failure.dart';
import '../../data/model/post.dart';

abstract class BaseRepo {
  Future<Either<Failure, List<Post>>> getData(
      {required int pageNumber, required int numberOfPostsPerRequest});
  Future<Either<Failure, void>> addNewMenu(
      Map<String, dynamic> menuItem); // New method
}
