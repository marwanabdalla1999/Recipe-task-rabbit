import '../../../../../core/data/utils/Result.dart';
import '../../entities/CategoryEntity.dart';

abstract class IGetCategories{

  Future<Result<List<CategoryEntity>>> call();
}