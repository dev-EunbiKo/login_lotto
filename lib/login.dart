import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_lotto/lottery_app/layout_lotto.dart';
import 'package:login_lotto/register.dart';
import 'package:login_lotto/widget/my_container.dart';
import 'package:login_lotto/widget/my_textfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: GestureDetector(
                onTap: () {
                  // 화면의 아무 곳이나 탭하면 소프트 키보드가 사라지게 하는 이벤트 정의
                  FocusScope.of(context).unfocus();
                },
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 80),
                      Image.asset(
                            "images/codingchef.png",
                            width: 150,
                            height: 150,
                          )
                          .animate()
                          .fade()
                          .slideY(begin: -3, end: 0)
                          .animate(onPlay: (controller) => controller.repeat())
                          .shake(
                            hz: 4,
                            curve: Curves.easeInOutCubic,
                            duration: 1800.ms,
                          ),
                      const SizedBox(height: 5),
                      Text(
                            "Welcome Back!",
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                          .animate()
                          .fade(delay: 500.ms)
                          .slideX(begin: -2, end: 0)
                          .tint(color: Colors.purple, delay: 1000.ms),
                      const SizedBox(height: 5),
                      Text(
                        "Sign in to Continue",
                        style: TextStyle(color: Colors.grey[700]),
                      ).animate().fade(delay: 500.ms).slideX(begin: 2, end: 0),
                      const SizedBox(height: 25),
                      MyTextfield(
                        hintText: "Email",
                        obscureText: false,
                        controller: emailController,
                        emailType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 25),
                      MyTextfield(
                        hintText: "Password",
                        obscureText: true,
                        controller: passwordController,
                      ),
                      const SizedBox(height: 25),
                      GestureDetector(
                        onTap: () async {
                          setState(() {
                            showSpinner = true;
                          });
                          try {
                            var member = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );

                            if (member.user != null) {
                              setState(() {
                                showSpinner = false;
                              });
                              if (!mounted) return;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LayoutLotto(),
                                ),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Login Success!"),
                                  backgroundColor: Colors.blue,
                                ),
                              );
                              emailController.clear();
                              passwordController.clear();
                            }
                          } catch (e) {
                            setState(() {
                              showSpinner = false;
                            });
                            debugPrint(e.toString());
                            if (!mounted) return;
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Login Failed!"),
                                backgroundColor: Colors.blue,
                              ),
                            );
                          }
                        },
                        child: MyContainer(
                          width: 120,
                          height: 50,
                          backgroundColor: Colors.orange[200],
                          radius: 20,
                          icon: const Icon(Icons.arrow_forward),
                        ).animate().fade(delay: 1000.ms),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Not a member?",
                            style: TextStyle(color: Colors.grey[700]),
                          ).animate().fade().slideX(
                            begin: -3,
                            end: 0,
                            duration: 300.ms,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Register(),
                                ),
                              );
                            },
                            child: const Text(
                              "Register Now",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ).animate().fade().slideX(
                            begin: 3,
                            end: 0,
                            duration: 300.ms,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              const SizedBox(height: 30),
                              const Text(
                                "Powered by CodingChef",
                                style: TextStyle(fontSize: 11),
                              ).animate().fade().slideX(
                                begin: -3,
                                end: 0,
                                delay: 300.ms,
                              ),
                            ],
                          ),
                          const SizedBox(width: 10),
                          MyContainer(
                                width: 50,
                                height: 50,
                                backgroundColor: Colors.grey[300],
                                radius: 16.0,
                                imagePath: 'images/codingchef3.png',
                              )
                              .animate()
                              .slideX(begin: 3, end: 0, duration: 300.ms)
                              .animate(
                                onPlay: (controller) => controller.repeat(),
                              )
                              .shimmer(delay: 1000.ms, duration: 1800.ms),
                          const SizedBox(width: 20),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (showSpinner)
              const SizedBox(child: Center(child: CircularProgressIndicator())),
          ],
        ),
      ),
    );
  }
}
