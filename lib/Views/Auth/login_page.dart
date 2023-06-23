import 'package:expense_manager/Controllers/Routes/app_routes.dart';
import 'package:expense_manager/Models/user_model.dart';
import 'package:flutter/material.dart';
import '../../Controllers/Screen/screen_size.dart';
import '../../Controllers/Validations/validators_authentication.dart';
import '../../main.dart';
import '../Widgets/input_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Chave para validar formulário
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // TextFormField base
  final MyTextFormField basicInput = const MyTextFormField.empty();

  // Controllers
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  // FocusNames
  final FocusNode focusEmail = FocusNode();
  final FocusNode focusPassword = FocusNode();

  // Exibir/Ocultar senha
  bool showPassword = true;

  void changingVisibilityOfPassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  void dispose() {
    password.dispose();
    email.dispose();
    formKey.currentState == null ? null : formKey.currentState!.dispose();
    super.dispose();
  }

  void showMySnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Senha/Email Incorretos"),
        duration: Duration(seconds: 3),
      ),
    );
  }

  Future<void> validateLogin() async {
    final FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
    late final bool canLogged;
    final String? correctPassword = (await mysqlUtils.getOne(
      table: "User",
      where: {"Email": email.text},
      fields: "Password",
    ))
        .values
        .first as String?;
    // Se não foi cadastrado
    correctPassword ?? "error";
    canLogged = correctPassword == password.text;
    if (canLogged) {
      final String name = await User.getName(email.text);
      user = User(
        email: email.text,
        name: name,
      );
      Navigator.of(context).popAndPushNamed(AppRoutes.MAIN_MENU_PAGE);
      return;
    }
    showMySnackBar();
  }

  @override
  Widget build(BuildContext context) {
    //* Email
    final Widget emailField = basicInput
        .copyWith(
          controller: email,
          focusName: focusEmail,
          inputAction: TextInputAction.next,
          inputType: TextInputType.name,
          hint: "Email",
          startIcon: Icons.email,
          validator: EntriesValidator.validateEmail,
        )
        .inputField();
    //* Senha
    final Widget passwordField = basicInput
        .copyWith(
          controller: password,
          focusName: focusPassword,
          inputAction: TextInputAction.done,
          inputType: TextInputType.name,
          hint: "Senha",
          startIcon: Icons.lock,
          validator: EntriesValidator.validatePassword,
          obscureText: showPassword,
          suffixIcon: IconButton(
            icon: Icon(
              showPassword ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              changingVisibilityOfPassword();
            },
          ),
          onEditingComplete: () {
            //FocusScope.of(context).requestFocus(focusConfirmPassword);
          },
          onFieldSubmitted: (_) {
            validateLogin();
          },
        )
        .inputField();

    email.text = "pedrodfraga@hotmail.com";
    password.text = "Pedro257!";

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          final FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).colorScheme.secondary,
                    Theme.of(context).colorScheme.background,
                  ],
                ),
              ),
            ),
            Form(
              key: formKey,
              child: SizedBox(
                height: MediaQuery.of(context).size.height - MediaQuery.of(context).viewInsets.bottom,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(
                          top: ScreenSize.maxHeight(context) * 0.15,
                          bottom: ScreenSize.maxHeight(context) * 0.06,
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                        ),
                        child: Column(
                          children: [
                            emailField,
                            passwordField,
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Esqueceu a senha?",
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Clique aqui!",
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: ScreenSize.maxHeight(context) * 0.125,
                          width: ScreenSize.maxWidth(context) * 0.6,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10, top: 20),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                              ),
                              onPressed: () {
                                validateLogin();
                              },
                              child: const Text(
                                "Login",
                                style: TextStyle(fontSize: 18.5),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Não Possui Login?",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(AppRoutes.SIGN_UP_PAGE);
                          },
                          child: Text(
                            "Cadastre-se",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
