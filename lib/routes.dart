import 'package:bookclub/screens/home/home.dart';
import 'package:bookclub/screens/login/login.dart';
import 'package:bookclub/screens/signup/signup.dart';

getRoutes() {
  return {
    OurLogin.route: (context) => const OurLogin(),
    OurSignup.route: (context) => const OurSignup(),
    HomeScreen.route: (context) => const HomeScreen(),
  };
}
