import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/data/model/user.dart';

import '../../../domain/utils/app_colors.dart';
import 'cubit/register_cubit.dart';
import 'cubit/register_state.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _tecName = TextEditingController(),
      _tecEmail = TextEditingController(),
      _tecPassword = TextEditingController(),
      _tecCnfPassword = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isPwdVisible = false, isCnfPwdVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.whatsAppGreen,
      ),
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
                    "Register",
                    textAlign: .start,
                    style: TextStyle(
                      fontWeight: .w700,
                      color: AppColors.whatsAppGreen,
                      fontSize: 32,
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return "Name can't be empty";
                      }
                      return null;
                    },
                    controller: _tecName,
                    style: TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                      hintText: "Enter your name",
                      hintStyle: TextStyle(fontSize: 18),
                      labelText: "Your Name Here",
                      labelStyle: TextStyle(fontSize: 18),
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
                  TextFormField(
                    obscureText: !isCnfPwdVisible,
                    validator: (value) {
                      if (value != null && value != _tecPassword.text) {
                        return "Password and Confirm Password must match!";
                      }
                      return null;
                    },
                    controller: _tecCnfPassword,
                    style: TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                      hintText: "Confirm password",
                      hintStyle: TextStyle(fontSize: 18),
                      labelText: "Confirm Password Here",
                      labelStyle: TextStyle(fontSize: 18),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isCnfPwdVisible = !isCnfPwdVisible;
                          });
                        },
                        icon: Icon(
                          isCnfPwdVisible
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
                    child: BlocConsumer<RegisterCubit, RegisterState>(
                      listener: (context, state) {
                        if (state is RegisterSuccessState) {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.green.shade700,
                                content: Text(
                                  "User registered successfully!",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                            Navigator.pop(context);
                          }
                        } else if (state is RegisterErrorState) {
                          if (context.mounted) {
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
                        }
                      },
                      builder: (context, state) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF1DAA61),
                          ),
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              User user = User(
                                userId: null,
                                name: _tecName.text,
                                email: _tecEmail.text,
                                createdAt:
                                    DateTime.now().millisecondsSinceEpoch,
                                isOnline: false,
                                status: 1,
                                profilePic: "",
                                profileStatus: 1,
                              );
                              context.read<RegisterCubit>().registerUser(
                                user,
                                _tecPassword.text,
                              );
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: state is RegisterLoadingState
                                ? CircularProgressIndicator(color: Colors.white)
                                : Text(
                                    "Register",
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
                      text: "Already have an account?",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      children: [
                        WidgetSpan(child: SizedBox(width: 4)),
                        WidgetSpan(
                          child: InkWell(
                            onTap: () => Navigator.pop(context),
                            child: Text(
                              "Click here to login",
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
