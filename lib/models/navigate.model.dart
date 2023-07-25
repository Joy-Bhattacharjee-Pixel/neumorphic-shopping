import 'package:get/get.dart';
import 'package:shopping_neumorphic/presentations/authentication/auth.dart';
import 'package:shopping_neumorphic/presentations/authentication/register.dart';
import 'package:shopping_neumorphic/presentations/dashboard/dashboard.dart';

class AppNavigator {
  static Transition transition = Transition.fadeIn;
  static Duration duration = Duration(seconds: 3);

  static const String login = "login";
  static const String register = "register";
  static const String dashboard = "dashboard";

  static navigate({screen}) {
    switch (screen) {
      case login:
        Get.to(() => AuthenticationScreen(),
            duration: duration, transition: transition);
        break;
      case register:
        Get.to(() => RegistrationScreen(),
            duration: duration, transition: transition);
        break;
      case dashboard:
        Get.to(() => Dashboard(), duration: duration, transition: transition);
        break;
      default:
    }
  }
}
