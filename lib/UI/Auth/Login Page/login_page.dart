import 'package:evently/UI/Auth/Forget%20Passwod/forget_password.dart';
import 'package:evently/UI/Auth/Register%20Page/register_page.dart';
import 'package:evently/UI/HomeScreen/home_screen.dart';
import 'package:evently/UI/Widgets/custom_elevated_bottom.dart';
import 'package:evently/UI/Widgets/custom_text_feild.dart';
import 'package:evently/Utils/app_assets.dart';
import 'package:evently/Utils/app_colors.dart';
import 'package:evently/Utils/app_styles.dart';
import 'package:evently/Utils/toast_utils.dart';
import 'package:evently/gen_l10n/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static const routeName = "/login";

  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // get device width and height
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    // design width and height
    var designWidth = 393;
    var designHeight = 841;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16 / designWidth * width),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.logo,
                    height: 185 / designHeight * height,
                    width: 136 / designWidth * width,
                  ),
                  SizedBox(height: 24 / designHeight * height),
                  CustomTextFeild(
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter your email";
                      } else if (!RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                      ).hasMatch(value)) {
                        return "Please enter a valid email";
                      }
                      return null;
                    },
                    controller: emailController,
                    prefixIcon: Image.asset(AppAssets.emailIc),
                    labelText: AppLocalizations.of(context)!.email,
                  ),
                  SizedBox(height: 16 / designHeight * height),
                  CustomTextFeild(
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter your password";
                      }
                      return null;
                    },
                    obscureText: true,
                    controller: passwordController,
                    prefixIcon: Image.asset(AppAssets.passwordIc),
                    labelText: AppLocalizations.of(context)!.password,
                    suffixIcon: Image.asset(AppAssets.unshowPasswordIc),
                  ),
                  SizedBox(height: 16 / designHeight * height),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            ForgetPassword.routeName,
                          );
                        },
                        child: Text(
                          AppLocalizations.of(context)!.forget_password,
                          style: AppStyles.bold16Primary.copyWith(
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.primaryLight,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24 / designHeight * height),
                  CustomElevatedBottom(
                    onPressed: login,
                    text: AppLocalizations.of(context)!.login,
                  ),
                  SizedBox(height: 24 / designHeight * height),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.dont_have_account,
                        style: AppStyles.medium16Black,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RegisterPage.routeName);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.create_account,
                          style: AppStyles.bold16Primary.copyWith(
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.primaryLight,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16 / designHeight * height),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16 / designWidth * width,
                    ),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Divider(
                            color: AppColors.primaryLight,
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.0 / designWidth * width,
                          ),
                          child: Text(
                            AppLocalizations.of(context)!.or,
                            style: AppStyles.regular24Primary,
                          ),
                        ),
                        const Expanded(
                          child: Divider(
                            color: AppColors.primaryLight,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24 / designHeight * height),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16 / designWidth * width,
                        vertical: 16 / designHeight * height,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: AppColors.primaryLight,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppAssets.googleIc),
                          SizedBox(width: 10 / designWidth * width),
                          Text(
                            AppLocalizations.of(context)!.login_with_google,
                            style: AppStyles.medium20Primary,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 24 / designHeight * height),
                  Container(
                    width: 60 / designWidth * width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        width: 2,
                        color: AppColors.primaryLight,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppAssets.englishIc),
                        SizedBox(width: 8 / designWidth * width),
                        Image.asset(AppAssets.arabicIc),
                      ],
                    ),
                  ),
                  SizedBox(height: 16 / designHeight * height),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void login() async {
    if (formKey.currentState!.validate()) {
      try {
        CircularProgressIndicator();
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
              email: emailController.text,
              password: passwordController.text,
            );
        print('User logged in: ${credential.user?.email}');
        CustomToast.showToast(message: "Login successful");
        Navigator.pushNamed(context, HomeScreen.routeName);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
          CustomToast.showToast(message: "No user found for that email.");
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
          CustomToast.showToast(
            message: "Wrong password provided for that user.",
          );
        }
      } catch (e) {
        print(e);
        CustomToast.showToast(message: "An error occurred. $e");
      }
    }
  }
}
