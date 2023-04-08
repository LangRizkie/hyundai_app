import 'package:flutter_modular/flutter_modular.dart';
import 'package:hyundai_app/modules/generic.dart';
import 'package:hyundai_app/modules/global.dart';
import 'package:hyundai_app/view/balance/balance_expiry_page.dart';
import 'package:hyundai_app/view/balance/balance_history_page.dart';
import 'package:hyundai_app/view/balance/balance_page.dart';
import 'package:hyundai_app/view/challenges/challenges_page.dart';
import 'package:hyundai_app/view/forgot/forgot_page.dart';
import 'package:hyundai_app/view/forgot/forgot_setup_page.dart';
import 'package:hyundai_app/view/homepage/home_page.dart';
import 'package:hyundai_app/view/login/login_page.dart';
import 'package:hyundai_app/view/my_car/my_car_page.dart';
import 'package:hyundai_app/view/notification/notification_page.dart';
import 'package:hyundai_app/view/onboarding/onboarding_page.dart';
import 'package:hyundai_app/view/partners/detail/partners_detail_page.dart';
import 'package:hyundai_app/view/partners/partners_page.dart';
import 'package:hyundai_app/view/register/register_page.dart';
import 'package:hyundai_app/view/scanner/scanner_page.dart';
import 'package:hyundai_app/view/success/success_page.dart';

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
  static const partners = "/partners";
  static const partnersDetail = "/partners/detail";
  static const challenges = "/challenges";
  static const myCar = "/my_car";
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
          guards: [AuthGuard()],
        ),
        ChildRoute(
          Screens.notification,
          child: (context, args) => const NotificationPageScreen(),
          guards: [AuthGuard()],
        ),
        ChildRoute(
          Screens.balance,
          child: (context, args) => const BalancePageScreen(),
          guards: [AuthGuard()],
        ),
        ChildRoute(
          Screens.balanceHistory,
          child: (context, args) => const BalanceHistoryPageScreen(),
          guards: [AuthGuard()],
        ),
        ChildRoute(
          Screens.balanceExpiry,
          child: (context, args) => const BalanceExpiryPageScreen(),
          guards: [AuthGuard()],
        ),
        ChildRoute(
          Screens.partners,
          child: (context, args) => const PartnersPageScreen(),
          guards: [AuthGuard()],
        ),
        ChildRoute(
          Screens.partnersDetail,
          child: (context, args) => PartnersDetailPageScreen(
            title: PartnersDetailPageType.fromJson(args.data).title,
            description: PartnersDetailPageType.fromJson(args.data).description,
            image: PartnersDetailPageType.fromJson(args.data).image,
            deals: PartnersDetailPageType.fromJson(args.data).deals,
          ),
          guards: [AuthGuard()],
        ),
        ChildRoute(
          Screens.challenges,
          child: (context, args) => const ChallengesPageScreen(),
          guards: [AuthGuard()],
        ),
        ChildRoute(
          Screens.myCar,
          child: (context, args) => const MyCarPageScreen(),
          guards: [AuthGuard()],
        ),
      ];
}
