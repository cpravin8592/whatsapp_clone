import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp_clone/domain/constants/app_constants.dart';
import 'package:whatsapp_clone/domain/utils/app_colors.dart';
import 'package:whatsapp_clone/domain/utils/routes.dart';
import 'package:whatsapp_clone/ui/on_boarding/login/cubit/login_cubit.dart';
import 'package:whatsapp_clone/ui/on_boarding/login/cubit/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _tecEmail = TextEditingController(),
      _tecPassword = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isPwdVisible = false, isCnfPwdVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: .stretch,
                spacing: 16,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(
                      fontWeight: .w700,
                      color: AppColors.whatsAppGreen,
                      fontSize: 32,
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return "Email can't be empty";
                      }
                      return null;
                    },
                    controller: _tecEmail,
                    style: TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                      hintText: "Enter your email",
                      hintStyle: TextStyle(fontSize: 18),
                      labelText: "Your Email Here",
                      labelStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                  TextFormField(
                    obscureText: !isPwdVisible,
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return "Password can't be empty";
                      }
                      return null;
                    },
                    controller: _tecPassword,
                    style: TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                      hintText: "Enter password",
                      hintStyle: TextStyle(fontSize: 18),
                      labelText: "Password Here",
                      labelStyle: TextStyle(fontSize: 18),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isPwdVisible = !isPwdVisible;
                          });
                        },
                        icon: Icon(
                          isPwdVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: AppColors.whatsAppGreen,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    width: .infinity,
                    child: BlocConsumer<LoginCubit, LoginState>(
                      listener: (context, state) {
                        if (state is LoginSuccessState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: AppColors.whatsAppGreen,
                              content: Text(
                                "User Logged in successfully!",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                          Navigator.pushReplacementNamed(
                            context,
                            AppRoutes.dashboard,
                          );
                        } else if (state is LoginErrorState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red.shade700,
                              content: Text(
                                state.errMessage,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF1DAA61),
                          ),
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              context.read<LoginCubit>().loginUser(
                                _tecEmail.text,
                                _tecPassword.text,
                              );
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: (state is LoginLoadingState)
                                ? CircularProgressIndicator(color: Colors.white)
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                          ),
                        );
                      },
                    ),
                  ),
                  RichText(
                    textAlign: .center,
                    text: TextSpan(
                      text: "Don't have an account?",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      children: [
                        WidgetSpan(child: SizedBox(width: 4)),
                        WidgetSpan(
                          child: InkWell(
                            onTap: () => Navigator.pushNamed(
                              context,
                              AppRoutes.register,
                            ),
                            child: Text(
                              "Click here to register",
                              style: TextStyle(
                                color: AppColors.whatsAppGreen,
                                fontSize: 16,
                                fontWeight: .w700,
                              ),
                              textAlign: .center,
                            ),
                          ),
                        ),
                      ],
                    ),
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
