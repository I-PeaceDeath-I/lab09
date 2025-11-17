import 'package:flutter/material.dart';
import 'package:lab06/widgets/reset_password_screen.dart';
import 'package:lab06/widgets/signup_screen.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Builder(
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 3,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Image.asset('lib/assets/flutter.jpg'),
                        ),
                      ),
                    ),
                    Text(
                      'Email:',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: TextFormField(
                        validator: (value) =>
                        value!.isEmpty ? "Email is required" : null,
                      ),
                    ),
                    Text(
                      'Password:',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: TextFormField(
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Password is required";
                          }
                          if (value.length < 7) {
                            return "Password must be at least 7 characters";
                          }
                          return null;
                        },
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpPage(),
                              ),
                            );
                          },
                          child: const Text("Sign up"),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.22,
                            child:  ElevatedButton(
                              onPressed: () => {
                                if (_formKey.currentState!.validate()) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext ctx) {
                                      return const AlertDialog(
                                        title: Text('Message'),
                                        content: Text("Need to implement"),
                                      );
                                    },
                                  ),
                                }
                              },
                              child: const Text("Login",),
                            )
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.22,
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ResetPasswordPage(),
                                ),
                              );
                            },
                            child: const Text("Reset password"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
