import 'package:flutter/material.dart';

import '../../domain/utils/app_colors.dart';
import '../../domain/utils/mock_data.dart';

class UpdatesScreen extends StatelessWidget {
  const UpdatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          "Updates",
          style: TextStyle(fontSize: 28, fontWeight: .w400),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search_rounded, size: 30),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert_rounded, size: 30),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            Text("Status", style: TextStyle(fontSize: 24), textAlign: .start),
            SizedBox(height: 16),
            SizedBox(
              height: 160,
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(width: 16);
                },
                scrollDirection: .horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Container(
                      width: 104,
                      decoration: BoxDecoration(
                        color: Colors.black.withAlpha(2),
                        borderRadius: .circular(24),
                        border: .all(color: Colors.grey),
                      ),
                      child: Column(
                        crossAxisAlignment: .center,
                        children: [
                          SizedBox(height: 16),
                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.amberAccent.withAlpha(
                                    32,
                                  ),
                                  radius: 28,
                                  child: Center(
                                    child: Text(
                                      "PC",
                                      style: TextStyle(
                                        letterSpacing: 1.5,
                                        fontSize: 28,
                                        fontWeight: .w600,
                                        color: Colors.amberAccent,
                                      ),
                                      textAlign: .center,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 48,
                                left: 48,
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: .circle,
                                    color: AppColors.whatsAppGreen,
                                  ),
                                  padding: .all(1),
                                  child: Icon(
                                    Icons.add_rounded,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Container(
                              alignment: .bottomCenter,
                              padding: .only(bottom: 8),
                              height: .infinity,
                              child: Text(
                                "Add\nStatus",
                                textAlign: .center,
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Container(
                      width: 104,
                      padding: .all(8),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/photo.jpg"),
                          fit: .fill,
                        ),
                        borderRadius: .circular(24),
                        border: .all(color: Colors.grey),
                      ),
                      child: Column(
                        crossAxisAlignment: .start,
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Container(
                            padding: .all(2),
                            decoration: BoxDecoration(
                              shape: .circle,
                              color: Colors.transparent,
                              border: .all(
                                color: AppColors.whatsAppGreen,
                                width: 1.5,
                              ),
                            ),
                            child: CircleAvatar(
                              backgroundColor: chats[index].bgColor,
                              maxRadius: 25,
                              child: Text(
                                chats[index].initials,
                                style: TextStyle(
                                  letterSpacing: 1.5,
                                  fontSize: 24,
                                  fontWeight: .w600,
                                  color: Colors.white,
                                ),
                                textAlign: .center,
                              ),
                            ),
                          ),
                          Text(
                            chats[index].name,
                            style: TextStyle(
                              overflow: .ellipsis,
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: .w600,
                            ),
                            maxLines: 2,
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0, bottom: 8),
              child: Text(
                "Channels",
                style: TextStyle(fontSize: 24, fontWeight: .w600),
                textAlign: .start,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: channels.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: .symmetric(vertical: 16),
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              backgroundColor: channels[index].bgColor
                                  .withAlpha(32),
                              radius: 36,
                              child: Center(
                                child: Text(
                                  channels[index].initials,
                                  style: TextStyle(
                                    letterSpacing: 1.5,
                                    fontSize: 28,
                                    fontWeight: .w600,
                                    color: channels[index].bgColor,
                                  ),
                                  textAlign: .center,
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
                                      channels[index].name,
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: .w600,
                                      ),
                                    ),
                                    Text(
                                      channels[index].time,
                                      style: TextStyle(
                                        color: channels[index].unreadCnt > 0
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
                                      visible: channels[index].isSent,
                                      child: Icon(
                                        Icons.done_all_rounded,
                                        color: channels[index].isRead
                                            ? Colors.blue
                                            : Colors.grey,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: channels[index].messageType == 3
                                          ? Row(
                                              children: [
                                                Icon(
                                                  Icons
                                                      .video_camera_back_rounded,
                                                ),
                                                SizedBox(width: 4),
                                                Text(
                                                  "Video",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ],
                                            )
                                          : channels[index].messageType == 2
                                          ? Row(
                                              children: [
                                                Icon(Icons.image),
                                                SizedBox(width: 4),
                                                Text(
                                                  "Image",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ],
                                            )
                                          : Text(
                                              channels[index].message,
                                              style: TextStyle(
                                                fontSize: 18,
                                                overflow: .ellipsis,
                                              ),
                                            ),
                                    ),
                                    SizedBox(width: 8),
                                    Visibility(
                                      visible: channels[index].unreadCnt > 0,
                                      child: Badge.count(
                                        padding: .symmetric(vertical: 4),
                                        count: channels[index].unreadCnt,
                                        textColor: Colors.white,
                                        textStyle: TextStyle(fontSize: 16),
                                        backgroundColor:
                                            AppColors.whatsAppGreen,
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
      ),
    );
  }
}
