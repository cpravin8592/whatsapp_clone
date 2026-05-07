import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/utils/app_colors.dart';
import '../../domain/utils/mock_data.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_outlined),
            label: "Chats",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud_upload_outlined),
            label: "Statuses",
          ),
        ],
      ),*/
      floatingActionButton: IconButton(
        style: IconButton.styleFrom(
          backgroundColor: AppColors.whatsAppGreen,
          foregroundColor: Colors.white,
          shape: RoundedSuperellipseBorder(borderRadius: .circular(16)),
        ),
        onPressed: () {},
        icon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Icon(Icons.add_comment_rounded, size: 28),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          "WhatsApp",
          style: TextStyle(
            color: AppColors.whatsAppGreen,
            fontSize: 30,
            fontWeight: .w600,
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.qr_code, size: 30)),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.camera_alt_rounded, size: 30),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert_rounded, size: 30),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: .all(16),
            padding: .symmetric(horizontal: 24, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.black12.withAlpha(06),
              borderRadius: .circular(32),
            ),
            child: Row(
              children: [
                Icon(Icons.search_rounded, size: 28),
                SizedBox(width: 16),
                Text("Ask Meta AI or Search", style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: chats.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: .all(16),
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            backgroundColor: chats[index].bgColor.withAlpha(32),
                            radius: 36,
                            child: Center(
                              child: Text(
                                chats[index].initials,
                                style: TextStyle(
                                  letterSpacing: 1.5,
                                  fontSize: 28,
                                  fontWeight: .w600,
                                  color: chats[index].bgColor,
                                ),
                                textAlign: .center,
                              ),
                            ),
                          ),
                          Visibility(
                            visible: chats[index].isTimerOn,
                            child: Positioned(
                              top: 48,
                              left: 48,
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: .circle,
                                  color: Colors.white,
                                ),
                                padding: .all(1),
                                child: Icon(Icons.access_time_rounded),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: .min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Row(
                                mainAxisAlignment: .spaceBetween,
                                children: [
                                  Text(
                                    chats[index].name,
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: .w600,
                                    ),
                                  ),
                                  Text(
                                    chats[index].time,
                                    style: TextStyle(
                                      color: chats[index].unreadCnt > 0
                                          ? AppColors.whatsAppGreen
                                          : Colors.grey,
                                      fontWeight: .w400,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: .only(left: 16),
                              child: Row(
                                children: [
                                  Visibility(
                                    visible: chats[index].isSent,
                                    child: Icon(
                                      Icons.done_all_rounded,
                                      color: chats[index].isRead
                                          ? Colors.blue
                                          : Colors.grey,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: chats[index].messageType == 3
                                        ? Row(
                                            children: [
                                              Icon(
                                                Icons.video_camera_back_rounded,
                                              ),
                                              SizedBox(width: 4),
                                              Text(
                                                "Video",
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            ],
                                          )
                                        : chats[index].messageType == 2
                                        ? Row(
                                            children: [
                                              Icon(Icons.image),
                                              SizedBox(width: 4),
                                              Text(
                                                "Image",
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            ],
                                          )
                                        : Text(
                                            chats[index].message,
                                            style: TextStyle(
                                              fontSize: 18,
                                              overflow: .ellipsis,
                                            ),
                                          ),
                                  ),
                                  SizedBox(width: 8),
                                  Visibility(
                                    visible: chats[index].unreadCnt > 0,
                                    child: Badge.count(
                                      padding: .symmetric(vertical: 4),
                                      count: chats[index].unreadCnt,
                                      textColor: Colors.white,
                                      textStyle: TextStyle(fontSize: 16),
                                      backgroundColor: AppColors.whatsAppGreen,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
