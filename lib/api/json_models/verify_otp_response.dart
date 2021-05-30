class OTPVerifyResponse {
  final String token;

  OTPVerifyResponse._(this.token);

  factory OTPVerifyResponse.fromJson(Map<String, dynamic> json) =>
      OTPVerifyResponse._(json["token"]);

  Map<String, dynamic> toJson() => {"token": token};
}
