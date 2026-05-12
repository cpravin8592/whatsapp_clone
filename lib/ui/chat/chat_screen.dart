import 'package:flutter/material.dart';
import 'package:whatsapp_clone/domain/utils/app_colors.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  int messageType = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        titleSpacing: 0,
        title: Row(
          spacing: 16,
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue.withAlpha(32),
              radius: 24,
              child: Center(
                child: Text(
                  "PC",
                  style: TextStyle(
                    letterSpacing: 1.5,
                    fontSize: 18,
                    fontWeight: .w600,
                    color: Colors.blue,
                  ),
                  textAlign: .center,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                mainAxisSize: .min,
                children: [
                  Text(
                    "Pravin Chavan",
                    style: TextStyle(fontSize: 18, fontWeight: .w600),
                  ),
                  Text("online", style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/chat_bg.png"),
            fit: .cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  messageType = index % 2;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: messageType == 1 ? .topRight : .topLeft,
                      child: CustomPaint(
                        painter: BubblePainter(messageType: messageType),
                        child: Container(
                          width: MediaQuery.of(context).size.width - 64,
                          padding: .only(
                            top: 8,
                            bottom: 2,
                            left: messageType == 1 ? 8 : 24,
                            right: messageType == 1 ? 24 : 8,
                          ),
                          child: Column(
                            mainAxisSize: .min,
                            crossAxisAlignment: .end,
                            children: [
                              Text(
                                "Hello, My name is Pravin Chavan. Hello, My name is Pravin Chavan. Hello, My name is Pravin Chavan. Hello, My name is Pravin Chavan.",
                                style: TextStyle(fontSize: 18),
                              ),
                              Row(
                                mainAxisSize: .min,
                                spacing: 4,
                                mainAxisAlignment: .end,
                                children: [
                                  Text("08:33"),
                                  messageType == 1
                                      ? Icon(
                                          Icons.done_all,
                                          color: Colors.blueAccent,
                                        )
                                      : const SizedBox.shrink(),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                spacing: 8,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: .circular(32),
                      ),
                      child: Row(
                        spacing: 8,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.emoji_emotions_outlined,fontWeight: .w700,),
                          ),
                          Expanded(child: TextField(decoration: InputDecoration(
                            border: .none
                          ),)),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.attach_file_rounded,fontWeight: .w700,),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.camera_alt_outlined,fontWeight: .w700,),
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(style: IconButton.styleFrom(
                    backgroundColor: AppColors.whatsAppGreen,
                    foregroundColor: Colors.white
                  ),onPressed: (){}, icon: Icon(Icons.mic))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BubblePainter extends CustomPainter {
  final int messageType;

  const BubblePainter({required this.messageType});

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();

    Paint paint = Paint();
    paint.color = Colors.grey.shade300;
    paint.strokeWidth = 1;
    paint.strokeCap = .round;
    paint.style = .stroke;

    double radius = 16;
    double width = size.width;
    double height = size.height;

    if (messageType == 1) {
      path.moveTo(radius, 0);
      path.lineTo(width - 2 * radius, 0);
      path.arcToPoint(
        Offset(width - radius, radius),
        radius: Radius.circular(radius),
      );
      path.lineTo(width - radius, height - radius);
      path.lineTo(width, height);
      path.lineTo(radius, height);
      path.arcToPoint(
        Offset(0, height - radius),
        radius: Radius.circular(radius),
      );
      path.lineTo(0, radius);
      path.arcToPoint(Offset(radius, 0), radius: .circular(radius));
      path.close();
      canvas.drawPath(path, paint);

      paint.color = AppColors.bubbleGreen;
      paint.style = .fill;
      canvas.drawPath(path, paint);
    } else {
      path.moveTo(2 * radius, 0);
      path.lineTo(width - radius, 0);
      path.arcToPoint(Offset(width, radius), radius: Radius.circular(radius));
      path.lineTo(width, height - radius);
      path.arcToPoint(
        Offset(width - radius, height),
        radius: .circular(radius),
      );
      path.lineTo(0, height);
      path.lineTo(radius, height - radius);
      path.lineTo(radius, radius);
      path.arcToPoint(Offset(2 * radius, 0), radius: Radius.circular(radius));
      path.close();
      canvas.drawPath(path, paint);

      paint.color = Colors.white;
      paint.style = .fill;
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
