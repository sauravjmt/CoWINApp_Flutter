import 'package:flutter_cowin_app/api/json_models/verify_otp_response.dart';
import 'package:flutter_cowin_app/api/json_parser/json_parser.dart';

class OTPVerifiedParser extends JsonParser<OTPVerifyResponse>
    with ObjectDecoder<OTPVerifyResponse> {
  const OTPVerifiedParser();

  @override
  Future<OTPVerifyResponse> parseFromJson(String json) async {
    final decoded = decodeJsonObject(json);

    return OTPVerifyResponse.fromJson(decoded);
  }
}
