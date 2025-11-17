import 'package:flutter/material.dart';


class ResetPasswordPage extends StatelessWidget {
  ResetPasswordPage({super.key});


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

                    const SizedBox(height: 20),


                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          foregroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        onPressed: () {
                          // Validate the form fields
                          if (_formKey.currentState!.validate()) {
                            showDialog(
                              context: context,
                              builder: (BuildContext ctx) {
                                return const AlertDialog(
                                  title: Text('Message'),
                                  content: Text("Need to implement"),
                                );
                              },
                            );
                          }
                        },
                        child: const Text("Reset Password"),
                      ),
                    ),

                    const SizedBox(height: 10),


                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Back"),
                      ),
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