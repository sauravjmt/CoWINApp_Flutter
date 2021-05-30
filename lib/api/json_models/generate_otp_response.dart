class GenerateOTPResponse {
  final String txnId;

  GenerateOTPResponse._(this.txnId);

  factory GenerateOTPResponse.fromJson(Map<String, dynamic> json) =>
      GenerateOTPResponse._(json["txnId"]);

  Map<String, dynamic> toJson() => {"txnId": txnId};
}
