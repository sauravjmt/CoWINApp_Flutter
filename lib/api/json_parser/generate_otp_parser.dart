import 'package:flutter_cowin_app/api/json_models/generate_otp_response.dart';
import 'package:flutter_cowin_app/api/json_parser/json_parser.dart';

class GenerateOTPParser extends JsonParser<GenerateOTPResponse>
    with ObjectDecoder<GenerateOTPResponse> {
  const GenerateOTPParser();

  @override
  Future<GenerateOTPResponse> parseFromJson(String json) async {
    final decoded = decodeJsonObject(json);
    return GenerateOTPResponse.fromJson(decoded);
  }
}
