import 'package:flutter/material.dart';
import 'package:flutter_first_app/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(microseconds: 1000));
      // ignore: use_build_context_synchronously
      await Navigator.pushNamed(context, Routes.baseRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage("assets/images/login.png"),
                fit: BoxFit.contain,
              ),
              "Welcome $name"
                  .text
                  .color(context.accentColor)
                  .xl4
                  .make()
                  .pOnly(top: 24),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        style: const TextStyle(color: Colors.blue),
                        decoration: const InputDecoration(
                          hintText: "Enter username",
                          labelText: "Username",
                        ),
                        onChanged: ((value) {
                          name = value;
                          setState(() {});
                        }),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username cannot be empty.";
                          }

                          return null;
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        style: const TextStyle(color: Colors.blue),
                        decoration: const InputDecoration(
                          hintText: "Enter password",
                          labelText: "Password",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password cannot be empty.";
                          } else if (value.length < 6) {
                            return "Password length should be atleast 6.";
                          }

                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      Material(
                        color: context.primaryColor,
                        borderRadius:
                            BorderRadius.circular(changeButton ? 100 : 8),
                        child: InkWell(
                          onTap: () => moveToHome(context),
                          child: AnimatedContainer(
                            height: 50,
                            width: changeButton ? 80 : 140,
                            alignment: Alignment.center,
                            duration: const Duration(seconds: 1),
                            child: changeButton
                                ? const Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : const Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Material(
                        color: context.primaryColor,
                        borderRadius:
                            BorderRadius.circular(changeButton ? 100 : 8),
                        child: InkWell(
                          onTap: () => moveToHome(context),
                          child: AnimatedContainer(
                            height: 50,
                            width: changeButton ? 80 : 140,
                            alignment: Alignment.center,
                            duration: const Duration(seconds: 1),
                            child: changeButton
                                ? const Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : const Text(
                                    "Sign-Up",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                          ),
                        ),
                      )
                    ],
                    
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      //
    );
  }
}
