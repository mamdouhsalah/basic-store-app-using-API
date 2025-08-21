import 'package:api_app/features/home/model/laptob_model.dart';
import 'package:dio/dio.dart';

final Dio dio = Dio();
Future<List<laptobModel>> getData() async {
  Dio dio = Dio();
  var response = await dio.get('https://elwekala.onrender.com/product/Laptops');
  List data = response.data['product'];
  print(data);

  List<laptobModel> listModel = data
      .map((e) => laptobModel.fromJson(e))
      .toList();
  print(listModel[0].image);
  return listModel;
}
