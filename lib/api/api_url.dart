class ApiUrl {
  static const mainUrl = "https://stock-sync.webziainfotech.com/";
  static const apiUrl = "api/v1/";
  static String baseUrl = mainUrl + apiUrl;

  ///Authentication
  static String loginUrl = "${baseUrl}login";
  static String logoutUrl = "${baseUrl}logout";

  ///Forgot Password
  static String sendOtpUrl = "${baseUrl}password/reset";
  static String verifyOtpUrl = "${baseUrl}password/verify";
  static String newPasswordUrl = "${baseUrl}password/new";
}
