import 'package:doctormobile/screens/Pages_Basic/accaount_screens/shartnomalar.dart';
import 'package:doctormobile/screens/Pages_Basic/account_screen.dart';
import 'package:doctormobile/screens/Pages_Basic/home_screen.dart';
import 'package:doctormobile/screens/Pages_Basic/tarifs_screens/flat_security.dart';
import 'package:doctormobile/screens/Pages_Basic/tarifs_screens/saf_bilanobject.dart';
import 'package:doctormobile/screens/auth_and_reg_pages/login_screen.dart';
import 'package:doctormobile/screens/auth_and_reg_pages/reset_password_screen.dart';
import 'package:doctormobile/screens/auth_and_reg_pages/signup_screen.dart';
import 'package:doctormobile/screens/auth_and_reg_pages/verify_email_screen.dart';
import 'package:doctormobile/services/changeColorProvider.dart';
import 'package:doctormobile/services/firebase_streem.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'screens/Pages_Basic/tarifs_screens/object_security.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
    ),
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeProvider.currentTheme,
            routes: {
              '/': (context) => const FirebaseStream(),
              '/home': (context) => const HomeScreen(),
              '/account': (context) => const AccountScreen(),
              '/login': (context) => const LoginScreen(),
              '/signup': (context) => const SignUpScreen(),
              '/reset_password': (context) => const ResetPasswordScreen(),
              '/verify_email': (context) => const VerifyEmailScreen(),
              '/object_security': (context) => const ObjectSecurity(),
              '/shartnoma': (context) => const Shartnomalar(),
              '/flat': (context) => const FlatSecurity(),
              '/from_object': (context) => SimpleForm(),
            },
            initialRoute: '/',
          );
        },
      ),
    );
  }
}
