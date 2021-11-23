import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:registration_form/color.dart';
import 'package:registration_form/pages/home_page.dart';
import 'package:registration_form/pages/welcome_page.dart';
import 'package:registration_form/services/authentication_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(create: (_) => AuthenticationService(FirebaseAuth.instance),),

        StreamProvider(create: (context) => context.read<AuthenticationService>().authStateChanges, initialData: null,)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Registration Form',
        theme: ThemeData(
          primaryColor: backColor,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    
    if(firebaseUser != null){
      return HomePage();
    }
    return Welcomepage();
  }
}