import 'package:expense_manager/Controllers/Routes/app_routes.dart';
import 'package:expense_manager/Views/Auth/sign_up_page.dart';
import 'package:expense_manager/Views/main_menu_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mysql_utils/mysql_utils.dart';
import 'Models/Data/mysql_connection.dart';
import 'Models/user_model.dart';
import 'Views/Auth/login_page.dart';
import 'Views/Themes/theme_dark.dart';
import 'Views/Themes/theme_light.dart';

void main() => runApp(const ExpensesApp());

late final MysqlUtils mysqlUtils;
late final User user;

// TODO: Ao clicar na despesa vc pode dizer se foi paga ou não
class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    mysqlUtils = MySQLConnection.connection;
    return MaterialApp(
      theme: LightTheme.theme,
      darkTheme: DarkTheme.theme,
      themeMode: ThemeMode.light,
      initialRoute: AppRoutes.LOGIN_PAGE,
      routes: {
        AppRoutes.LOGIN_PAGE: (context) => const LoginPage(),
        AppRoutes.MAIN_MENU_PAGE: (context) => const MainMenuPage(),
        AppRoutes.SIGN_UP_PAGE: (context) => const SignUpPage(),
      },
    );
  }
}
