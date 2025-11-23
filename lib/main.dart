import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/Providers/localization_provider.dart';
import 'package:evently/Providers/theme_provider.dart';
import 'package:evently/UI/Auth/Forget%20Passwod/forget_password.dart';
import 'package:evently/UI/Auth/Login%20Page/login_page.dart';
import 'package:evently/UI/Auth/Register%20Page/register_page.dart';
import 'package:evently/UI/HomeScreen/create_event.dart';
import 'package:evently/UI/HomeScreen/home_screen.dart';
import 'package:evently/UI/OnboardingScreens/onboarding.dart';
import 'package:evently/UI/OnboardingScreens/start_screen.dart';
import 'package:evently/Utils/app_themes.dart';
import 'package:evently/firebase_options.dart';
import 'package:evently/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:evently/Providers/event_list_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseFirestore.instance.disableNetwork();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocalizationProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => EventListProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var localizationProvider = Provider.of<LocalizationProvider>(context);
    var themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: themeProvider.currentTheme == AppThemes.lightTheme
          ? ThemeMode.light
          : ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      initialRoute: StartScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        CreateEvent.routeName: (context) => const CreateEvent(),
        LoginPage.routeName: (context) => LoginPage(),
        RegisterPage.routeName: (context) => RegisterPage(),
        ForgetPassword.routeName: (context) => const ForgetPassword(),
        StartScreen.routeName: (context) => const StartScreen(),
        Onboarding.routeName: (context) => Onboarding(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,

      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(localizationProvider.currentLocal),
    );
  }
}
