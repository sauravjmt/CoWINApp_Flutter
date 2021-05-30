class GenerateOTP {
  final String mobile;

  GenerateOTP(this.mobile);

  Map<String, String> toJson() => {'mobile': mobile};
}
