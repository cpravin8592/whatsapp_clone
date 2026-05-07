import 'package:flutter/material.dart';

class WhatsappHome extends StatelessWidget {
  const WhatsappHome({super.key});

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
              Align(
                alignment: .centerRight,
                child: Container(
                  padding: .all(8),
                  margin: .symmetric(horizontal: 24, vertical: 32),
                  decoration: BoxDecoration(
                    borderRadius: .circular(24),
                    border: .all(color: Colors.grey),
                  ),
                  child: Icon(
                    Icons.accessibility_new_rounded,
                    size: 32,
                    color: Color(0xFF1DAA61),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Image.asset("assets/images/whatsapp_back.png"),
              ),
              Text(
                "Welcome to WhatsApp",
                style: TextStyle(fontSize: 32, fontWeight: .w500),
                textAlign: .center,
              ),
              SizedBox(height: 16),
              RichText(
                textAlign: .center,
                text: TextSpan(
                  text: "Read our ",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: .w500,
                  ),
                  children: [
                    TextSpan(
                      text: "Privacy Policy",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blueAccent,
                        fontWeight: .w800,
                      ),
                    ),
                    TextSpan(
                      text: ". Tap \"Agree and continue\" to accept the ",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: .w500,
                      ),
                    ),
                    TextSpan(
                      text: "Terms of Service",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blueAccent,
                        fontWeight: .w800,
                      ),
                    ),
                    TextSpan(
                      text: ".",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: .w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Container(
                padding: .all(8),
                decoration: BoxDecoration(
                  color: Color(0xFFF7F5F3),
                  borderRadius: .circular(24),
                ),
                child: Row(
                  mainAxisAlignment: .spaceEvenly,
                  mainAxisSize: .min,
                  children: [
                    Icon(Icons.language_rounded),
                    SizedBox(width: 8),
                    Text("English (US)", style: TextStyle(fontWeight: .w500)),
                    SizedBox(width: 8),
                    Icon(Icons.keyboard_arrow_down_rounded),
                  ],
                ),
              ),
              SizedBox(height: 24),
              SizedBox(width: .infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1DAA61),
                  ),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Agree and continue",style: TextStyle(color: Colors.white,fontSize: 18,),),
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
