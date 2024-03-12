import 'package:first_project/src/services/dio_service.dart';

import '../../data/entity/product_model.dart';

class DetailsPageController{

  static storeProduct({required Welcome product}) async{
    var result = await DioService.postData(product.toJson());
    print("Result of storing new Product: $result");
  }

  static updateProduct({required String id,required Welcome product}) async{
    var result = await DioService.putData(product.toJson(), id);
    print("Result of updating a Product: $result");
  }

}