import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Align(
                alignment: .centerRight,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_vert_rounded, size: 32),
                ),
              ),
              SizedBox(height: 16),
              RichText(
                textAlign: .center,
                text: TextSpan(
                  text:
                      "Whatsapp will need to verify your phone number. Carrier charges may apply. ",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: .w500,
                  ),
                  children: [
                    TextSpan(
                      text: "What's my number?",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blueAccent,
                        fontWeight: .w800,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
              Container(
                padding: .all(8),
                margin: .symmetric(horizontal: 48),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: .zero,
                  border: .fromLTRB(
                    bottom: BorderSide(color: Color(0xFF1DAA61), width: 1.5),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: .spaceEvenly,
                  mainAxisSize: .min,
                  children: [
                    Expanded(
                      child: Text(
                        "Choose your country",
                        style: TextStyle(fontSize: 18),
                        textAlign: .center,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_drop_down, color: Color(0xFF1DAA61)),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Container(
                padding: .all(8),
                margin: .symmetric(horizontal: 48),
                decoration: BoxDecoration(color: Colors.transparent),
                child: Row(
                  mainAxisAlignment: .spaceEvenly,
                  mainAxisSize: .min,
                  children: [
                    Expanded(
                      flex: 1,
                      child: TextField(
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF1DAA61),
                              width: 1.5,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF1DAA61),
                              width: 1.5,
                            ),
                          ),
                          contentPadding: .all(8),
                          isDense: true,
                          prefix: Icon(Icons.add_rounded, size: 18),
                        ),
                        style: TextStyle(fontSize: 16),
                        textAlign: .center,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: .all(8),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF1DAA61),
                              width: 1.5,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF1DAA61),
                              width: 1.5,
                            ),
                          ),
                          isDense: true,
                          hint: Text(
                            "Phone number",
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                        ),
                        style: TextStyle(fontSize: 16),
                        textAlign: .start,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: Container()),
              SizedBox(
                width: .infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1DAA61),
                  ),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Next",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
