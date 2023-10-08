import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import './splash_screen/my_splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final Future<FirebaseApp> _initalization = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initalization,
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const MaterialApp(
              home: Scaffold(
                body: Center(
                  child: Text('SUD Together App has initalization',
                    style: TextStyle(
                        color: Colors.cyan,
                        fontSize: 40,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            );
          }
          else if(snapshot.hasError){
            return  const MaterialApp(
              home: Scaffold(
                body: Center(
                  child: Text('An Error has been occurred',
                    style: TextStyle(
                        color: Colors.cyan,
                        fontSize: 40,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            );

          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "SUD Together App",
            theme: ThemeData(
                scaffoldBackgroundColor: Colors.black,
                primarySwatch: Colors.blue
            ),
            home:MySplashScreen(),
          );
        }
    );
  }
}
