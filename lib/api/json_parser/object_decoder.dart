import 'json_parser.dart';
import 'dart:convert';

mixin ObjectDecoder<T> on JsonParser<T> {
  Map<String, dynamic> decodeJsonObject(String json) =>
      jsonDecode(json) as Map<String, dynamic>;
}

mixin ListDecoder<T> on JsonParser<T> {
  List<dynamic> decodeListObject(String json) =>
      jsonDecode(json) as List<dynamic>;
}
