import 'package:flutter/material.dart';
import 'package:whatsapp_clone/data/model/message.dart';
import 'package:whatsapp_clone/data/model/user.dart';
import 'package:whatsapp_clone/data/remote/repository/firebase_repository.dart';
import 'package:whatsapp_clone/domain/utils/app_colors.dart';
import 'package:whatsapp_clone/domain/utils/app_utils.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String currUid = "";
  final TextEditingController _tecMessage = TextEditingController();
  bool _isNewConversation = true;

  @override
  void initState() {
    super.initState();
    getCurrentUserId();
  }

  void getCurrentUserId() async {
    currUid = await FirebaseRepository.getCurrentUserId();
    setState(() {});
  }

  @override
  void dispose() {
    _tecMessage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    User toUser = ModalRoute.of(context)!.settings.arguments as User;
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
                  AppUtils.getInitials(toUser.name!),
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
                    toUser.name!,
                    style: TextStyle(fontSize: 20, fontWeight: .w600),
                  ),
                  toUser.isOnline ?? false
                      ? Text("online", style: TextStyle(fontSize: 14))
                      : const SizedBox.shrink(),
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
              child: StreamBuilder(
                stream: FirebaseRepository.getChatStream(
                  currUid,
                  toUser.userId!,
                ),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == .waiting) {
                    return Center(
                      child: Column(
                        spacing: 16,
                        mainAxisAlignment: .center,
                        children: [
                          CircularProgressIndicator(
                            color: AppColors.whatsAppGreen,
                          ),
                          Text(
                            "Getting messages",
                            style: TextStyle(color: AppColors.whatsAppGreen),
                          ),
                        ],
                      ),
                    );
                  } else if (snapshot.hasData &&
                      snapshot.data!.docs.isNotEmpty) {
                    List<Message> messages = snapshot.data!.docs
                        .map<Message>((e) => Message.fromMap(e.data()))
                        .toList();
                    _isNewConversation = false;
                    return ListView.builder(
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        Message message = messages[index];
                        bool isSent = message.fromId == currUid;
                        if (!isSent) {
                          if (message.readAt == null) {
                            FirebaseRepository.updateMessageReadStatus(
                              currUid,
                              toUser.userId!,
                              message.msgId!,
                            );
                          }
                        }
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: isSent ? .topRight : .topLeft,
                            child: CustomPaint(
                              painter: BubblePainter(isSent: isSent),
                              child: Container(
                                width: message.message!.length > 40
                                    ? MediaQuery.of(context).size.width - 64
                                    : null,
                                padding: .only(
                                  top: 8,
                                  bottom: 2,
                                  left: isSent ? 8 : 24,
                                  right: isSent ? 24 : 8,
                                ),
                                child: Column(
                                  mainAxisSize: .min,
                                  crossAxisAlignment: .start,
                                  children: [
                                    Text(
                                      message.message ?? "",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Row(
                                      mainAxisSize: .min,
                                      spacing: 4,
                                      mainAxisAlignment: .end,
                                      children: [
                                        Text(
                                          AppUtils.getMessageTime(
                                            message.sentAt ?? 0,
                                          ),
                                        ),
                                        isSent
                                            ? Icon(
                                                Icons.done_all_rounded,
                                                color: message.readAt != null
                                                    ? Colors.blueAccent
                                                    : Colors.grey.shade500,
                                                size: 16,
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
                    );
                  }
                  return const SizedBox.shrink();
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
                            icon: Icon(
                              Icons.emoji_emotions_outlined,
                              fontWeight: .w700,
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              controller: _tecMessage,
                              decoration: InputDecoration(border: .none),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.attach_file_rounded,
                              fontWeight: .w700,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.camera_alt_outlined,
                              fontWeight: .w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: AppColors.whatsAppGreen,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      try {
                        FirebaseRepository.sendMessage(
                          toUser.userId!,
                          1,
                          _tecMessage.text,
                          null,
                          _isNewConversation,
                        );
                        _tecMessage.clear();
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red.shade700,
                            content: Text(
                              e.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      }
                    },
                    icon: Icon(Icons.send_rounded),
                  ),
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
  final bool isSent;

  const BubblePainter({required this.isSent});

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

    if (isSent) {
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
