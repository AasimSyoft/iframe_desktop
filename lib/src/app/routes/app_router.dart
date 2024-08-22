import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iframe_desktop/src/app/user_profile/presentation/user_wrapper.dart';
import 'package:iframe_desktop/src/features/cart/presentation/cart_view.dart';
import 'package:iframe_desktop/src/features/login/presentation/login_view.dart';
import 'package:iframe_desktop/src/features/login/presentation/verify_otp_view.dart';

import '../../features/cart/presentation/cart_wrapper.dart';
import '../../features/cart/presentation/success_view .dart';
import '../../features/checkout/presentation/checkout_view.dart';
import '../user_profile/presentation/user_view.dart';
import '../user_profile/presentation/widgets/appointment_widget.dart';
import '../user_profile/presentation/widgets/edit_profile.dart';
import '../user_profile/presentation/widgets/manage_address_widget.dart';
import '../user_profile/presentation/widgets/my_enquiry_widget.dart';
import '../user_profile/presentation/widgets/my_files_widget.dart';
import '../user_profile/presentation/widgets/my_meetings_widget.dart';
import '../user_profile/presentation/widgets/my_orders_widget.dart';
import '../user_profile/presentation/widgets/my_services_widget.dart';

part 'app_routes.dart';

/// Singleton class for defining the application's router.
class AppRouter {
  AppRouter._();

  /// The main router for the application, using GoRouter for navigation.
  static final router = GoRouter(
    initialLocation: _Path.login,
    //  '/editProfile',
    //  _Path.userView,
    redirect: _handleRedirect,
    errorPageBuilder: (context, state) =>
        MaterialPage(child: PageNotFound(state.uri.toString())),

    routes: [
      AppRoute(_Path.login, (_) => LoginView(), routes: [
        AppRoute(
          _Path.verifyOtp,
          (state) => const VerifyOtpView(),
        )
      ]),
      ShellRoute(
        builder: (_, __, navigator) => CartWrapper(
          child: navigator,
        ),
        routes: [
          AppRoute(
            _Path.cart,
            (_) => const CartView(),
            routes: [
              AppRoute(
                _Path.checkout,
                (_) => const CheckoutView(),
                routes: [
                  AppRoute(_Path.success, (_) => const OrderSuccessView())
                ],
              ),
            ],
          ),
        ],
      ),
      StatefulShellRoute.indexedStack(
        builder: (_, __, navigator) => UserWrapper(
          child: navigator,
        ),
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            routes: [
              AppRoute(
                useFade: true,
                _Path.userView,
                (_) => const UserProfileView(),
                routes: [
                  AppRoute(
                    useFade: true,
                    _Path.editProfile,
                    (_) => const EditProfileView(),
                  ),
                  AppRoute(
                    useFade: true,
                    _Path.appoitments,
                    (_) => const AppointmentWidget(),
                  ),
                  AppRoute(
                    useFade: true,
                    _Path.myFiles,
                    (_) => const MyFilesWidget(),
                  ),
                  AppRoute(
                    useFade: true,
                    _Path.myEnquiry,
                    (_) => const MyEnquiryWidget(),
                  ),
                  AppRoute(
                    useFade: true,
                    _Path.services,
                    (_) => const MyServicesWidget(),
                  ),
                  AppRoute(
                    useFade: true,
                    _Path.meetings,
                    (_) => const MyMeetingView(),
                  ),
                  AppRoute(
                    useFade: true,
                    _Path.orders,
                    (_) => const MyOrdersWidgetView(),
                  ),
                  AppRoute(
                    useFade: true,
                    _Path.manageAddress,
                    (_) => const ManageAddressWidgetView(),
                  ),
                ],
              ),
            ],
          ),
          // Add other branches here for other tabs if needed
        ],
      ),
    ],
  );
}

/// Custom GoRoute subclass to simplify route declarations.
class AppRoute extends GoRoute {
  /// Constructs an AppRoute.
  ///
  /// - [path]: The route path.
  /// - [builder]: The function to build the widget for this route.
  /// - [routes]: The list of sub-routes.
  /// - [useFade]: Whether to use a fade transition for this route.
  AppRoute(String path, Widget Function(GoRouterState s) builder,
      {List<GoRoute> routes = const [], this.useFade = false})
      : super(
          path: path,
          routes: routes,
          pageBuilder: (context, state) {
            final pageContent = Scaffold(
              body: builder(state),
              resizeToAvoidBottomInset: false,
            );
            if (useFade) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: pageContent,
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              );
            }
            return CupertinoPage(child: pageContent, key: state.pageKey);
          },
        );
  final bool useFade;
}

/// Handles redirection logic for the router.
///
/// This function can be customized to handle different redirection scenarios.
///
/// - [context]: The BuildContext.
/// - [state]: The GoRouterState.
///
/// Returns a string representing the new location to redirect to, or null if no redirection is needed.
String? _handleRedirect(BuildContext context, GoRouterState state) {
  return null;
}

/// A widget to display when a page is not found.
///
/// - [uri]: The URI of the requested page.
class PageNotFound extends StatelessWidget {
  final String uri;
  const PageNotFound(this.uri, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Page not found: $uri')),
    );
  }
}
