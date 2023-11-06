class ApiUrl {
  static const mainUrl = "https://stock-sync.webziainfotech.com/";
  static const apiUrl = "api/v1/";
  static String baseUrl = mainUrl + apiUrl;

  /// Authentication91234567890
  static String loginUrl = "${baseUrl}login";
  static String logoutUrl = "${baseUrl}logout";

  /// Forgot Password
  static String sendOtpUrl = "${baseUrl}password/reset";
  static String verifyOtpUrl = "${baseUrl}password/verify";
  static String newPasswordUrl = "${baseUrl}password/new";

  /// Profile
  static String profileUrl = "${baseUrl}profile";
  static String profileUpdateUrl = "${baseUrl}profile-update";

  /// Other
  static String routesUrl = "${baseUrl}routes";
  static String updateStatusUrl = "${baseUrl}update-status";
  static String historyUrl = "${baseUrl}history";

  ///Verify shipping
  static String checkUrl = "${baseUrl}route-status/check";
  static String verifyUrl = "${baseUrl}route-status/verify";

  ///Firebase
  static String fcmTokenUrl = "${baseUrl}fcm-token";
}
