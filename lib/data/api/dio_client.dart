import 'package:dio/dio.dart';
import 'package:fortuna_libya_representative/data/api/apiconst.dart';
class DioClient {
  DioClient._() {initDio();}
  static final DioClient dioClient = DioClient._();
  Dio? dio;
  initDio() {
    dio = Dio();
     dio?.options.baseUrl = ApiConstant.baseUrl;
  }

}