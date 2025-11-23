import 'package:evently/UI/Auth/Login%20Page/login_page.dart';
import 'package:evently/UI/HomeScreen/home_screen.dart';
import 'package:evently/UI/Widgets/custom_elevated_bottom.dart';
import 'package:evently/UI/Widgets/custom_text_feild.dart';
import 'package:evently/Utils/app_assets.dart';
import 'package:evently/Utils/app_colors.dart';
import 'package:evently/Utils/app_styles.dart';
import 'package:evently/gen_l10n/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = "/register";

  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var formKey = GlobalKey<FormState>();

  TextEditingController passwordController = TextEditingController();

  TextEditingController rePasswordController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // get device width and height
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    // design width and height
    var designWidth = 393;
    var designHeight = 841;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteBGColor,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.register,
          style: AppStyles.medium20Primary,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primaryLight),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
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
                      return "Please enter your name";
                    }
                    return null;
                  },
                  controller: nameController,
                  prefixIcon: Image.asset(AppAssets.nameIc),
                  labelText: AppLocalizations.of(context)!.name,
                ),
                SizedBox(height: 16 / designHeight * height),
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
                CustomTextFeild(
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter your password";
                    } else if (value != passwordController.text) {
                      return "Passwords don't match";
                    }
                    return null;
                  },
                  obscureText: true,
                  controller: rePasswordController,
                  prefixIcon: Image.asset(AppAssets.passwordIc),
                  labelText: AppLocalizations.of(context)!.re_password,
                  suffixIcon: Image.asset(AppAssets.unshowPasswordIc),
                ),
                SizedBox(height: 16 / designHeight * height),
                CustomElevatedBottom(
                  onPressed: register,
                  text: AppLocalizations.of(context)!.create_account,
                ),
                SizedBox(height: 16 / designHeight * height),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.aready_have_account,
                      style: AppStyles.medium16Black,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, LoginPage.routeName);
                      },
                      child: Text(
                        AppLocalizations.of(context)!.login,
                        style: AppStyles.bold16Primary.copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primaryLight,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16 / designHeight * height),
                Container(
                  width: 60 / designWidth * width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(width: 2, color: AppColors.primaryLight),
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
    );
  }

  void register() async {
    if (formKey.currentState!.validate()) {
      try {
        final credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: emailController.text,
              password: passwordController.text,
            );
        print("User registered: ${credential.user?.email}");
        Navigator.pushNamed(context, HomeScreen.routeName);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }
  }
}
