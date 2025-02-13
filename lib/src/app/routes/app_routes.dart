part of 'app_router.dart';

class _Path {
  _Path._();

  static const String product = '/';
  static const String cart = '/';
  static const String home = '/';
  static const String login = '/';
  static const verifyOtp = 'verifyOtp';

  static const String checkout = 'checkout';
  static const String success = 'success';
  static const String userView = '/';
  static const String editProfile = 'editProfile';
  static const String appoitments = 'appoitments';
  static const String myFiles = 'myFiles';
  static const String myEnquiry = 'myEnquiry';
  static const String services = 'services';
  static const String meetings = 'meetings';
  static const String orders = 'orders';
  static const String manageAddress = 'manageAddress';
}

class Routes {
  Routes._();

  static String product = _Path.product;
  static String cart = _Path.cart;
  static String home = _Path.home;
  static String login = _Path.login;
  static const verifyOtp = '/verifyOtp';

  static String checkout = '/checkout';
  static String success = '/checkout/success';
  static String userView = _Path.userView;
  static String editProfile = '/editProfile';
  static String appoitments = '/appoitments';
  static String myFiles = '/myFiles';
  static String myEnquiry = '/myEnquiry';
  static String services = '/services';
  static String meetings = '/meetings';
  static String orders = '/orders';
  static String manageAddress = '/manageAddress';
}
