import 'package:flutter_modular/flutter_modular.dart';
import 'package:hyundai_app/modules/generic.dart';
import 'package:hyundai_app/modules/global.dart';
import 'package:hyundai_app/screens/balance/balance_expiry_page.dart';
import 'package:hyundai_app/screens/balance/balance_history_page.dart';
import 'package:hyundai_app/screens/balance/balance_page.dart';
import 'package:hyundai_app/screens/challenges/challenges_page.dart';
import 'package:hyundai_app/screens/forgot/forgot_page.dart';
import 'package:hyundai_app/screens/forgot/forgot_setup_page.dart';
import 'package:hyundai_app/screens/homepage/home_page.dart';
import 'package:hyundai_app/screens/login/login_page.dart';
import 'package:hyundai_app/screens/notification/notification_page.dart';
import 'package:hyundai_app/screens/onboarding/onboarding_page.dart';
import 'package:hyundai_app/screens/register/register_page.dart';
import 'package:hyundai_app/screens/scanner/scanner_page.dart';
import 'package:hyundai_app/screens/success/success_page.dart';

class Screens {
  static const home = "/";
  static const onboarding = "/onboarding";
  static const login = "/login";
  static const register = "/register";
  static const forgot = "/forgot";
  static const forgotSetup = "/forgot/setup";
  static const success = "/success";
  static const scanner = "/scanner";
  static const notification = "/notification";
  static const balance = "/balance";
  static const balanceHistory = "/balance/history";
  static const balanceExpiry = "/balance/expiry";
  static const challenges = "/challenges";
}

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: Screens.onboarding);

  @override
  bool canActivate(String path, ModularRoute route) {
    return Global.isLoggedIn;
  }
}

class RouteModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Screens.home,
          child: (context, args) => const HomePageScreen(),
          guards: [AuthGuard()],
        ),
        ChildRoute(
          Screens.onboarding,
          child: (context, args) => const OnBoardingPageScreen(),
        ),
        ChildRoute(
          Screens.login,
          child: (context, args) => const LoginPageScreen(),
        ),
        ChildRoute(
          Screens.register,
          child: (context, args) => const RegisterPageScreen(),
        ),
        ChildRoute(
          Screens.forgot,
          child: (context, args) => ForgotPageScreen(
            title: TitlePageType.fromJson(args.data).title,
          ),
        ),
        ChildRoute(
          Screens.forgotSetup,
          child: (context, args) => const ForgotSetupPageScreen(),
        ),
        ChildRoute(
          Screens.success,
          child: (context, args) => SuccessPageScreen(
            title: ResultPageType.fromJson(args.data).title,
            description: ResultPageType.fromJson(args.data).description,
          ),
        ),
        ChildRoute(
          Screens.scanner,
          child: (context, args) => const ScannerPageScreen(),
        ),
        ChildRoute(
          Screens.notification,
          child: (context, args) => const NotificationPageScreen(),
        ),
        ChildRoute(
          Screens.balance,
          child: (context, args) => const BalancePageScreen(),
        ),
        ChildRoute(
          Screens.balanceHistory,
          child: (context, args) => const BalanceHistoryPageScreen(),
        ),
        ChildRoute(
          Screens.balanceExpiry,
          child: (context, args) => const BalanceExpiryPageScreen(),
        ),
        ChildRoute(
          Screens.challenges,
          child: (context, args) => const ChallengesPageScreen(),
        ),
      ];
}
