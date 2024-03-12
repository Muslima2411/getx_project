import 'package:first_project/src/services/dio_service.dart';

import '../entity/product_model.dart';
import 'app_repository.dart';

class AppRepositoryImplementation implements AppRepository {

  @override
  Future<List<Welcome>?> getPosts() async {
    List<Welcome>? list = [];
    list = await DioService.getData();
    return list;
  }
}
