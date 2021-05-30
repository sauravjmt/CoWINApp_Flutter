import 'package:dio/dio.dart';

import 'json_parser/json_parser.dart';

class RequestREST {
  RequestREST();

  static final _client = Dio(BaseOptions(
    baseUrl: "https://cdn-api.co-vin.in/api",
    connectTimeout: 3000,
    receiveTimeout: 3000,
  ));

  Future<T> executeGet<T>(
    JsonParser<T> parser,
    String endPoints,
  ) async {
    final response = await _client.get<String>(endPoints);
    return parser.parseFromJson(response.data ?? "{}");
  }

  Future<T> executePost<T>(
      JsonParser<T> parser, String endPoints, Map<String, String> data) async {
    final formData = FormData.fromMap(data);
    final response = await _client.post<String>(endPoints, data: data);
    return parser.parseFromJson(response.data ?? "{}");
  }
}
