import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:newbook_app/screens/bottomNav.dart';
import 'package:newbook_app/screens/firebaseAuthPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: firebaseAuthPage(),
    );
  }
}

class firebaseAuthPage extends StatefulWidget {
  @override
  _firebaseAuthPageState createState() => _firebaseAuthPageState();
}

class _firebaseAuthPageState extends State<firebaseAuthPage> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Book Login Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
              ),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  print(FirebaseAuth.instance.currentUser!.uid);
                  FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: usernameController.text, password: passwordController.text)
                      .then((value) async {
                    print("Successfully login!");
                    print(value.user?.uid); // get the UID
                  }).catchError((error) {
                    print("Failed to login.");
                    print(error.toString());
                  });
                },
                child: Text("Login")
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => bottomNav()));
                  // sign up a user and save to Firebase Auth service
                  FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: usernameController.text, password: passwordController.text)
                          .then((value) {
                    print("Successfully sign up the user!");
                    print(value.user!.uid);
                  }).catchError((error) {
                    print("Failed to sign up the user");
                    print(error.toString());
                  });

                  // ucFuture.then((value) {
                  //   print("Successfully sign up the user!");
                  // });
                  //
                  // ucFuture.catchError((error) {
                  //   print("Failed to sign up the user");
                  //   print(error.toString());
                  // });

                },
                child: Text("Signup")

            ),
          ],
        ),
      ),
    );
  }
}