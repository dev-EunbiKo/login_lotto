import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:login_lotto/widget/my_container.dart';
import 'package:login_lotto/widget/my_textfield.dart';
import 'package:login_lotto/lottery_app/lotto.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double currentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: GestureDetector(
            onTap: () {
              // 화면의 아무 곳이나 탭하면 소프트 키보드가 사라지게 하는 이벤트 정의
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 80),
                  Image.asset("images/codingchef.png", width: 150, height: 150)
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
                    onTap: () {
                      // if-else 문으로 이메일과 패스워드 검증 구현
                      if (emailController.text == 'email@email.com' &&
                          passwordController.text == '123456') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Lotto()),
                        );
                      } else if (emailController.text == 'email@email.com' &&
                          passwordController.text != '123456') {
                        // 스낵바
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('패스워드를 확인하세요.'),
                            duration: Duration(seconds: 5),
                          ),
                        );
                      } else if (emailController.text != 'email@email.com' &&
                          passwordController.text == '123456') {
                        // 스낵바
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('이메일을 확인하세요.'),
                            duration: Duration(seconds: 5),
                          ),
                        );
                      } else {
                        // 스낵바
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('로그인 정보를 확인하세요.'),
                            duration: Duration(seconds: 5),
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
                        onPressed: () {},
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
                          .animate(onPlay: (controller) => controller.repeat())
                          .shimmer(delay: 1000.ms, duration: 1800.ms),
                      const SizedBox(width: 20),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
