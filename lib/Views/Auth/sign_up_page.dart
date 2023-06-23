import 'package:flutter/material.dart';
import '../../Controllers/Routes/app_routes.dart';
import '../../Controllers/Screen/screen_size.dart';
import '../../Controllers/Validations/validators_authentication.dart';
import '../../main.dart';
import '../Widgets/input_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // Chave para validar formulário
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // TextFormField base
  final MyTextFormField basicInput = const MyTextFormField.empty();
  // Controllers
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();

  // FocusNames
  final FocusNode focusUserName = FocusNode();
  final FocusNode focusEmail = FocusNode();
  final FocusNode focusPassword = FocusNode();
  final FocusNode focusConfirmPassword = FocusNode();

  // Exibir/Ocultar senhas
  bool showPassword = true;
  bool showConfirmPassword = true;

  void changingVisibilityOfPassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  void changingVisibilityOfConfirmPassword() {
    setState(() {
      showConfirmPassword = !showConfirmPassword;
    });
  }

  void goToLoginPage(BuildContext context, bool doingSignUp) {
    if (doingSignUp) {
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();
        mysqlUtils.insert(
          table: "User",
          insertData: {
            "Name": username.text,
            "Email": email.text,
            "Password": password.text,
          },
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Cadastro feito com Sucesso"),
            duration: Duration(milliseconds: 1500),
          ),
        );
      } else {
        return;
      }
    }
    Navigator.of(context).popAndPushNamed(AppRoutes.LOGIN_PAGE);
  }

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    confirmPassword.dispose();
    email.dispose();
    phone.dispose();
    formKey.currentState == null ? null : formKey.currentState!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //* Username
    final Widget userNameField = basicInput
        .copyWith(
          controller: username,
          focusName: focusUserName,
          inputAction: TextInputAction.next,
          inputType: TextInputType.name,
          capitalization: TextCapitalization.sentences,
          hint: "Nome",
          startIcon: Icons.email,
          validator: EntriesValidator.validateUsername,
        )
        .inputField();
    //* Email
    final Widget emailField = basicInput
        .copyWith(
          controller: email,
          focusName: focusEmail,
          inputAction: TextInputAction.next,
          inputType: TextInputType.emailAddress,
          hint: "Email",
          startIcon: Icons.email,
          validator: EntriesValidator.validateEmail,
          onEditingComplete: () {
            FocusScope.of(context).requestFocus(focusPassword);
          },
        )
        .inputField();
    //* Senha
    final Widget passwordField = basicInput
        .copyWith(
          controller: password,
          focusName: focusPassword,
          inputAction: TextInputAction.next,
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
            FocusScope.of(context).requestFocus(focusConfirmPassword);
          },
        )
        .inputField();
    //* Confirmar Senha
    final Widget confirmPasswordField = basicInput
        .copyWith(
          controller: confirmPassword,
          focusName: focusConfirmPassword,
          inputAction: TextInputAction.done,
          inputType: TextInputType.name,
          hint: "Confirmar Senha",
          startIcon: Icons.lock,
          validator: (_) {
            final String? validatePasswords = EntriesValidator.validateConfirmPassword(confirmPassword: confirmPassword.text, password: password.text);
            return validatePasswords;
          },
          obscureText: showConfirmPassword,
          suffixIcon: IconButton(
            icon: Icon(
              showConfirmPassword ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              changingVisibilityOfConfirmPassword();
            },
          ),
          onEditingComplete: () {
            //FocusScope.of(context).requestFocus(focusConfirmPassword);
          },
          onFieldSubmitted: (_) {
            goToLoginPage(context, true);
          },
        )
        .inputField();

    username.text = "Pedro";
    email.text = "pedrodfraga@hotmail.com";
    password.text = "Pedro257!";
    confirmPassword.text = "Pedro257!";

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
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
                          top: ScreenSize.maxHeight(context) * 0.085,
                          bottom: ScreenSize.maxHeight(context) * 0.06,
                        ),
                        child: const Text(
                          "Cadastro",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
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
                            userNameField,
                            emailField,
                            passwordField,
                            confirmPasswordField,
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                            fixedSize: Size(ScreenSize.maxWidth(context) * 0.6, ScreenSize.maxHeight(context) * 0.085),
                          ),
                          onPressed: () {
                            goToLoginPage(context, true);
                          },
                          child: const Text(
                            "Cadastre-se",
                            style: TextStyle(fontSize: 18.5),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 18),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Já Possui Cadastro?",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () {
                            goToLoginPage(context, false);
                          },
                          child: Text(
                            "Faça Login",
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
