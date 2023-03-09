import 'package:flutter_modular/flutter_modular.dart';
import 'package:hyundai_app/modules/global.dart';
import 'package:hyundai_app/screens/forgot/forgot_page.dart';
import 'package:hyundai_app/screens/forgot/forgot_setup_page.dart';
import 'package:hyundai_app/screens/homepage/home_page.dart';
import 'package:hyundai_app/screens/login/login_page.dart';
import 'package:hyundai_app/screens/onboarding/onboarding_page.dart';
import 'package:hyundai_app/screens/register/register_page.dart';
import 'package:hyundai_app/screens/success/success_page.dart';

class Screens {
  static const home = "/";
  static const onboarding = "/onboarding";
  static const login = "/login";
  static const register = "/register";
  static const forgot = "/forgot";
  static const forgotSetup = "/forgot/setup";
  static const success = "/success";
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
            title: args.queryParams['title']!,
          ),
        ),
        ChildRoute(
          Screens.forgotSetup,
          child: (context, args) => const ForgotSetupPageScreen(),
        ),
        ChildRoute(
          Screens.success,
          child: (context, args) => const SuccessPageScreen(),
        ),
      ];
}
